%% dcdc_run.m
% Runs the DC-DC converter model using Vin(t) from base workspace.

modelDcdc = 'DCDCconv';   
stopT     = 1;           % can start with 1–2s for quick test
% Vin exists
if ~evalin('base',"exist('Vin','var')")
    error("Run dcdc_002 first (need Vin timeseries).");
end

load_system(modelDcdc);

out_dcdc = sim(modelDcdc, ...
    'StopTime', num2str(stopT), ...
    'ReturnWorkspaceOutputs','on');

assignin('base','out_dcdc',out_dcdc);

disp("DC-DC run complete: `out_dcdc` saved to base workspace.");
