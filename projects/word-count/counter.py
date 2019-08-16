from pyspark import SparkContext, SparkConf
import time
 
conf1 = SparkConf().setAppName("contador").setMaster("spark://master:7077")
sc = SparkContext(conf=conf1)
lineas = sc.textFile("/tmp/data/lorem.txt")
contarPalabras = lineas.flatMap(lambda linea: linea.split(" ")).countByValue()
#time.sleep(50)

for palabra, contador in contarPalabras.items():
    print("------------------")
    print("{} : {}".format(palabra, contador))

sc.stop()