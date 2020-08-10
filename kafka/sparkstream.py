from pyspark.sql.types import (StringType, IntegerType, FloatType, 
                               DecimalType, StructField, StructType)

from pyspark.sql import SparkSession

# JARs downloaded from
# https://mvnrepository.com/artifact/org.apache.spark/spark-sql-kafka-0-10
# https://mvnrepository.com/artifact/org.apache.kafka/kafka-clients
spark = SparkSession \
    .builder \
    .appName("Basic Kafka pipeline") \
    .config("spark.driver.extraClassPath",
            "spark-sql-kafka-0-10_2.12-3.0.0.jar:kafka-clients-2.6.0.jar") \
    .config("spark.executor.extraClassPath",
            "spark-sql-kafka-0-10_2.12-3.0.0.jar:kafka-clients-2.6.0.jar") \
    .getOrCreate()

df = spark \
  .readStream \
  .format("kafka") \
  .option("kafka.bootstrap.servers", "localhost:9092") \
  .option("subscribe", "test") \
  .load()
out = df.selectExpr("CAST(key AS STRING)", "CAST(value AS STRING)") \
  .writeStream \
  .outputMode("append") \
  .format("console") \
  .start()

out.awaitTermination()
