# Desktop App Installers

This repository contains an improved PowerShell script for automating the installation of essential Windows applications using **WinGet**.

## 🚀 Applications Installed

The script `winstall-4606.ps1` installs the following software:

- **Mozilla Firefox**: Fast and private web browser.
- **Google Chrome**: Popular web browser by Google.
- **Visual Studio Code**: Powerful, extensible code editor.
- **1Password**: Secure password manager.
- **ONLYOFFICE Desktop Editors**: Comprehensive office suite.

## 🛠️ Features

- **WinGet Check**: Automatically detects if the Windows Package Manager is installed.
- **Robust Error Handling**: Captures specific exit codes to identify successes, failures, and reboot requirements.
- **Silent Installation**: Runs without user prompts for a faster setup.

## 🛠️ Requirements

- **Windows 10 or 11**
- **WinGet** (The script will help you install it if it's missing).

## 📖 How to Use

1.  Open **PowerShell** as an **Administrator**.
2.  Navigate to the directory containing the script.
3.  Run the script using the following command:
    ```powershell
    .\winstall-4606.ps1
    ```

> [!TIP]
> Always run PowerShell as Administrator to ensure the scripts can write to program folders and manage system-level software.
