# Windows Software Installation Script
# This script automates the installation of essential applications using WinGet.

$apps = @(
    "Mozilla.Firefox",
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "AgileBits.1Password",
    "ONLYOFFICE.DesktopEditors",
    "Google.Antigravity"
)

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   Starting Automated Software Installation   " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

foreach ($app in $apps) {
    Write-Host "`n[+] Installing: $app..." -ForegroundColor Yellow
    winget install --id $app -e --silent --accept-package-agreements --accept-source-agreements
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "[√] Successfully installed $app" -ForegroundColor Green
    }
    else {
        Write-Host "[!] Failed to install $app or it might already be up to date." -ForegroundColor Magenta
    }
}

Write-Host "`n==============================================" -ForegroundColor Cyan
Write-Host "   Installation Process Complete!             " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan