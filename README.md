Getting Your Big Data on with HDInsight
=======================================

This repo contains the MapReduce example. This will need an HDInsight cluster to run on and a 
storage account loaded with the dataset.

The repo contains a project for a console applications, Runner.exe, a class library containing the 
map and reduce implementations and a Test suite for the library.

In order to connect to your cluster you will need to change the connection details in the Runner
app.config.
