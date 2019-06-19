% Program Forward difference method for heat equation % ut=D*uxx
% input: space interval [xl,xr], time interval [y0,yt], % number of space steps M, number of time steps N
% Modify IC and BCs as needed, below D=1 in this example
% Output: solution w, and 3D plot
% Example is from "Numerical Solution of Partial Differential
% Equations" by G. D. Smith 3rd Edition Oxford Press, 1998
% Example usage: w=heatfdHW(0,1,0,0.048,11,10)
% Example usage: w=heatfdHW(0,1,0,0.052,11,10)
function w=waveq(a,b,y0,yt,M,N)
%
D=1; % diffusion coefficient
c =10;
h=(b-a)/(M-1); k=(yt-y0)/N;
m=M-1; n=N;
%sigma=D*k/(h*h);
sigma = (c*k)/h;
NT=N+1
%Change NT if you want a solution for a longer time
%NT=4*N
%Fill in time node locations
for it=1:NT+1
t(it)=y0+(it-1)*k;
end
%Fill in space node locations
for ix=1:M
x(ix) = a+(ix-1)*h;
        
end
% Initial conditions
im1=(M-1)/2+1;
for ix=1:im1
w(ix,1)=2*(a+(ix-1)*h); % initial conditions first half
end
im2=im1+1;
%
for ixx=im2:M
w(ixx,1)=2.*(1.-(a+(ixx-1.)*h)); % initial conditions second half
end
%
%Boundary conditions
%
for it=2:NT+1
w(1,it)=0;
w(M,it)=0;
end
%
% Forward difference evaluations
% That is, compute the interior values from
% the finite difference equations.
%

% This is the first line after the boundary line, the numbers are set
% according to p394
for i=2:M-1
%w(ix,it)=w(ix,it-1)+sigma*(w(ix+1,it-1)-2*w(ix,it-1)+w(ix-1,it-1));
w(i,2) = (1-sigma^2)* w(i,1) + (sigma^2 / 2)*(w(i-1,1) + w(i+1,1));
end


for it=3:NT+1
for ix=2:M-1
%w(ix,it)=w(ix,it-1)+sigma*(w(ix+1,it-1)-2*w(ix,it-1)+w(ix-1,it-1));
w(ix,it) = (2-2*sigma^2)*w(ix,it-1) + sigma^2 *w(ix-1,it-1) + sigma^2 * w(ix+1,it-1) - w(ix,it-2); 
end
end
%
%make plots
%
mesh(x,t,w') % 3-D plot of solution w
%view(60,30);  axis([a b y0 t(end) 0 1])
%