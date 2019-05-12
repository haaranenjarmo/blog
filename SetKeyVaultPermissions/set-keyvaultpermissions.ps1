$vaultName = "Add Azure Key Vault Name here"
[string[]]$permissionsToCertificates = "Get","List","Delete","Create","Import","Update",`
    "Managecontacts","Getissuers","Listissuers","Setissuers","Deleteissuers",`
    "Manageissuers","Recover","Backup","Restore","Purge"

[string[]]$permissionsToKeys = "Decrypt","Encrypt","UnwrapKey","WrapKey","Verify","Sign",`
    "Get","List","Update","Create","Import","Delete","Backup","Restore","Recover","Purge"

[string[]]$permissionsToSecrets = "Get","List","Set","Delete","Backup","Restore","Recover","Purge"

$currentAdUser = Get-AzADUser | where {$_.UserPrincipalName -match ((Get-AzContext).Account.Id.Replace('@','_'))}
Set-AzKeyVaultAccessPolicy -VaultName $vaultName -ObjectId $currentAdUser.Id `
    -PermissionsToKeys $permissionsToKeys -PermissionsToSecrets $permissionsToSecrets `
    -PermissionsToCertificates $permissionsToCertificates



