clc;clear;

% BFGS
x = [1;1];
tol = 1e-6;
H = eye(size(x,1)); % H = inverse Hessian
I = eye(size(x,1));
[~,g0,B]=F_Grad_Hessian(x);
k=0;
Xrec=[];


while norm(g0)>tol
k=k+1;
Xrec=[Xrec, x];

p = -H*g0; % H = inverse Hessian
% alpha = LineSearchWolfe(x, p);
AlphaFun = @(alpha)obj_function(x+alpha*p);
MinAlpha = fminsearch(AlphaFun,1);
s = MinAlpha*p;
[~,g,~]=F_Grad_Hessian(x+s);
y = g - g0;
g0 = g;
rho = 1/(y'*s);
H = (I - rho*s*y')*B*(I - rho*y'*s) + rho*s*s';
B = B - B*s*s'*B/(s'*B*s) + y*y'/(y'*s);
x = x+s;

end



% draw plot
t1 = linspace(-1.5,1.5);
t2 = linspace(-1.5,1.5);
[T1,T2] = meshgrid(t1,t2);
Z = T1.^2+2*T2.^2;

figure;
contour(T1,T2,Z)

hold on;
plot(Xrec(1,:),Xrec(2,:) ,'r','linewidth',2);
plot(Xrec(1,:),Xrec(2,:) ,'*r','markersize',10);


title('BFGS Method')
xlabel('t_1')
ylabel('t_2')