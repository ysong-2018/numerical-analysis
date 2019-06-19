% Collocation example text pg 367
%
n = 10;
a = 0.;
b = 1.;
ya = 0.;
yb = (1/3)*exp(1);
for i = 1:n
    t(i)=a+(i-1)*(b-a)/(n-1); % keep this unchanged
    %bn(i,1) = 0.;
    bn(i,1) = (2/3)*exp(t(i));
    %disp(bn);
    for j = 1:n
    ann(i,j) = 0.;
    end
end
disp(bn);
% first eq
ann(1,1) = 1.;
bn(1,1) = ya;
% last eq
bn(n,1) = yb;
for j = 1:n
    ann(n,j) = 1.;
end
%
for i = 2:(n-1)
    for j = 1:n
        %ann(i,j)=(j-1)*(j-2)*t(i)^(j-3)-4*t(i)^(j-1);
        ann(i,j)=(j-1)*(j-2)*t(i)^(j-3)-t(i)^(j-1);
    end
end
ann;
bn;
c = linsolve(ann,bn)
%
y(1) = ya;
y(n) = yb;
for i = 2:(n-1)
    y(i) = 0;
    for j = 1:n
    y(i) = y(i)+c(j,1)*t(i)^(j-1);
    end
end
%    
disp(t);
disp(y);
plot(t,y)
%
% y2(1) = ya;
% y2(n) = yb;
% for i = 2:4*(n-1)
%     t2(i) = a+(i-1)*(b-a)/(n-1);
%     y2(i) = 0;
%     for j = 1:n
%     y2(i) = y2(i)+c(j,1)*t2(i)^(j-1);
%     end
% end
%    
%plot(t2,y2)
%x
%y2(1) = ya;
%y2(n) = yb;
for i = 1:n
    te(i) = a+(i-1)*(b-a)/(n-1);
    ye(i) = (t2(i)*exp(t2(i)))/3;
    %y2(i) = 0;
    %for j = 1:n
    %y2(i) = y2(i)+c(j,1)*t2(i)^(j-1);
    %end
end
disp(te);
disp(ye);
%plot(t2,ye);
plot(t,y,'b--o',te,ye,'g--x')



