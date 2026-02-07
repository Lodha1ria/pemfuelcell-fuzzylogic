%% plot_fis.m
run(fullfile(fileparts(mfilename('fullpath')),'00_setup.m'));

fzylgcfis = evalin('base','fzylgcfis');

figure; plotmf(fzylgcfis,'input',1);
title('Membership functions: error');

figure; plotmf(fzylgcfis,'input',2);
title('Membership functions: d\_error');

figure; gensurf(fzylgcfis);
title('FIS Surface: Duty cycle D');
xlabel('error'); ylabel('d\_error'); zlabel('D');
