from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Read Transactions").getOrCreate()

dataframe = spark \
    .read \
    .format("jdbc") \
    .option("url", "jdbc:postgresql://host.docker.internal:5433/postgres") \
    .option("user", "postgres") \
    .option("password", "testPassword") \
    .option("dbtable", "transactions") \
    .load()

dataframe.show()
