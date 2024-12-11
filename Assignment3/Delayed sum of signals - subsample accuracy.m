% Load problem3.mat to have access to variables abd_sig1 and mhb_ahead
load('problem3.mat');

% The sampling rates are 1000 Hz
FS = 1000;

% Calculate sample timing vector in seconds starting from 0

N = length(abd_sig1);
t = (0:N-1) / FS;


% Estimate the time lag using cross correlation with the 'xcorr' function

[xcorr_values, lags] = xcorr(abd_sig1, mhb_ahead, 'coeff'); 
valid_lags = abs(lags) <= 50; 
xcorr_limited = xcorr_values(valid_lags); 
lags_limited = lags(valid_lags); 


% Fit a spline to the cross correlation using 'spline' function, and then find the delay with maximum correlation using 'fnmin'

pp = spline(lags_limited, xcorr_limited);

obj_fn = @(x) -ppval(pp, x);
lag_range = [min(lags_limited), max(lags_limited)];


% NOTE: to use minimization function for maximization, please invert the objective function!
%d = 


[d, ~] = fnmin(obj_fn, lag_range(1), lag_range(2));


% Shift the chest ECG mhb_ahead back in time d samples


time_vec = (0:length(mhb_ahead)-1)'; % Time indices of the original signal
shifted_time_vec = time_vec - d; % Adjust time indices by the delay



% Use linear interpolation with extrapolation with the function 'interp1'



mhb = interp1(time_vec, mhb_ahead, shifted_time_vec, 'linear', 'extrap');

% Estimate c2 from abd_sig1 and mhb
c2 = (mhb' * abd_sig1) / (mhb' * mhb);

% Calculate the fetal ECG by cancelling out the scaled mother's ECG using projection based estimation coefficient
fetus = abd_sig1 - c2 * mhb;




%% fnmin_function 
function [x_min, f_min] = fnmin(func, x1, x2)
    
    if nargin < 3
        error('fnmin requires more than three inputs');
    end

    
    tol = 1e-6;  
    phi = (1 + sqrt(5)) / 2;
    
   
    a = x1;
    b = x2;
    c = b - (b - a) / phi;
    d = a + (b - a) / phi;
    
    % functions
    
    
    fc = func(c);
    fd = func(d);
    
    
    % Src_loop
    
    
    while (b - a) > tol
        if fc < fd
            b = d;
            d = c;
            fd = fc;
            c = b - (b - a) / phi;
            fc = func(c);
        else
            a = c;
            c = d;
            fc = fd;
            d = a + (b - a) / phi;
            fd = func(d);
        end
    end
    
    x_min = (a + b) / 2;
    f_min = func(x_min);
end