$subscriptionName = ""

$sqlUsername = ""
$sqlPassword = ""
$sqlPasswordSecure = ConvertTo-SecureString $sqlPassword -AsPlainText -Force
$clusterPassword = ConvertTo-SecureString "" -AsPlainText -Force

$sqlMetaStoreServer = ""

$sqlCreds = New-Object System.Management.Automation.PSCredential ($sqlUsername, $sqlPasswordSecure)
$clusterCreds = New-Object System.Management.Automation.PSCredential ($sqlUsername, $clusterPassword)

Select-AzureSubscription $subscriptionName