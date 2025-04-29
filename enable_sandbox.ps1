# Replace these variables with your actual Azure SQL Database details
$creds = Get-Content -Path "C:\Users\apriorit\Desktop\Acceptance\sensitive.csv"
$server = $creds[9]
$database = $creds[10]
$username = $creds[11]
$password = $creds[12]
$enablerule = "update [Rule] set active = 1 where ruleid = 142323"

# Connection string
$connectionString = "Server=$server;Database=$database;User Id=$username;Password=$password;Encrypt=True;"

Write-Host "Activation sandbox"
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $enablerule -ConnectionTimeout 30
Write-Host "Replication wait timer 30 sec"
Start-Sleep -Seconds 10
Write-Host "Replication wait timer 20 sec"
Start-Sleep -Seconds 10
Write-Host "Replication wait timer 10 sec"
Start-Sleep -Seconds 10
Write-Host "Done"