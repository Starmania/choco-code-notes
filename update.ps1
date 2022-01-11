import-module au

$gh = 'https://github.com'
$releases = 'https://github.com/lauthieb/code-notes/releases/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url64\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.checksumType64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -MaximumRedirection 0 -UseBasicParsing

    $url64   = $gh + ($download_page.Links | Where-Object href -Match '\.exe$' | ForEach-Object href | Select-Object -First 1)
    $version = $url64 -split '/' | Select-Object -Last 1 -Skip 1

    @{
        URL64   = $url64
        Version = $version

    }
}

update -ChecksumFor 64
