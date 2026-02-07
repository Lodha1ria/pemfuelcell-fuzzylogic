% Run PEM fuel cell model and get V_stack
%% run_pemcell_01.m
run(fullfile('scripts','setup.m'));

modelPem = 'PEMcell';
stopT = 10;

load_system(modelPem);
out_pem = sim(modelPem,'StopTime',num2str(stopT),'ReturnWorkspaceOutputs','on');
assignin('base','out_pem',out_pem);

if any(strcmp(out_pem.who,'V_stack'))
    Vstack_ts = out_pem.get('V_stack');
    assignin('base','Vstack_ts',Vstack_ts);

    figure;
    plot(Vstack_ts.Time, Vstack_ts.Data); grid on
    xlabel('Time (s)'); ylabel('V_{stack} (V)');
    title('PEM Fuel Cell V_{stack}(t)');
else
    error("V_stack not found in PEM output. Add a To Workspace block named V_stack (Timeseries).");
end

disp("PEM done: out_pem and Vstack_ts created.");

