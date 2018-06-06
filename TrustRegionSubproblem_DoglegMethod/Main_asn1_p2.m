clc;clear;close all;

x = [0; 0];
num_iter = 2;
delta_max = 1;
delta = 0.5;
eta = 0.1;
alpha = 1; % x = x + alpha * p_opt
X = zeros(size(x,1), num_iter); % record the track of minimizer


% apply TrustRegion Method
for t = 1:num_iter
    
p_opt = Dogleg(x, delta); % finds optimal step direction

% finds optimal region size delta
rho = Rho(x, p_opt);
    if rho < 0.25
        delta = 0.25 * delta;
    else
        if rho>0.75 && abs(norm(p_opt)-delta) < 1e-6
            delta = min([2*delta, delta_max]);
        end
    end

    if rho > eta
        x = x + alpha * p_opt;
        X(:, t) = x; % record the track of minimizer
    else
        X(:, t) = x;
    end    
p_opt, rho, delta, x
    
end