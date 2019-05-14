#region PSCoreInstallation
#PowerShell Core Installation commands in Windows PowerShell
$coreVer = 'v6.2.0'
$corePackage = "PowerShell-$($coreVer.Substring(1))-win-x64.msi"
$coreUrl = "https://github.com/PowerShell/PowerShell/releases/download/$coreVer/$corePackage"
$path = "C:\PowerShellCore$coreVer"
$file = "$path\$corePackage"
if(!(Test-Path $path)) {[void](New-Item $path -Type Directory -force)}
Invoke-WebRequest -uri $coreUrl -OutFile $file
$arguments = '/i', "$file", '/qb-!'
Start-Process 'msiexec.exe' -ArgumentList $arguments -NoNewWindow -Wait
Start-Process 'C:\Program Files\PowerShell\6\pwsh.exe' -Wait -PassThru -NoNewWindow
$PSVersionTable
#endregion PSCoreInstallation
#region NetCoreInstallation
"https://dotnet.microsoft.com/download/thank-you/dotnet-sdk-2.2.203-windows-x64-installer"
#endregion NetCoreInstallation
#region VSCodeInstallationAndConfiguration
#VSCode Installation and configuration PowerShell Core commands
New-Item -Path C:\VisualStudioCode -Type Directory -Force
Invoke-WebRequest -Uri https://go.microsoft.com/fwlink/?Linkid=852157 -OutFile C:\VisualStudioCode\VSCode.x64.exe
C:\VisualStudioCode\VSCode.x64.exe /SILENT
Install-Module -Name Az
'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extensio nms-vscode.powershell
'C:\Program Files\Microsoft VS Code\bin\code.cmd' --install-extension ms-azuretools.vscode-azurefunctions
'C:\Program Files\Microsoft VS Code\bin\code.cmd' --list-extensions
Copy-Item "$Env:APPDATA\Code\User\settings.json" -Destination "$Env:APPDATA\Code\User\settings_orginal.json"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/haaranenjarmo/blog/15-5-2019/VisualStudioCodeSetup/settings.json -OutFile "$Env:APPDATA\Code\User\settings.json"
#Launch VSCode
code
#Exit powerShell core
Exit
#Exit Windows PowerShell
Exit
#region VSCodeInstallationAndConfiguration
