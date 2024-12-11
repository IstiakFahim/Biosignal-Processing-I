% Load problem2.mat to have access to variables abd_sig1 and mhb_ahead
load('problem2.mat');

% The sampling rates are 1000 Hz
FS = 1000;

% Calculate sample timing vector in seconds starting from 0
t = (0:length(abd_sig1)-1) / FS;

% Estimate the time lag using cross correlation

[corr_vals, lags] = xcorr(abd_sig1, mhb_ahead);
% (Calculate cross correlation using the xcorr function and then

[~, max_idx] = max(corr_vals); 
% use the max function to find the lag giving maximal correlation)

d = lags(max_idx);

% Shift the chest ECG mhb_ahead back in time d samples padding with nearest value



if d > 0
    % Positive delay: Pad at the beginning
    mhb = [repmat(mhb_ahead(1), d, 1); mhb_ahead(1:end-d)];
elseif d < 0
    % Negative delay: Pad at the end
    mhb = [mhb_ahead(-d+1:end); repmat(mhb_ahead(end), -d, 1)];
else
    % No delay
    mhb = mhb_ahead;
end


% Estimate c2 from abd_sig1 and mhb
c2 = (abd_sig1' * mhb) / (mhb' * mhb);

% Calculate the fetal ECG by cancelling out the scaled mother's ECG using projection based estimation coefficient
fetus = abd_sig1 - c2 * mhb;

