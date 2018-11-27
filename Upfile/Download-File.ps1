function Download-File
{
  <#
  .SYNOPSIS

  File dowloader.DESCRIPTION

  PowerSploit Function: Download-File
  Author: monsherko
  License: GPL v2.0
  Required Dependencies: None
  Optional Dependencies: None

  .DESCRIPTION

  dowload file from url

  .PARAMETER sourceUrl

  url with file

  .PARAMETER destinationFile

  path for dowload file from Url

  .EXAMPLE

  PS C:\Users\sher> Dowload-File  'https://github.com/monsherko/onepunch-shell/archive/master.zip'  'C:\example.zip'

  #>

  [CmdletBinding( DefaultParameterSetName = 'url', SupportsShouldProcess = $True , ConfirmImpact = 'High')] Param (
    [Parameter(Mandatory=$true)]
    [String]
    $sourceUrl,

    [Parameter(Mandatory=$true)]
    [String]
    $destinationFile
  )

   Write-Host "Downloading $destinationFile"
   Remove-Item -Path $destinationFile -Force -ErrorAction Ignore

   [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
   (New-Object System.Net.WebClient).DownloadFile($sourceUrl, $destinationFile)

}
