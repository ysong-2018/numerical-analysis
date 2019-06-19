% Program 7.1 Nonlinear Finite Difference Method for BVP
% Uses Multivariate Newton??s Method to solve nonlinear equation
% Inputs: interval inter, boundary values bv, number of steps n
% Output: solution w
% Example usage: w=nlbvpfd([0 1],[1 4],40)
% Example usage: w=nlbvpfd([0 pi],[0 1],40)
function w=nlbvpfd(inter,bv,n);
a=inter(1); b=inter(2); ya=bv(1); yb=bv(2);
h=(b-a)/(n+1); % h is step size
w=zeros(n,1); % initialize solution array w
for i=1:20 % loop of Newton step
w=w-jac(w,inter,bv,n)\f(w,inter,bv,n);
end
plot([a a+(1:n)*h b],[ya w' yb]); % plot w with boundary data
%Example 7.9
%function y=f(w,inter,bv,n)
%y=zeros(n,1);h=(inter(2)-inter(1))/(n+1);
%y(1)=bv(1)-(2+h^2)*w(1)+h^2*w(1)^2+w(2);
%y(n)=w(n-1)-(2+h^2)*w(n)+h^2*w(n)^2+bv(2);
%for i=2:n-1
%y(i)=w(i-1)-(2+h^2)*w(i)+h^2*w(i)^2+w(i+1);
%end
%function a=jac(w,inter,bv,n)
%a=zeros(n,n);h=(inter(2)-inter(1))/(n+1);
%for i=1:n
%a(i,i)=2*h^2*w(i)-2-h^2;
%end
%for i=1:n-1
%a(i,i+1)=1;
%a(i+1,i)=1;
%end
%Example 7.10
function y=f(w,inter,bv,n)
y=zeros(n,1);h=(inter(2)-inter(1))/(n+1);
%y(1)=-2*w(1)+(1+h/2)*bv(1)+(1-h/2)*w(2)-h*h*cos(w(1));
y(1) = bv(1)-2*w(1) + w(2) -h*h*sin((w(2)-bv(1))/(2*h));
%y(n)=(1+h/2)*w(n-1)-2*w(n)-h*h*cos(w(n))+(1-h/2)*bv(2);
y(n) = w(n-1)-2*w(n) + bv(2) -h*h*sin((bv(2)-w(n-1))/(2*h));
for j=2:n-1
%y(j)=-2*w(j)+(1+h/2)*w(j-1)+(1-h/2)*w(j+1)-h*h*cos(w(j));
y(j) = w(j-1)-2*w(j) + w(j+1) -h*h*sin((w(j+1)-w(j-1))/(2*h));
end

function a=jac(w,inter,bv,n)
a=zeros(n,n);h=(inter(2)-inter(1))/(n+1);
for j=1:n
%a(j,j)=-2+h*h*sin(w(j));
a(j,j)=-2;
end

a(1,2)= 1 - (h/2)*cos((w(2)-bv(1))/(2*h));
a(n,n-1) = 1 + (h/2)*cos((bv(2)-w(n-1))/(2*h));

for j=2:n-1
a(j,j+1)=1-(h/2)*cos((w(j+1)-w(j-1))/(2*h));
%a(j+1,j)=1+(h/2)*cos((w(j+2)-w(j))/(2*h));
end
for k = 1:n-2
a(k+1,k)=1+(h/2)*cos((w(k+2)-w(k))/(2*h));
end
%