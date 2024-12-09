% The sampling rate is 1000 Hz
FS = 1000;

% Load ECG 1 into Nx1 vector from the file ecg_signal_1.dat
ecg1 = load('ecg_signal_1.dat');

% Load ECG 2 into Nx1 vector from the file ecg_signal_2.dat
ecg2 = load('ecg_signal_2.dat');

% Compute ECG 1 power spectrum
N1 = length(ecg1);
X1 = fft(ecg1);
P_ecg1 = abs(X1).^2 / N1;


% Compute ECG 2 power spectrum
N2 = length(ecg2);
X2 = fft(ecg2);
P_ecg2 = abs(X2).^2 / N2;

% Compute power spectrum frequency bins from 0 Hz to the Nyquist frequency
% For ECG 1
f1 = (0:N1/2) * (FS / N1);
% ...and for ECG 2
f2 = (0:N2/2) * (FS / N2);
