%   ODE45  2nd order ODE solver.
%   2nd order equation is made into a first order system. 
%  [a,b]  is the time axis interval
%  [c1,c2] is the initial condition vector
%
%   c2 was found using BVPhose
%
%  That is,  y(a)=c1  v(a)=c2
%
%  ydot  has the right hand side equations for y(t) and v(t)
%
a=0;  b=1;
c1=0;  c2=log(2);
%
%  ydot = @(t,y)  [y(2); v(t)];
%
%Example:  ydot = @(t,y)  [y(t);v(t)];
%
%ydot = @(t,y)  [y(2);18*(y(1))^2];
ydot=@(t,y) [y(2);2*exp(-2*y(1))*(1-t^2)];
%
[t,y] = ode45(ydot,[a,b],[c1,c2]);
%
plot(t,y)
%plot(t,y(:,1))
%plot(t,y(:,2))
%