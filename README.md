This project simulates a PEM fuel cell stack that generates a variable DC voltage and uses a DC–DC converter with a fuzzy logic controller to regulate the output voltage

### Core equations
$$
V_{cell}(i)=E_{OCV}(T,P)-\eta_{act}(i)-\eta_{ohm}(i)-\eta_{conc}(i)
$$

$$
V_{stack}=N_{cells}\,V_{cell}
$$
​​
## Folder structure
```text

pem-fuelcell-dcdc-fuzzy/
│ README.md
├─ models/
│ ├─ PEMcell.slx # PEM fuel cell model
│ └─ DCDCconv.slx # DC–DC converter and fuzzy controller model
├─ fis/
│ └─ fzylgcfis.fis # fuzzy controller logic
├─ scripts/
│ ├─ setup.m # adds paths, loads FIS, creates input i, sets Vref
│ ├─ run_pemcell_01.m # runs PEM model and plots V_stack
│ ├─ dcdc_002.m # # creates Vin(t) timeseries from PEM  cell for DCDCconv
│ ├─ dcdc_run.m # runs DC–DC model using V_stack as Vin
│ └─ plot_fis.m # plots membership functions and surface plot
└─ docs/
   └─ (paper, screenshots)

What signals mean:
- V_stack / V_in: input voltage to the converter (from PEM stack)
- V_out: converter regulated output voltage (target ~22 V)
- D: duty cycle output of the fuzzy controller (0–1)
- gate: PWM switching signal applied to the converter switch

## Requirements
- MATLAB / Simulink
- Fuzzy Logic Toolbox

## How to run (PEM cell)
1. Open MATLAB
2. `cd` into this repo folder
3. Run:

```matlab
run("scripts/setup.m")
run("scripts/run_pemcell_01.m")
run("scripts/dcdc_002.m")
run("scripts/dcdc_run.m")
run("scripts/plot_fis.m")



