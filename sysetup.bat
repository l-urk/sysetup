chcp 65001
mode con: cols=117 lines=26
set "key=HKEY_CURRENT_USER\Console"

reg add "%key%" /v FaceName /t REG_SZ /d "Consolas" /f
reg add "%key%" /v FontSize /t REG_DWORD /d 0xe /f

curl -L -O https://github.com/valinet/Win11DisableRoundedCorners/releases/download/1.0.0.3/Win11DisableOrRestoreRoundedCorners.exe
start Win11DisableOrRestoreRoundedCorners.exe

reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v HideFileExt /t REG_DWORD /d 0 /f
taskkill /im explorer.exe /f
start /wait explorer.exe

curl -L -O https://github.com/valinet/ExplorerPatcher/releases/download/22621.2861.62.2_9b68cc0/ep_setup.exe
curl -L -O https://github.com/l-urk/Explorer-Patcher-Settings/blob/main/ExplorerPatcher_22621.2861.62.2.reg
start ep_setup.exe

curl -L -O https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.191/OpenShellSetup_4_4_191.exe
curl -L -O https://github.com/l-urk/my_openshell_settings/blob/main/Menu%20Settings.xml
start /wait OpenShellSetup_4_4_191.exe

curl -L -O https://www.autohotkey.com/download/ahk-v2.exe
start /wait ahk-v2.exe

start dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
start dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all
start wsl --set-default-version 2
start wsl --install --distribution kali-linux

curl -L -O https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/PowerShell-7.4.1-win-x64.msi
start /wait PowerShell-7.4.1-win-x64.msi

curl -L -O https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.6.2/npp.8.6.2.Installer.x64.exe
start /wait npp.8.6.2.Installer.x64.exe

curl -L -O https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/Git-2.43.0-64-bit.exe
start /wait Git-2.43.0-64-bit.exe

start /wait cmd.exe /k pwsh -Command "& iwr -useb get.scoop.sh | iex "
start /wait cmd.exe /k pwsh -Command "& powershell Set-ExecutionPolicy RemoteSigned -scope CurrentUser "
start /wait cmd.exe /k pwsh -Command "& powershell scoop install neofetch "