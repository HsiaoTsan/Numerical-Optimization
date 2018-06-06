u = 1;
x = [0;0];
tau = 1;
gQ = 1e3*[1;1];
k = 1;

while norm(gQ) > tau/k
% for t=1:2
k=k+1;
[Q,gQ] = merit_func(x, u)
AlphaFun = @(alpha)merit_func(x-alpha*gQ,u);
MinAlpha = fminsearch(AlphaFun,1)
s = MinAlpha*gQ
x = x - s
u=1.1*u
end

