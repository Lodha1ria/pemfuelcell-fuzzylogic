This project simulates a PEM fuel cell stack that generates a variable DC voltage and uses a DC–DC converter with a fuzzy logic controller to regulate the output voltage​
## Folder structure

pem-fuelcell-dcdc-fuzzy/
│ README.md
├─ models/
│ ├─ PEMcell.slx # PEM fuel cell model
│ └─ DCDCconv.slx # DC–DC converter + fuzzy controller model
├─ fis/
│ └─ fzylgcfis.fis # fuzzy controller logic
├─ scripts/
│ ├─ setup.m # adds paths, loads FIS, creates input i, sets Vref
│ ├─ run_pemcell_01.m # runs PEM model + saves/plots V_stack
│ ├─ dcdc_002.m # # creates Vin(t) timeseries from PEM  cell for DCDCconv
│ ├─ dcdc_run.m # runs DC–DC model using V_stack as Vin
│ └─ plot_fis.m # plots membership functions + surface plot
└─ docs/
└─ (paper, screenshots)

## Requirements
- MATLAB / Simulink
- Fuzzy Logic Toolbox

## How to run (PEM cell)
1. Open MATLAB
2. `cd` into this repo folder
3. Run:

```matlab
1. run("scripts/setup.m")
2. run("scripts/run_pemcell_01.m")

This creates in the base workspace:
fzylgcfis (fuzzy controller object)
i (current density input for PEM model)
Vref (reference output voltage, default = 22 V)

3. run("scripts/dcdc_002.m")
- creates Vin = Vstack_ts (time-varying input)
4. run("scripts/dcdc_run.m")
 Outputs:
- out_dcdc (SimulationOutput)
- plots for V_in and V_out

5. run("scripts/plot_fis.m") 
 (To Visualize fuzzy membership functions and control surface)

What signals mean:
- V_stack / V_in: input voltage to the converter (from PEM stack)
- V_out: converter regulated output voltage (target ~22 V)
- D: duty cycle output of the fuzzy controller (0–1)
- gate: PWM switching signal applied to the converter switch
