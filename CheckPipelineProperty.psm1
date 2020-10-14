function Check-PipeLineProperty{
   param(
      [Parameter(Mandatory=$true)]
      [string[]]$commands
   )

   try{
       foreach($C in $commands){
    
     Write-Output "`n******************************************************************************************`n"
     Write-Output "`n$c Pipeline Properties`n"

       (Get-Command $C).ParameterSets.parameters | `
       Where {($_.ValuefromPipeline -eq 'True') -or ($_.ValueFromPipelineByPropertyName -eq 'True')} | `
       Select Name,ParameterType, IsMandatory,ValueFromPipeline,ValueFromPipelineByPropertyName | Sort-Object ValueFromPipeline -Descending | ft -AutoSize   
    }
   }

   catch{
      Write-Host $_.Exception.Message -BackgroundColor DarkRed
   }

   

}

