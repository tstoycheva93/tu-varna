function UT=diuamel1(N,M,u)
% sastawia matrica U(Tf) 
% N- broj stojnosti na w(t)
% M- broj nabliudenia M>=N
for i=1:N
   for j=i:M
      UT(j,i)=u(j-i+1);
      end;end