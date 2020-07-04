from pyspark.sql import SparkSession
from pyspark.sql.types import IntegerType, StringType, StructField, StructType

spark = SparkSession.builder.appName("Basic Read and Print").getOrCreate()

csv_schema = StructType([StructField('id', IntegerType()),
                         StructField('name', StringType())])

dataframe = spark.read.csv("read.csv",
                           schema=csv_schema,
                           header=True)

dataframe.show()
