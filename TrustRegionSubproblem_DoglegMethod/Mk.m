function m = Mk(x, p)
[f, g, H] = F_Grad_Hessian(x);
m = f + g'*p + 0.5*p'*H*p; 
end