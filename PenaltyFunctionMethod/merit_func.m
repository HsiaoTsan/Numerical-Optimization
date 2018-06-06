function [Q,gQ] = merit_func(x,u)
x1=x(1);
x2=x(2);

Q = x1 + x2 + 0.5*u*(x1^2+x2^2-2)^2;
gQ = [1 + 2*x1*u*(x1^2+x2^2-2); 1+2*x2*u*(x1^2+x2^2-2)];
end
