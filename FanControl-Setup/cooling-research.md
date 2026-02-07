# Cooling Research & Recommendations

## Current Cooler
**be quiet! Pure Rock Pro 3** (250W TDP, 5 heatpipes)
- Adequate but borderline for Ryzen 9 7950X
- Fans need to spin fast to keep up = noisy
- 34.8 dBA max noise, 59.6 CFM airflow

## Recommended Upgrade
**be quiet! Dark Rock Elite** (~$100)
- 280W TDP, 7 heatpipes, 2x 135mm Silent Wings fans
- 25.8 dBA max noise (quiet mode)
- Front fan rail system (easy maintenance, better RAM clearance)
- Speed switch: quiet mode (1500 RPM) / performance mode (2000 RPM)
- ARGB top cover (can be turned off)
- Expected improvement: ~5-8°C cooler at same noise, or same temps much quieter

## Cooler Comparison (Researched 2026-02-05)

### Top Contenders

| Spec | Pure Rock Pro 3 (current) | Dark Rock Pro 5 | Dark Rock Elite | NH-D15 chromax | NH-D15 G2 |
|------|--------------------------|-----------------|-----------------|----------------|-----------|
| Price | ~$50 | ~$80 | **~$100** | ~$110 | ~$150 |
| TDP | 250W | 270W | 280W | ~250W | ~250W |
| Heatpipes | 5 | 7 | 7 | 6 | 8 |
| Fans | 2x 120mm | 135+120mm | 2x 135mm | 2x 140mm | 2x 140mm |
| Max Noise | 34.8 dBA | 25.8 dBA | 25.8 dBA | 24.6 dBA | 24.6 dBA |
| Airflow | 59.6 CFM | ~67 CFM | ~67 CFM | 82.5 CFM | 82.5 CFM |
| Bearings | Rifle | Rifle | Rifle | Fluid Dynamic | Fluid Dynamic |
| Warranty | 3 years | 3 years | 3 years | 6 years | 6 years |
| Speed Switch | No | Yes | Yes | No | No |
| Fan Rail | No | No | Yes | No | No |

### Budget Alternatives

| Cooler | Price | Performance vs NH-D15 | Notes |
|--------|-------|----------------------|-------|
| Thermalright Peerless Assassin 120 SE | ~$35 | Within 2-3°C | Insane value, beats coolers 3x its price |
| DeepCool AK620 | ~$50 | Within 1-2°C | Great build quality at half the price |

### Benchmark Summary
- NH-D15 G2 is the best air cooler (~76°C on 7900X3D)
- Dark Rock Pro 5 is ~1°C behind NH-D15
- Dark Rock Elite matches NH-D15 while being quieter at moderate loads
- All three are within ~3°C of each other

### Why Dark Rock Elite Won
- $100 is the sweet spot (95% of NH-D15 performance at 65% of G2 price)
- Front fan rail = practical maintenance advantage
- Matched 135mm fans (Pro 5 has mismatched 135+120mm)
- 280W TDP gives headroom for 7950X
- $20 more than Pro 5 is justified by fan rail and matched fans
- $10 less than NH-D15 chromax with comparable performance

## Water Cooling vs Air Cooling Analysis

### Comparison

| | High-End Air (Dark Rock Elite) | 240mm AIO | 360mm AIO |
|--|-------------------------------|-----------|-----------|
| Price | $100 | $80-150 | $120-200 |
| Cooling | Excellent | Similar to air | ~3-5°C better |
| Noise | Very quiet | Pump + fans | Pump + fans |
| Lifespan | 10+ years | 3-7 years (pump limited) |
| Failure mode | Fan stops = temps rise slowly | Pump dies = CPU overheats, leak = dead components |
| Maintenance | Dust it off | Permeation over years, most AIOs can't be refilled |
| Points of failure | 1 (fan) | 4 (pump, fans, tubes, fittings) |

### When Water Cooling Makes Sense
- Extreme overclocking with custom loops
- Very small ITX cases with no room for tower coolers
- Aesthetic builds
- CPU + GPU combined loops in workstations

### When It Doesn't
- Daily driver PCs (added complexity/risk for minimal gain)
- Systems not running 100% load 24/7
- When noise is the priority (good air cooler is often quieter - no pump whine)

### The Noise Myth
AIOs still have radiator fans plus a pump that can whine/buzz. A good air cooler at low RPM is often quieter than an AIO because there's no pump noise.

### The Performance Reality
A 360mm AIO beats the best air cooler by ~3-5°C. At 20-30% daily use, the difference is unnoticeable. Only matters for sustained 100% workloads.

### Verdict
For this system (Ryzen 9 7950X, daily use), high-end air cooling is the better choice. Quieter, more reliable, longer lasting, cheaper, and zero risk of leaks.
