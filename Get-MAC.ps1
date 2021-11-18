
$mac180 = invoke-command $180ANM -ErrorVariable nomac -scriptblock {Get-wmiobject win32_networkadapterconfiguration |where {$_.MACAddress -ne $null } | where {$_.IPAddress -ne $null }  | where {$_.DHCPEnabled -eq "True" } | select pscomputername, macaddress, ipaddress} | Out-GridView -PassThru

$mac180 | Export-csv c:\users\slakumb2\desktop\Mac180.csv -Force

Get-CimInstance win32_networkadapterconfiguration | select description, macaddress | where {$_.MACAddress -ne $null }  | where {$_.Description -match "Intel" }

$mac = Get-wmiobject win32_networkadapterconfiguration |where {$_.MACAddress -ne $null } | where {$_.IPAddress -ne $null }  | where {$_.DHCPEnabled -eq "True" } | select pscomputername, macaddress, ipaddress | Out-GridView -PassThru

$mac180.macaddress | out-file c:\users\slakumb2\desktop\3rdfloorMacOnly.txt -Force