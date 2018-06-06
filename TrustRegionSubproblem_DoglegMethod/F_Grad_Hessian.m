function [f, g, H] = F_Grad_Hessian(x)
x1 = x(1);
x2 = x(2);
f = 100*(x2-(x1)^2)^2 + (1-x1)^2;
g = [-400*(x2-x1^2)*x1 + 2*(x1-1); 200*(x2-x1^2)];
H = [1200*x1^2 - 400*x2 + 2, -400*x1; -400*x1, 200];
end


%% use the following code to compute SYMBOLIC gradient and Hessian
% syms x1 x2
% f = 100*(x2-(x1)^2)^2 + (1-x1)^2;
% g=gradient(f, [x1, x2])
% H=hessian(f, [x1, x2])