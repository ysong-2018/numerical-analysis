%
%F(s)  %start with this command to find interval
%       s = your guess for the initial condition for "v"
%       For example Run  F(-1) and get  s1
%                        F(1)  and get s2
%       Keep running until you get s1 and s2 of opposite signs.
%       That is, follow text suggestions - run several times
%       until you have a "+" ans  and a  "-"  answer
%       use the two values  s1 < s2  in [s1,s2]  below
%
%    After you have the interval, comment out F( ) above
%    and "uncomment" the sstar command below.
%    Run sstar to find the initial condition for "v"
%    That is, get the initial value "s" in the interval [s1,s2]
%    which makes z below = 0
%    sstar=fzero(@F,[s1,s2]) = the needed initial condition
%sstar=fzero(@F,[-1.5,2.0])
%
function z=F(s)
%  (a,b) is the time interval
%   yb is the desired BC at the far end t=b
a=0;b=1;yb=log(2);
%
ydot=@(t,y) [y(2);2*exp(-2*y(1))*(1-t^2)];
% [t,y]=ode45(ydot,[a,b],[ya,s]);
[t,y]=ode45(ydot,[a,b],[0,s]);
z=y(end,1)-yb; % end means last entry of solution y
end
%
