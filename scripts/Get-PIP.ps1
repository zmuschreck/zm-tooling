$pip = (Invoke-WebRequest -uri "http://ifconfig.me/ip").Content
Set-Clipboard -Value $pip
Write-Host "Copied your current public ip ($pip) to Clipboard"