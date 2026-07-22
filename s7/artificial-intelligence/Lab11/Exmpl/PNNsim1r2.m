% Modified
function [a, R, z, nsq] = PNNsim1r2(net, x)
% [a, z] = PNNsim1r(net, x)
 
%PNNsim by Todor Ganchev 10.Jan.2003 

[ndata, data_dim] = size(x');
n2b = dist2(net.w1,x').^0.5;
b1b = net.b1*ones(size(net.b1,2),ndata);
n2 = netprod(n2b,b1b);
nsq = -n2.*n2;
z = exp(nsq);		
R = normprod(net.w2,z);
a = compet(R);
