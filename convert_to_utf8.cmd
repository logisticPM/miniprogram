off
powershell
-Command
Get-Content -Path Dockerfile -Encoding ASCII | Set-Content -Path Dockerfile -Encoding UTF8 -Force
