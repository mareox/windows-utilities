# Setup Guide

## 1. FanControl Installation
- **Location:** `C:\Program Files (x86)\FanControl\FanControl.exe`
- **Config:** `C:\Program Files (x86)\FanControl\Configurations\userConfig.json`

### Running at Startup
FanControl is a GUI application and cannot run as a Windows service. It is configured as a **Scheduled Task** instead.

- **Task name:** `FanControl`
- **Trigger:** At logon
- **Privileges:** Highest (admin required for hardware access)
- **Working directory:** `C:\Program Files (x86)\FanControl`

Created via PowerShell:
```powershell
$action = New-ScheduledTaskAction -Execute 'C:\Program Files (x86)\FanControl\FanControl.exe' -WorkingDirectory 'C:\Program Files (x86)\FanControl'
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -RunLevel Highest
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit (New-TimeSpan)
Register-ScheduledTask -TaskName 'FanControl' -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force
```

## 2. HWInfo64 Installation
- **Location:** `C:\Program Files\HWiNFO64\HWiNFO64.EXE`
- **Config:** `C:\Program Files\HWiNFO64\HWiNFO64.INI`
- **Installed via:** Chocolatey (`choco install hwinfo`)

### Why HWInfo?
FanControl uses LibreHardwareMonitor (LHM) by default for temperature readings. LHM has known issues with AMD Ryzen CPUs:
- Temperature readings can be 10+ degrees off
- Newer AMD CPUs have incomplete sensor support
- This caused fan curves to react to incorrect temps, making fans loud

HWInfo provides more accurate AMD CPU temperature readings via its Shared Memory feature.

### Critical HWInfo Settings
1. **Shared Memory Support:** Must be enabled in Settings > General/User Interface
2. **Sensors Only mode:** Enabled in INI (`SensorsOnly=1`)
3. **Minimize on close:** Enabled (`MinimalizeSensorsClose=1`)

### HWInfo INI Settings
```ini
[Settings]
OpenSystemSummary=0
MinimalizeMainWnd=1
MinimalizeSensors=1
ShowWelcomeAndProgress=0
Autorun=1
SensorsOnly=1
SensorsSM=1
Theme=2
AutoUpdateBetaDisable=1
SensorToolTips=0
AutoUpdate=0
MinimalizeSensorsClose=1
TPM=1
```

### HWInfo Scheduled Task
- **Task name:** `HWInfo64`
- **Trigger:** At logon
- **Must start BEFORE FanControl** so sensors are available

## 3. FanControl HWInfo Plugin
- **Location:** `C:\Program Files (x86)\FanControl\Plugins\HWInfo\FanControl.HWInfo.dll`
- **Source:** https://github.com/Rem0o/FanControl.HWInfo/releases
- **Version:** V1.4

### How the Plugin Works
The plugin reads sensor data from the Windows registry key `HKCU:\SOFTWARE\HWiNFO64\VSB`. HWInfo writes temperature/sensor values there when Shared Memory Support is enabled. FanControl then uses these values for fan curve temperature sources.

## 4. Startup Order
1. **HWInfo64** starts at logon (sensors initialize)
2. **FanControl** starts at logon (reads HWInfo sensors via plugin)

Both are configured as scheduled tasks with highest privileges.
