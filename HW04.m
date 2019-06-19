% Program HW04 system solve y''+w^2*y=0 
% using the finite difference method given in class.
%
% Input: initial vector y0, number of steps n
%
% Output: Plots of three solutions (different schemes).
%
% Example usage: HW04([1 0],10);
%

%HW04([1 0],10)

function [t,y1,y2,y3]=HW04(y0,n)
t(1)=0; 
y1(1,:)=y0; y2(1,:)=y0; y3(1,:)=y0;
h=pi/n;
alp1=0.0;
alp2=0.5;
alp3=1.0;
omeg=1.0;
%
a11=1-((h*omeg)^2)/2;
a12=h;
%
for i=1:50
t(i+1)=t(i)+h;
%
a21=-h*omeg^2*(alp1+(1-alp1)*a11);
a22=(1-((h*omeg)^2)*(1-alp1));
y1(i+1,1)=a11*y1(i,1)+a12*y1(i,2);
y1(i+1,2)=a21*y1(i,1)+a22*y1(i,2);
%
a21=-h*omeg^2*(alp2+(1-alp2)*a11);
a22=(1-((h*omeg)^2)*(1-alp2));
y2(i+1,1)=a11*y2(i,1)+a12*y2(i,2);
y2(i+1,2)=a21*y2(i,1)+a22*y2(i,2);
%
a21=-h*omeg^2*(alp3+(1-alp3)*a11);
a22=(1-((h*omeg)^2)*(1-alp3));
y3(i+1,1)=a11*y3(i,1)+a12*y3(i,2);
y3(i+1,2)=a21*y3(i,1)+a22*y3(i,2);
end
%
plot(t,y1(:,1),'b--o',t,y2(:,1),'r--x',t,y3(:,1));
%
%end

%HW04([1 0],10)