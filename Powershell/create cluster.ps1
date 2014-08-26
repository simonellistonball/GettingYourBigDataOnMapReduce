# passwords and account details
. "$PSScriptRoot\secrets.ps1"

# configure the cluster

$clusterName = "sebeasthdinsight"
$location = "East US"
$clusterNodes = 2

$storageAccountName = "sebeasthdinsight"
$containerName="hdinsight"


# Get the storage account key
$storageAccountKey = Get-AzureStorageKey $storageAccountName | %{ $_.Primary }

# make the container
#$destContext = New-AzureStorageContext -StorageAccountName $storageAccountName -StorageAccountKey $storageAccountKey  
#New-AzureStorageContainer -Name $containerName -Context $destContext


$sqlMetaStoreDatabase = "HiveMetaStore"

# Select the right subscription"

Select-AzureSubscription -SubscriptionName $subscriptionName
$subId = (Get-AzureSubscription –Current).SubscriptionId


# get the meta store detail
# don't forget to allow azure services to connect to the DB.

$hiveSQLDatabaseServerName = $sqlMetaStoreServer
$hiveSQLDatabaseName = $sqlMetaStoreDatabase
$oozieSQLDatabaseServerName = $sqlMetaStoreServer
$oozieSQLDatabaseName = $sqlMetaStoreDatabase

$oozieCreds = $sqlCreds
$hiveCreds = $sqlCreds


New-AzureHDInsightClusterConfig -ClusterSizeInNodes $clusterNodes |
    #Add-AzureHDInsightMetastore -SqlAzureServerName "$hiveSQLDatabaseServerName" -DatabaseName $hiveSQLDatabaseName -Credential $hiveCreds -MetastoreType HiveMetastore |
    #Add-AzureHDInsightMetastore -SqlAzureServerName "$oozieSQLDatabaseServerName" -DatabaseName $oozieSQLDatabaseName -Credential $oozieCreds -MetastoreType OozieMetastore |
    Set-AzureHDInsightDefaultStorage -StorageAccountName "$storageAccountName.blob.core.windows.net" -StorageAccountKey $storageAccountKey -StorageContainerName $containerName |
        New-AzureHDInsightCluster -Name $clusterName -Location $location -Credential $clusterCreds -Subscription $subId
