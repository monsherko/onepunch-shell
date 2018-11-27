
 Set-StrictMode -Version 2.0

 Add-Type -AssemblyName System.IO.Compression.FileSystem
 function Unzip
 {
     param([string]$Zipfile, [string]$Path)
     [System.IO.Compression.ZipFile]::ExtractToDirectory($Zipfile, $Path)
 }

  Unzip "C:\a.zip" "C:\a"
