% The sampling rate is 1000 Hz
FS = 1000;
T = 1 / FS; 


% Load ECG 1 into Nx1 vector from the file ecg_signal_1.dat
ecg1 = load('ecg_signal_1.dat');

% Load ECG 2 into Nx1 vector from the file ecg_signal_2.dat
ecg2 = load('ecg_signal_2.dat');

% Create cascaded filter coefficients a and b using convolution


a_ma= 1;  
b_ma= ones(1, 10) / 10; 


a_derivative = [1, -0.995];
b_derivative = [1, -1] / T;
[h, w] = freqz(b_derivative, a_derivative, 1024, FS);
max_gain = max(abs(h));
b_derivative = b_derivative / max_gain; 


a_comb = 1;
b_comb = [0.6310, -0.2149, 0.1512, -0.1288, 0.1227, -0.1288, 0.1512, -0.2149, 0.6310];


b = conv(conv(b_ma, b_derivative), b_comb);
a = conv(conv(a_ma, a_derivative), a_comb);
    
% Do the filtering using a, b, and ecg1
% For ecg1
ecg1_filtered = filter(b, a, ecg1);
% ...and ecg2
ecg2_filtered = filter(b, a, ecg2);