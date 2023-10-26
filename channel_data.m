clear all
clc
close all

N = 100;
W = 1.8;
sigma = 1;

N_Data = 1000;

g_k = zeros(N_Data,N);

for i =1:N_Data
    g_k(i,:) = Channel(N, W, sigma);
end

name_file = ['data/channel_N',num2str(N),'_W',strrep(num2str(W),'.',''),'.csv'];

writematrix(g_k, name_file)

% ports = linspace(1,N,N);
% figure
% plot(ports, g_k(1,:))