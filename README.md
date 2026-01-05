# Desktop App Installers

This repository contains a PowerShell script for automating the installation of essential Windows applications using **WinGet**.

## 🚀 Applications Installed

The script `winstall-4606.ps1` installs the following software:

- **Mozilla Firefox**: Web browser.
- **Google Chrome**: Web browser.
- **Visual Studio Code**: Code editor.
- **1Password**: Password manager.
- **ONLYOFFICE Desktop Editors**: Office suite.
- **Google Antigravity**: Specialized utility.

## 🛠️ Requirements

- **Windows 10 or 11**
- **WinGet** (Windows Package Manager) must be installed and available in your PowerShell environment.

## 📖 How to Use

1.  Open **PowerShell** as an **Administrator**.
2.  Navigate to the directory containing the script.
3.  Run the script using the following command:
    ```powershell
    .\winstall-4606.ps1
    ```

> [!NOTE]
> The script uses the `--silent` and `--accept-package-agreements` flags to ensure a smooth, unattended installation process.
