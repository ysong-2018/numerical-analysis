function gauss(a,f,n)
n1=n-1;
for k =1:n1
    k1=k+1;
    for i = k1:n
        f(i) = f(i)-f(k)*a(i,k)/a(k,k);
        aik = a(i,k);
        for j = 1:n
            a(i,j) = a(i,j)-a(k,j)*aik/a(k,k);
        end
    end
end

for kk=1:n1
    k = n+1-kk;
    k1=k-1;
    for i=1:k1
        f(i) = f(i)-f(k)*a(i,k)/a(k,k);
    end
end



