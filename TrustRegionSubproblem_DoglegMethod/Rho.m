function rho = Rho(x,p_opt)
zero_vec = zeros(size(x,1),1);
[f0, ~, ~] = F_Grad_Hessian(x);
[f1, ~, ~] = F_Grad_Hessian(x+p_opt);

rho = (f0-f1)/(Mk(x, zero_vec)-Mk(x, p_opt));

end