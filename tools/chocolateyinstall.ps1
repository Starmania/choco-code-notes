$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url64         = 'https://github.com/lauthieb/code-notes/releases/download/1.2.4/code-notes-1.2.4.exe'

  softwareName  = 'Code Notes*'
  checksum64    = '14371cbdd7e406d6946e2e7912739fae032dbe4e40b83a9ed8b6a9d93dc2f567'
  checksumType  = 'sha256'
  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
