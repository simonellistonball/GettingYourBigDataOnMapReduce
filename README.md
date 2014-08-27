Getting Your Big Data on with HDInsight
=======================================

This repo contains the MapReduce example. This will need an HDInsight cluster to run on and a 
storage account loaded with the dataset.

The repo contains a project for a console applications, Runner.exe, a class library containing the 
map and reduce implementations and a Test suite for the library.

In order to connect to your cluster you will need to change the connection details in the Runner
app.config.


PowerShell 
----------

To use the PowerShell scripts you will have to setup your Azure PowerShell cmdlets, and also provide
passwords and keys in a file called secrets.ps1 in the same folder as the samples here. I've included 
an empty template for the secrets.ps1 file as secrets_template.ps1, just fill in the variables where 
I've left blank strings.
