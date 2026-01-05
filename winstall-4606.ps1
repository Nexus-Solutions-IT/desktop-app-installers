# Windows Software Installation Script
# This script automates the installation of essential applications using WinGet.

# 1. CHECK IF WINGET IS INSTALLED
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget not found! Installing App Installer..." -ForegroundColor Red
    # This command installs the App Installer (Winget) if missing
    Start-Process "ms-windows-store://pdp/?productid=9NBLGGH4NNS1"
    Write-Host "Please install the App Installer from the store window that opened, then run this script again." -ForegroundColor Yellow
    exit
}

# 2. DEFINE APPS
$apps = @(
    "Mozilla.Firefox",
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "AgileBits.1Password",
    "ONLYOFFICE.DesktopEditors"
)

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   Starting Automated Software Installation   " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 3. INSTALL LOOP
foreach ($app in $apps) {
    Write-Host "`n[+] Installing: $app..." -ForegroundColor Yellow
    
    # We use 'cmd /c' to ensure exit codes are captured correctly in all PS versions
    $process = Start-Process winget -ArgumentList "install --id $app -e --silent --accept-package-agreements --accept-source-agreements" -Wait -NoNewWindow -PassThru
    
    if ($process.ExitCode -eq 0) {
        Write-Host "[√] Successfully installed $app" -ForegroundColor Green
    }
    elseif ($process.ExitCode -eq 1641 -or $process.ExitCode -eq 3010) {
        Write-Host "[!] $app installed but requires a REBOOT." -ForegroundColor Yellow
    }
    else {
        Write-Host "[X] Failed to install $app (Exit Code: $($process.ExitCode))" -ForegroundColor Magenta
    }
}

Write-Host "`n==============================================" -ForegroundColor Cyan
Write-Host "   Installation Process Complete!             " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan