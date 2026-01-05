# Desktop App Installers

A professional PowerShell script for automated, unattended installation of essential Windows applications. This script uses a **Hybrid Approach**, prioritizing **WinGet** and falling back to **Chocolatey** if the primary installation fails.

## 🚀 One-Liner Installation

Run the following command in an **Administrator PowerShell** window to download and execute the script immediately:

```powershell
powershell -ep Bypass -c "irm https://raw.githubusercontent.com/Nexus-Solutions-IT/desktop-app-installers/refs/heads/main/winstall-4606.ps1 | iex"
```

## 🛠️ Features

- **Hybrid Installation**: Primary method is WinGet. If it fails, the script automatically installs Chocolatey (if missing) and tries again.
- **Fail-Safe Mechanism**: Automatically handles the path refresh required after installing Chocolatey.
- **Error Perception**: Specifically detects and reports if a system reboot is required for specific apps.
- **Completely Silent**: All agreements are accepted automatically for a true "set and forget" experience.

## 📦 Included Applications

| Application | WinGet ID | Chocolatey ID |
| :--- | :--- | :--- |
| **Mozilla Firefox** | `Mozilla.Firefox` | `firefox` |
| **Google Chrome** | `Google.Chrome` | `googlechrome` |
| **VS Code** | `Microsoft.VisualStudioCode` | `vscode` |
| **1Password** | `AgileBits.1Password` | `1password` |
| **OnlyOffice** | `ONLYOFFICE.DesktopEditors` | `onlyoffice` |

## 📖 Manual Usage

1.  Open **PowerShell** as an **Administrator**.
2.  Navigate to the directory containing the script.
3.  Execute the script:
    ```powershell
    .\winstall-4606.ps1
    ```

## 🛠️ Requirements

- **Windows 10 or 11**
- Internet connection.
- Administrator privileges.

---
*Maintained by [Nexus Solutions IT](https://github.com/Nexus-Solutions-IT)*
