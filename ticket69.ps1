$filePath = "C:\Users\TEMP\app.log"

if(Test-Path $filePath)
{
    $content = Get-Content -Path $filePath | ConvertFrom-Json 
        foreach($c in $content){
            if($c.type -eq "error") {
                Write-Host "Id:"$c.Id
                Write-Host "Title":  $c.title
                Write-Host ""
            }
      
        }

}
else
{
    Write-Host "File Not Found!"
}

