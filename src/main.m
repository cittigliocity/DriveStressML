clc;
clear;
close all;

disp('--- LOADING DRIVE01 MANUAL ---');

dataPath = 'C:\Users\Utente\Documents\MATLAB\DriveStressML\DriveStressML\data\raw';
cd(dataPath);

% -----------------------------
% 1. Leggi header (.hea)
% -----------------------------
heaFile = 'drive01.hea';

fid = fopen(heaFile,'r');
header = textscan(fid,'%s','Delimiter','\n');
fclose(fid);

header = header{1};

disp('--- HEADER ---');
disp(header{1});

% -----------------------------
% 2. Leggi segnale binario (.dat)
% -----------------------------
datFile = 'drive01.dat';

fid = fopen(datFile,'r');
signal = fread(fid, 'int16');
fclose(fid);

% -----------------------------
% 3. reshape base (multi-canale)
% -----------------------------
numSignals = 2; % tipico ECG + altro (semplificazione iniziale)
signal = reshape(signal, numSignals, [])';

disp('Signal loaded');

% -----------------------------
% 4. plot ECG (prima colonna)
% -----------------------------
figure;
plot(signal(:,1));
title('Drive01 - ECG (raw)');
xlabel('Samples');
ylabel('Amplitude');