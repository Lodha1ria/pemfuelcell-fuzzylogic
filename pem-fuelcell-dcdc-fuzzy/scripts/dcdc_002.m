%% dcdc_02.m
% Vin(t) = Vstack(t) 

if evalin('base',"exist('Vstack_ts','var')") ~= 1
    error("Run scripts/run_pemcell_01.m first to create Vstack_ts.");
end

Vstack_ts = evalin('base','Vstack_ts');

Vin = Vstack_ts;
Vin.Name = 'Vin';
assignin('base','Vin',Vin);

disp("Vin timeseries created in base workspace (Vin = Vstack_ts).");
