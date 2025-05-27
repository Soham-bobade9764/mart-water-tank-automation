# Smart Water Tank Control Automation

## Overview
This project implements a smart water tank control system using Structured Text for SCADA simulation in OpenPLC or Codesys. It automates pump control based on tank level, time-based operation, and includes safety/alert features.

## Functional Features
1. **Tank Filling Control**
   - Pump starts if tank level < 30%
   - Pump stops if tank level > 80%
2. **Flow Rate Alarm**
   - Alarm if flow rate < 10 L/min for more than 5 minutes
3. **Overflow Safety**
   - If tank level > 95%, stop pump and raise overflow alarm
4. **Time-Based Operation**
   - Pump only works between 10 PM and 6 AM
5. **Maintenance Mode**
   - Disables all pump operations when active

## Assumptions
- Time is represented using an integer `CurrentHour` (0–23).
- Tank level and flow rate are simulated analog values.
- Flow alarm timer uses a standard `TON` block.
- Simulation run in OpenPLC or Codesys.

## Files
- `smart_tank.st` – Structured Text source code
- `prompt_to_code.txt` – AI prompt simulation example

## Author
Soham Bobade
