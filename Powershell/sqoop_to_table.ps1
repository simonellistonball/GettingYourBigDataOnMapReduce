# passwords and account details
. "$PSScriptRoot\secrets.ps1"

$clusterName = "sebeasthdinsight"

$sqlDatabaseServerName = "ac07h8y8yb.database.windows.net"
$sqlDatabaseUserName = $sqlUsername
$sqlDatabasePassword = $sqlPassword
$sqlDatabaseDatabaseName = "AdventureWorks2012"

$schema = "Sales"
$tableName = "SalesOrderDetail"
$hiveTableName = "order_details"

$connection = "jdbc:sqlserver://$sqlDatabaseServerName;user=$sqlDatabaseUserName@$sqlDatabaseServerName;password=$sqlDatabasePassword;database=$sqlDatabaseDatabaseName"
$sqoopDef = New-AzureHDInsightSqoopJobDefinition -Command "import  --connect $connection --table $tableName --hive-import --hive-table $hiveTableName -- --schema $schema" 

$sqoopJob = Start-AzureHDInsightJob -Cluster $clusterName -JobDefinition $sqoopDef #-Debug -Verbose
Wait-AzureHDInsightJob -WaitTimeoutInSeconds 3600 -Job $sqoopJob

Write-Host "Standard Error" -BackgroundColor Red
Get-AzureHDInsightJobOutput -Cluster $clusterName -JobId $sqoopJob.JobId -StandardError
Write-Host "Standard Output" -BackgroundColor Green
Get-AzureHDInsightJobOutput -Cluster $clusterName -JobId $sqoopJob.JobId -StandardOutput