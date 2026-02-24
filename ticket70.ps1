function Get-ServicesByName {
    param(
        [Parameter(Mandatory)]
        [string]$ServiceName
    )

    try {
        $service = Get-Service -Name $ServiceName -ErrorAction Stop

        [PSCustomObject]@{
            Name   = $service.Name
            Status = $service.Status
        }
    }
    catch {
        Write-Error "Service '$ServiceName' was not found."
    }
}

$serviceName = Read-Host "Services"
Get-ServicesByName $serviceName