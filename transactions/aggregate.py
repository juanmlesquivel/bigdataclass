from datetime import datetime

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, date_format, udf
from pyspark.sql.types import (DateType, IntegerType, FloatType, StructField,
                               StructType, TimestampType)

spark = SparkSession.builder.appName("Read Transactions").getOrCreate()

csv_schema = StructType([StructField('customer_id', IntegerType()),
                         StructField('amount', FloatType()),
                         StructField('purchased_at', TimestampType()),
                         ])

dataframe = spark.read.csv("transactions.csv",
                           schema=csv_schema,
                           header=True)

dataframe.show()

# Add a new column by formatting the original date
formatted_df = dataframe.withColumn("date_string",
                                    date_format(col("purchased_at"),
                                                'MM/dd/yyyy'))
formatted_df.show()

# Create a user defined function
string_to_date = \
    udf(lambda text_date: datetime.strptime(text_date, '%m/%d/%Y'),
        DateType())

typed_df = formatted_df.withColumn(
    "date", string_to_date(formatted_df.date_string))
typed_df.show()
typed_df.printSchema()

# Group By and Select the data already aggregated
sum_df = typed_df.groupBy("customer_id", "date").sum()
sum_df.show()

stats_df = \
    sum_df.select(
        col('customer_id'),
        col('date'),
        col('sum(amount)').alias('amount'))

stats_df.printSchema()
stats_df.show()
