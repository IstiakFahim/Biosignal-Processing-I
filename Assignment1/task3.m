% Load the data from the file problem3.mat
load('problem3.mat');

% Nx1 vectors flow1, flow2, and flow3 contain the model predictions
% Nx1 vector spiro_resampled contains the resampled reference spirometer data

% Compute the correlation coefficient for the model 1, between flow1 and spiro_resampled
corr1 = corr(flow1, spiro_resampled);

% Compute the correlation coefficient for the model 2, between flow2 and spiro_resampled
corr2 = corr(flow2, spiro_resampled);

% Compute the correlation coefficient for the model 3, between flow3 and spiro_resampled
corr3 = corr(flow3, spiro_resampled);

% Compute the RMSE for the model 1, between flow1 and spiro_resampled
rmse1 = sqrt(mean((flow1 - spiro_resampled).^2));

% Compute the RMSE for the model 2, between flow2 and spiro_resampled
rmse2 = sqrt(mean((flow2 - spiro_resampled).^2));

% Compute the RMSE for the model 3, between flow3 and spiro_resampled
rmse3 = sqrt(mean((flow3 - spiro_resampled).^2));


% fprintf('Model 1: %.4f\n', corr1);
% fprintf('Model 2: %.4f\n', corr2);
% fprintf('Model 3: %.4f\n', corr3);
% 
% fprintf('\nRMSE values:\n');
% fprintf('Model 1: %.4f\n', rmse1);
% fprintf('Model 2: %.4f\n', rmse2);
% fprintf('Model 3: %.4f\n', rmse3);
