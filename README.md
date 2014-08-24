Getting Your Big Data on with HDInsight
=======================================

This repo contains the MapReduce example. This will need an HDInsight cluster to run on and a 
storage account loaded with the dataset.

The repo contains a project for three console applications, Mapper.exe, Reducer.exe and Runner.exe.

The Runner.exe application will connect to your HDInsight cluster and run the job represented by 
Mapper.exe and Reducer.exe.

In order to connect to your cluster you will need to change the connection details in the Runner
application.config.
