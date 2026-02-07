# Maintenance & Useful Commands

## Quick Commands

### Check Temperatures
```powershell
# CPU temp (from HWInfo)
(Get-ItemProperty 'HKCU:\SOFTWARE\HWiNFO64\VSB').Value0

# GPU temp
nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits
```

### Process Management
```powershell
# Check if both are running
Get-Process -Name 'FanControl','HWiNFO64' -ErrorAction SilentlyContinue | Select-Object Name, Id

# Restart FanControl
Stop-Process -Name 'FanControl' -Force; Start-Sleep 2; Start-ScheduledTask -TaskName 'FanControl'

# Restart HWInfo
Stop-Process -Name 'HWiNFO64' -Force; Start-Sleep 2; Start-Process 'C:\Program Files\HWiNFO64\HWiNFO64.EXE'

# Restart both (correct order)
Stop-Process -Name 'FanControl','HWiNFO64' -Force
Start-Sleep 3
Start-Process 'C:\Program Files\HWiNFO64\HWiNFO64.EXE'
Start-Sleep 10
Start-ScheduledTask -TaskName 'FanControl'
```

### Task Scheduler
```powershell
# Check FanControl task
schtasks /query /tn "FanControl" /v /fo list

# Check HWInfo task
schtasks /query /tn "HWInfo64" /v /fo list

# Delete tasks (if needed)
schtasks /delete /tn "FanControl" /f
schtasks /delete /tn "HWInfo64" /f
```

### NSSM (if ever needed for other apps)
```powershell
# Installed via: choco install nssm
nssm install <ServiceName> <path-to-exe>
nssm start <ServiceName>
nssm stop <ServiceName>
nssm remove <ServiceName> confirm
```

## File Locations

| File | Path |
|------|------|
| FanControl EXE | `C:\Program Files (x86)\FanControl\FanControl.exe` |
| FanControl Config | `C:\Program Files (x86)\FanControl\Configurations\userConfig.json` |
| FanControl Logs | `C:\Program Files (x86)\FanControl\log.txt` / `log_1.txt` |
| FanControl Plugin | `C:\Program Files (x86)\FanControl\Plugins\HWInfo\FanControl.HWInfo.dll` |
| HWInfo EXE | `C:\Program Files\HWiNFO64\HWiNFO64.EXE` |
| HWInfo Config | `C:\Program Files\HWiNFO64\HWiNFO64.INI` |
| HWInfo Registry | `HKCU:\SOFTWARE\HWiNFO64\VSB` |

## Updating

### FanControl
- Download from: https://github.com/Rem0o/FanControl.Releases
- Config is preserved in `Configurations\userConfig.json`

### HWInfo
- Update via: `choco upgrade hwinfo`
- Or download from: https://www.hwinfo.com/

### HWInfo Plugin
- Download from: https://github.com/Rem0o/FanControl.HWInfo/releases
- Extract to: `C:\Program Files (x86)\FanControl\Plugins\HWInfo\`

## HWInfo Free vs Pro
- **Free:** Shared Memory resets every 12 hours
- **Pro ($25):** No shared memory timeout
- If fans go crazy after 12 hours, restart HWInfo
