function [f, g, Hess] = F_Grad_Hessian(x)
x1 = x(1);
x2 = x(2);
f = x1^2 + 2*x2^2;
g = [2*x1; 4*x2];
Hess = [2, 0; 0, 4];
end

