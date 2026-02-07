# Troubleshooting

## Issues Encountered and Solutions

### 1. FanControl as a Windows Service - FAILED
**Problem:** FanControl is a WPF GUI application. Running it via NSSM as a service caused `DialogHost` errors because services run in Session 0 without a desktop.

**Error:** `System.InvalidOperationException: No loaded DialogHost instances.`

**Solution:** Use Windows Task Scheduler instead of a service. Task runs at logon in the user's desktop session.

### 2. Automatic Fan Curves Made Fans Loud
**Problem:** Switching from manual to automatic mode caused fans to run at high speed even at low temperatures.

**Root Cause:** LibreHardwareMonitor was reporting inaccurate temperature readings for the AMD Ryzen 9 7950X, causing fan curves to think the CPU was hotter than it actually was.

**Solution:** Installed HWInfo plugin for more accurate temperature readings.

### 3. HWInfo Plugin - "No sensors detected"
**Problem:** After installing the FanControl.HWInfo plugin, it reported no sensors found.

**Error:** `HWInfo is not running or reporting to gadget is not enabled.`

**Root Cause:** The plugin checks registry key `HKCU:\SOFTWARE\HWiNFO64\VSB` for sensor data. This key only exists when HWInfo's **Shared Memory Support** is enabled.

**Steps that DID NOT work:**
- Setting `SensorsSM=1` in HWiNFO64.INI
- Adding `EnableSM=1` to registry
- Adding `EnableVSB=1` to registry
- Restarting in various orders

**What WORKED:**
- Open HWInfo GUI > Settings > General/User Interface > Enable **"Shared Memory Support"** checkbox manually

### 4. CPU Running at 90-92°C
**Problem:** CPU was consistently at 90-92°C even at 20-30% load.

**Investigation:**
- Checked with both LHM and HWInfo sensors - both confirmed high temps
- GPU was cool (33°C) so it wasn't a case airflow issue

**Solution:**
- Checked thermal paste (was fine - recently installed cooler)
- Disabled XMP/EXPO in BIOS
- Temps dropped to ~73°C at same load

### 5. Fans Still Noisy at 73°C
**Problem:** After fixing temps, fans were still audible at 73°C because the fan curve had 45% speed at 75°C.

**Solution:** Adjusted CPU temp curve to only use 28% at 75°C, with aggressive ramp starting at 80°C+ instead. This kept fans inaudible during normal operation.

## Common Issues Reference

### FanControl Won't Start
- Check Task Scheduler: `schtasks /query /tn "FanControl" /v`
- Manual start: `Start-ScheduledTask -TaskName 'FanControl'`

### HWInfo Sensors Disappear
- HWInfo free version disables Shared Memory after 12 hours
- Fix: Restart HWInfo, or purchase HWInfo Pro ($25)
- Check if running: `Get-Process -Name 'HWiNFO64'`

### Fans Running at 100%
- Check if FanControl is running
- Check if HWInfo is running (plugin needs it)
- If HWInfo crashed, FanControl may lose temp source and default to max

### Temperature Spikes
- AMD Ryzen 7000 series has natural temp spikes due to boost behavior
- Hysteresis settings prevent fans from reacting to brief spikes
- If sustained high temps: check cooler, thermal paste, case airflow
