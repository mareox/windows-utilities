# Fan Curve Configuration

## Controlled Fans

| Fan | Identifier | Curve | Mode |
|-----|-----------|-------|------|
| CPU Fan | `/lpc/it8689e/control/0` | CPU Temp | Automatic |
| Rear Fan #1 | `/lpc/it8689e/control/1` | CPU Temp | Automatic |
| Front Fan #2 | `/lpc/it8689e/control/2` | CPU Temp | Automatic |
| Top Fan #3 | `/lpc/it8689e/control/3` | CPU Temp | Automatic |
| GPU Fan 1 | `NVApiWrapper/0-AD104-A/control/0` | GPU Temp | Automatic |
| GPU Fan 2 | `NVApiWrapper/0-AD104-A/control/1` | GPU Temp | Automatic |
| CPU Optional Fan | `/lpc/it8689e/control/4` | N/A | Disabled |

## CPU Temp Curve (Final - Quiet)

Optimized for silence while keeping safe temperatures.

| Temperature | Fan Speed |
|-------------|-----------|
| 40°C | 20% |
| 60°C | 22% |
| 75°C | 28% |
| 80°C | 35% |
| 88°C | 50% |
| 95°C | 75% |

**Rationale:** At normal load (~20-30%), CPU sits around 73°C. Fans run at ~28% which is inaudible. Fans only ramp up significantly above 80°C when the system is under heavy load.

## GPU Temp Curve (Quiet)

| Temperature | Fan Speed |
|-------------|-----------|
| 30°C | 0% (off) |
| 45°C | 25% |
| 55°C | 30% |
| 65°C | 40% |
| 75°C | 55% |
| 85°C | 75% |

**Rationale:** GPU idles at 30-34°C with fans off (zero RPM). Fans engage gently above 45°C during gaming/GPU load.

## Hysteresis Settings (Both Curves)

| Setting | Value | Purpose |
|---------|-------|---------|
| Response Time Up | 8s | Slow ramp up prevents sudden noise |
| Response Time Down | 12s | Even slower ramp down for smooth transitions |
| Hysteresis Up | 4°C | Temp must rise 4°C before fans increase |
| Hysteresis Down | 5°C | Temp must drop 5°C before fans decrease |

## Step Size
- Command Step Up: 4
- Command Step Down: 4

Smaller steps = smoother, less noticeable fan speed changes.

## Temperature Readings

### Normal Operating Temps (after thermal paste fix, XMP disabled)
- **CPU idle:** ~73°C at 20-30% load
- **GPU idle:** 30-34°C

### Expected Ryzen 9 7950X Range
- Idle: 40-60°C
- Light load (20-30%): 60-75°C
- Full load: 85-95°C
