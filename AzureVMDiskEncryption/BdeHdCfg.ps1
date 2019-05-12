$azVm = "Enter Computer name or IP Address"
$pathBdeHdCfg = "Enter local path where BdeHdCfg folder is"
$cred = Get-Credential
$session = New-PSSession -ComputerName 40.115.116.127 -Credential $cred -Authentication Default
Copy-Item -Path "$pathBdeHdCfg\BdeHdCfg\BdeHdCfg.exe" -Destination C:\Windows\System32 -ToSession $session
Copy-Item -Path "$pathBdeHdCfg\BdeHdCfg\BdeHdCfgLib.dll" -Destination C:\Windows\System32 -ToSession $session
Copy-Item -Path "$pathBdeHdCfg\BdeHdCfg\en-Us\BdeHdCfg.exe.mui" -Destination C:\Windows\System32\en-US -ToSession $session
Copy-Item -Path "$pathBdeHdCfg\BdeHdCfg\en-Us\BdeHdCfgLib.dll.mui" -Destination C:\Windows\System32\en-US -ToSession $session
Invoke-Command -Session $session -ScriptBlock {C:\Windows\System32\bdehdcfg.exe -target default}
