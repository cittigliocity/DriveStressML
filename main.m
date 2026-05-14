clc;
clear;

disp('--- CONVERT DATASET ---');

dataPath = 'C:\Users\fgion\OneDrive\Desktop\DriverStressML\data\raw';

drivername = 'drive01';

heaFile = fullfile(dataPath,[drivername '.hea']);
datFile = fullfile(dataPath,[drivername '.dat']);

fid = fopen(heaFile,'r');
header = textscan(fid,'%s','Delimiter','\n');
fclose(fid);

header = header{1};

disp('HEADER:');
disp(header{1});

fid = fopen(datFile,'r');
raw = fread(fid,'int16');
fclose(fid);

numSignals = 2;

signal = reshape(raw, numSignals, [])';

disp('✔ Signal loaded');

ecg = signal(:,1);

figure;
plot(ecg);
title('ECG raw');