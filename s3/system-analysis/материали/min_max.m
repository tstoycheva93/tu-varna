function y=min_max
n=2;
xmin(1)=0;
xmin(2)=5;
xmax(1)=10;
xmax(2)=15;
dx(1)=0.5;
dx(2)=0.2;
for i=1:n
    xt(i)=(xmin(i)+xmax(i))/2;
    xopt(i)=xt(i);
end
eps=0.001;
f0=(xt(1)-2)^2+(xt(2)-4)^2;
f1=f0;
fopt=10^10;
imax=100;
iter=0;
while (abs(fopt-f1)>eps)
    iter=iter+1;
    for i=1:n
        xt(i)=xmin(i);
        dt(i)=dx(i);
        while (xt(i)<=xmax(i))
            ft=(xt(1)-2)^2+(xt(2)-4)^2;
            if (ft <= f0)
                f0=ft;
                xopt(i)=xt(i);
            end
            xt(i)=xt(i)+dt(i);
        end
        xt(i)=xopt(i);
    end
    fopt=f1;
    f1=f0;
    if (iter>imax)
        break
    end
end
disp(sprintf('x(1)= %g ',xopt(1)))
disp(sprintf('x(2)= %g ',xopt(2))) 
disp(sprintf('fopt= %g ',fopt))
disp(sprintf('iter= %g ',iter))  
