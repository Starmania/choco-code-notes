$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/lauthieb/code-notes/releases/download/1.2.1/code-notes-1.2.1.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $url

  softwareName  = 'Code Notes*'
  checksum      = 'ceed1b2c1939d5b9f8ebaf1913f289fb'
  checksumType  = 'md5'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs