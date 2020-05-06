# spark-cluster-environment

English | [Español](./README-es.md)

### Introduction
The goal of this project is to deploy a local development environment using containers (docker-compose) to create an Apache Spark cluster to deploy and test spark local **python/scala** jobs.

### Environment deploy
Run *docker/docker-compose up* to deploy the environment, i.e, create network and containers and start them. 

### Example
In **projects** folder we have a typical example of word count in python (PySpark) and a scala example to calculate the value of *pi*. 

Inside the directory **python/word-count**, we have a bash script called *submit-python-spark.bat* (it is so easy translate to *.sh* in case of linux). Running this script, the python job (*counter.py*) will be deployed in the container, and submit the job in the master node. For example, we can see the results in the Visual Studio Code console or Spyder console or terminal console.

Inside **scala/sparkpi**, we have a typical structure of scala project and additionally we have two *.bat* scripts: *sbt.bat* and *submit-scala-spark.bat*. The first is used to clean and package the project (deploying an auxiliary container with *sbt* installed, **so we don't need *sbt* installed locally**). The second one automates the process and deploy the *.jar* file to spark master node. 

Once finished, run *docker-compose down* will delete all the containers and the network, but the used image will be in the docker images local repository (if you want to delete it, do *docker rmi IMAGE_ID*). If you want to use a specific spark or scala version, you have to edit the configuration file *docker-compose.yml* image tag and the *build.sbt* file (*submit-scala-spark.bat* too).
