
% Run this first. It:
% - adds repo folders to MATLAB path
% - loads fuzzy controller .fis into variable `fzylgcfis`
% - creates the current/current-density input variable `i`
% - defines Vref

%% setup.m
clear; close all; clc;

thisFile   = mfilename('fullpath');
scriptsDir = fileparts(thisFile);
repoRoot   = fileparts(scriptsDir);
addpath(genpath(repoRoot));
assignin('base','repoRoot',repoRoot);

% Load FIS as fzylgcfis (Simulink fuzzy block expects this variable)
fisFile = fullfile(repoRoot,'fis','fzylgcfis.fis');
if exist(fisFile,'file') ~= 2
    error("Missing FIS file: %s", fisFile);
end
fzylgcfis = readfis(fisFile);
assignin('base','fzylgcfis',fzylgcfis);

% Create PEM input i(t): 10 random points between 650 and 900
rng(1);
a = 650; b = 900;
t   = (1:10)';                      % seconds
ran = (b-a).*rand(10,1) + a;
i   = [t ran];                      % From Workspace accepts [time data]
assignin('base','i',i);

% Converter reference
Vref = 22;
assignin('base','Vref',Vref);

disp("setup done: i, fzylgcfis, Vref in base workspace.");
