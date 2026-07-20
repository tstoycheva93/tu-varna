function rr=ruu(r,n)
% izcislenie na matrica R(i)
for k=1:n;
for i=k:n
   rr(k,i)=r(i-k+1);
end
end
for k1=2:n;
for i=1:k1-1
   rr(k1,i)=rr(i,k1);
   end
end
