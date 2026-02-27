try {
   $volumes =  Get-Volume | Select-Object -Property Drivetype, SizeRemaining, Size



function kilobyte-Convertor {
    param(
        $value
    )

    if ($value -ge 1000) {
        $gb = [math]::Round($value / 1024, 2)
        return "$gb GB"
    }

    return "$value MB"
}

$volumes | ForEach-Object {

    $sizeTotalGB      = [math]::Round($_.Size / 1MB, 2)
    $sizeRemainingGB  = [math]::Round($_.SizeRemaining / 1MB, 2)

    $convertedRemaining = kilobyte-Convertor $sizeRemainingGB
    $convertedTotal     = kilobyte-Convertor $sizeTotalGB

    [pscustomobject]@{
        TotalSize        = $convertedTotal
        RemainingSize    = $convertedRemaining
    }
} | Format-Table -AutoSize
} 
catch{
    $_.Exception.Message
}