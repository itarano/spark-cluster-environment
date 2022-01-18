from pyspark.sql import SparkSession
from pyspark.conf import SparkConf

conf = SparkConf().setAppName("Counter").setMaster("spark://spark:7077")

spark = SparkSession.builder.config(conf=conf).getOrCreate()

sc = spark.sparkContext

text_file = sc.textFile("/tmp/data/lorem.txt")

counts = text_file.flatMap(lambda linea: linea.split(" ")).countByValue()

for word, count in counts.items():
    print("------------------")
    print("{} : {}".format(word, count))

sc.stop()
