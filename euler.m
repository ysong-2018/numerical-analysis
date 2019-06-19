%Euler method for integrating first order ODE
% t(1) = initial time
% y(1) = initial condition
% h = time step size
% n = number of time steps
t(1)=0.;
h=0.01;
n=100;
y(1)=1.;
ye(1)=1.;
for i=1:n
    f(i)=(y(i)*t(i)+t(i)^3);
    t(i+1)=t(i)+h;
    y(i+1)=y(i)+h*f(i);
    ye(i+1)=3*exp(((t(i+1))^2)/2)-t(i+1)^2-2;
end
%subplot(1,2,1)
plot(t,y,'g',t,ye,'b--o')
%plot(t,y)
title('Euler method for ODE')
xlabel('Time')
ylabel(' y(t) ')
%ylabel('Approximate y(t)')
%
%subplot(1,2,2)
%plot(t,ye)
%title('Euler method for ODE')
%xlabel('Time')
%ylabel('Exact y(t)')