from pyspark import SparkContext, SparkConf
 
conf = SparkConf().setAppName("Counter").setMaster("spark://master:7077")
sc = SparkContext(conf=conf)
text_file = sc.textFile("/tmp/data/lorem.txt")
counts = text_file.flatMap(lambda linea: linea.split(" ")).countByValue()

for word, count in counts.items():
    print("------------------")
    print("{} : {}".format(word, count))

sc.stop()