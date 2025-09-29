# Replace these variables with your actual Azure SQL Database details
$creds = Get-Content -Path "C:\Users\apriorit\Desktop\Acceptance\sensitive.csv"
$server = $creds[9]
$database = $creds[10]
$username = $creds[11]
$password = $creds[12]
$link = $creds[13]
$d_link = $creds[25]
$s_link = $creds[26]
$rules1 = "update [Rule] set active = 0 where customerid = 11523"
$rules2 = "update [Rule] set active = 1 where ruleid in (115553, 114457, 114460, 766923, 256624, 488959, 722678, 800265, 919635, 
988320, 1485546, 3276144, 114461, 114462, 114464, 114465, 114466, 114467, 114469, 3947446, 
114471, 114472, 114476, 114477, 114478, 114479, 114483, 114704, 114705, 114706, 115497, 
115547, 115550, 116480, 116554, 117548, 117644, 118743, 120177, 120178, 120179, 120180, 
120183, 120194, 120195, 120197, 120199, 120201, 120202, 120203, 120205, 120208, 120210, 
120211, 120214, 120257, 120375, 121086, 123061, 3314701)"
$brand = "update brand set url = '$link' where brandid = 1000"
$dashboard = "update SecureMailOptions set InternalPortalDomain = '$d_link' where customerid = 11523"
$securemail = "update SecureMailOptions set ExternalPortalDomain = '$s_link' where customerid = 11523"

# Connection string
$connectionString = "Server=$server;Database=$database;User Id=$username;Password=$password;Encrypt=True;"

Write-Host "`nRules deactivation and brand config`n"
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $rules1 -ConnectionTimeout 30
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $brand -ConnectionTimeout 30
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $dashboard -ConnectionTimeout 30
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $securemail -ConnectionTimeout 30
Write-Host "Replication wait timer 20 sec"
Start-Sleep -Seconds 10
Write-Host "Replication wait timer 10 sec`n"
Start-Sleep -Seconds 10
Write-Host "Acceptance run rules activation`n"
Invoke-Sqlcmd -ServerInstance $server -Database $database -Username $username -Password $password -Query $rules2 -ConnectionTimeout 30
Write-Host "Replication wait timer 20 sec"
Start-Sleep -Seconds 10
Write-Host "Replication wait timer 10 sec"
Start-Sleep -Seconds 10