#PowerShell Core Installation commands in Windows PowerShell
$coreVer = 'v6.2.0'
$corePackage = "PowerShell-$($coreVer.Substring(1))-win-x64.msi"
$coreUrl = "https://github.com/PowerShell/PowerShell/releases/download/$coreVer/$corePackage"
$path = "C:\Install\PowerShellCore$coreVer"
$file = "$path\$corePackage"
if(!(Test-Path $path)) {[void](New-Item $path -Type Directory -force)}
Invoke-WebRequest -uri $coreUrl -OutFile $file
$arguments = '/i', "$file", '/qb-!'
Start-Process 'msiexec.exe' -ArgumentList $arguments -NoNewWindow -Wait
Start-Process 'C:\Program Files\PowerShell\6\pwsh.exe' -Wait -PassThru -NoNewWindow
$PSVersionTable
