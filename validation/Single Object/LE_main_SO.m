clc
clear all
% An example data
% Spike - neural signal data, Mark - trial event data
load('Data-SO.mat')
% Initial parameter setting
t_bin=0.5; % Seconds
t_shift=0.1; % Seconds
bin_cut=4; % Cut the initial 4 incomplete bins
sampleR=30000; % Sampling Rate

% Calculate how many neurons were recorded
[mapping, neural] = buildMap(Spike);
time_start=neural(1,1);

% Spike Count
S=binData(neural,mapping,t_bin,t_shift,sampleR,bin_cut);

% Synchronize trial event information to the S matrix
bin_mov=binMark_SO(Mark,time_start,t_shift,sampleR,bin_cut);

% Dimensionality reduction by laplacian eigenmaps
Low_dim_S=laplacian_eigen(S,3);
% Low_dim_S=map';

% Visualization
LE_plot_SO(Low_dim_S,bin_mov)    
