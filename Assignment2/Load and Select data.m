% The sampling rate is 1000 Hz
FS = 1000;

% Load ECG 1 into Nx1 vector from the file ecg_signal_1.dat
ecg1 = load('ecg_signal_1.dat');

% Load ECG 2 into Nx1 vector from the file ecg_signal_2.dat
ecg2 = load('ecg_signal_2.dat');

% Select the interval [2 s, 3s] samples from ECG 1

strt_ecg1 = 2 * FS; 
end_ecg1 = 3 * FS;   

ecg1_interval = ecg1(strt_ecg1:end_ecg1);


% Sample times for the interval 1
ecg1_interval_t = (strt_ecg1:end_ecg1) / FS;

% Select the interval [1 s, 2s] samples from ECG 2
strt_ecg2 = 1 * FS; 
end_ecg2 = 2 * FS;      
ecg2_interval = ecg2(strt_ecg2:end_ecg2);

% Sample times for the interval 2
ecg2_interval_t =  (strt_ecg2:end_ecg2) / FS;