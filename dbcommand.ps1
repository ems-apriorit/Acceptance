# Replace these variables with your actual Azure SQL Database details
$creds = Get-Content -Path "C:\Users\apriorit\Desktop\Acceptance\sensitive.csv"
$server = $creds[9]
$database = $creds[10]
$username = $creds[11]
$password = $creds[12]
$link = $creds[13]
$d_link = $creds[25]
$s_link = $creds[26]
$rules1 = "update [Rule] set active = 0 where customerid = 23490"
$rules2 = "update [Rule] set active = 1 where ruleid in (722654,722641,3274656,722652,722651,722665,722640,722639,722667,722647,3947336,722664,722642,3947337,3947338,3947339,722674,722635,772918,722653,919694,722673,722638,3473214,727651,3947340,722644,722663,722650,722643,722657,722649,3947352,3947353,3947341,3947348,3947347,3947342,3947345,3947344,3947343,3947349,3947346,3947351,3947350,722660,722659,722658,2580030,722645,722675,722646,722666)"
$brand = "update brand set url = '$link' where brandid = 54645"
$dashboard = "update SecureMailOptions set InternalPortalDomain = '$d_link' where customerid = 23490"
$securemail = "update SecureMailOptions set ExternalPortalDomain = '$s_link' where customerid = 23490"

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