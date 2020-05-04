# spark-cluster-environment

English | [Español](./README-es.md)

### Introduction
The goal of this project is to deploy a local development environment using containers (docker) to create an Apache Spark cluster to test spark local python jobs.

### Environment deploy
Run *docker/docker-compose up* to deploy the environment, i.e, create network and containers and start them. 

### Example
In **projects** folder we have a typical example of word count. Inside the directory **python/word-count**, we have a bash script called *submit-python-spark.bat* (windows). Running this script, the python job (*counter.py*) will be deployed in the container, and submit the job in the master node. For example, we can see the results in the Visual Studio Code console or Spyder console.

Once finished, run *docker-compose down* will delete all the containers and the network, but the used image will be in the docker images local repository (if you want to delete it, do *docker rmi IMAGE_ID*). If you want to use a specific spark version, you have to edit the configuration file *docker-compose.yml* image tag.
