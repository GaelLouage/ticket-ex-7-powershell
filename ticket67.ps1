try {

$activeUsers = Get-ADUser -Filter { Enabled -eq $true } `
    -SearchBase "DC=jsslab,DC=local" `
    -Properties DistinguishedName |
ForEach-Object {

    $dn = $_.DistinguishedName -split ','

    [PSCustomObject]@{
        Name = $dn[0]
        OU   = $dn[1]
    }
}

foreach ($activeU in $activeUsers | Sort-Object OU) {
    Write-Host $activeU.Name
    Write-Host $activeU.OU
    Write-Host ""
}

}
catch {
    $_.Exception.Message
}