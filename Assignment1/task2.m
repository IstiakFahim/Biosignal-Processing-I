% Load the belt data into Nx2 matrix from the file beltsignals.txt
belt = load('beltsignals.txt');

% Load the resampled spirometer data into Nx1 vector from the file spiro_resampled.mat
spiro_resampled = load('spiro_resampled.mat')

% Load the regression coefficients vector for the model 1 from the file regressioncoefficients1.txt
coeff1 = load('regressioncoefficients1.txt');

% Load the regression coefficients vector for the model 2 from the file regressioncoefficients2.txt
coeff2 = load('regressioncoefficients2.txt');

% Load the regression coefficients vector for the model 3 from the file regressioncoefficients3.txt
coeff3 = load('regressioncoefficients3.txt');

% Extract chest and abdomen signals
s_ch = belt(:,1);
s_ab = belt(:,2);

% Predict the airflow using the model 1, that is with coeff1
flow1 = coeff1(1) * s_ch + coeff1(2) * s_ab;

% Predict the airflow using the model 2, that is with coeff2
flow2 = coeff2(1) * s_ch + coeff2(2) * s_ab + coeff2(3) * (s_ch.^2) + coeff2(4) * (s_ab.^2);

% Predict the airflow using the model 3,  that is with coeff3
flow3 = coeff3(1) * s_ch + coeff3(2) * s_ab + coeff3(3) * (s_ch .* s_ab);

% disp(flow1);
% disp(flow2);
% disp(flow3);
 
