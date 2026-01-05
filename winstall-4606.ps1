# Windows Software Installation Script (Hybrid: Winget + Chocolatey Backup)
# This script automates the installation of essential applications using WinGet as primary and Chocolatey as backup.

# 1. SETUP APPS LIST (Map Winget IDs to Chocolatey IDs)
$apps = @(
    @{ Name = "Firefox"; WingetID = "Mozilla.Firefox"; ChocoID = "firefox" },
    @{ Name = "Google Chrome"; WingetID = "Google.Chrome"; ChocoID = "googlechrome" },
    @{ Name = "VS Code"; WingetID = "Microsoft.VisualStudioCode"; ChocoID = "vscode" },
    @{ Name = "1Password"; WingetID = "AgileBits.1Password"; ChocoID = "1password" },
    @{ Name = "OnlyOffice"; WingetID = "ONLYOFFICE.DesktopEditors"; ChocoID = "onlyoffice" }
)

# 2. HELPER FUNCTIONS

function Install-Chocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "[-] Chocolatey not found. Installing now..." -ForegroundColor Magenta
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        
        # Refresh environment variables for the current session
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
        Write-Host "[√] Chocolatey Installed!" -ForegroundColor Green
    }
}

# Ensure Winget is checked at the start
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "[!] Winget not found. Primary installation method unavailable." -ForegroundColor Red
}

Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "   Starting Hybrid Software Installation      " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

# 3. INSTALL LOOP
foreach ($app in $apps) {
    $appName = $app.Name
    $wID = $app.WingetID
    $cID = $app.ChocoID

    Write-Host "`n[+] Attempting: $appName (via Winget)..." -ForegroundColor Yellow

    # Try Winget First
    $process = Start-Process winget -ArgumentList "install --id $wID -e --silent --accept-package-agreements --accept-source-agreements" -Wait -NoNewWindow -PassThru

    if ($process.ExitCode -eq 0) {
        Write-Host "[√] $appName installed via Winget." -ForegroundColor Green
    }
    elseif ($process.ExitCode -eq 1641 -or $process.ExitCode -eq 3010) {
        Write-Host "[!] $appName installed (Reboot Required)." -ForegroundColor Yellow
    }
    else {
        # WINGET FAILED -> TRIGGER CHOCOLATEY BACKUP
        Write-Host "[X] Winget failed (Code: $($process.ExitCode)). Trying Chocolatey..." -ForegroundColor Magenta
        
        # Ensure Chocolatey is available
        Install-Chocolatey
        
        # Try Chocolatey
        $chocoProcess = Start-Process choco -ArgumentList "install $cID -y --no-progress" -Wait -NoNewWindow -PassThru
        
        if ($chocoProcess.ExitCode -eq 0 -or $chocoProcess.ExitCode -eq 1641 -or $chocoProcess.ExitCode -eq 3010) {
            Write-Host "[√] $appName installed via Chocolatey." -ForegroundColor Green
        }
        else {
            Write-Host "[X] Failed to install $appName via both methods." -ForegroundColor Red
        }
    }
}

Write-Host "`n==============================================" -ForegroundColor Cyan
Write-Host "   Installation Process Complete!             " -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan