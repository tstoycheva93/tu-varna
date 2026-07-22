% Modified
function net = PNNsimple2(Pinp,Ttr,Spread)
%net = PNNsimple(Pinp,Tcl,Spread,options)
%Creates an PNN network with specified architecture
%
%	Description of the fields: 
%	  type = 'PNN'
%	  nin = number of inputs
%	  nhidden = number of hidden units
%	  nout = number of outputs
%	  nwts = total number of weights and biases
%	  actfn = string defining hidden unit activation function:
%	    'gaussian' for a radially symmetric Gaussian function.
%	  outfn = string defining output error function:
%	    'compet'
%	  wi = squared widths 
%	  w2 = second layer weight matrix
%	  b2 = second layer bias vector
%

%  Creates a PNN, written by Todor Ganchev  Jan 10th 2003

Tcl = ind2vec(Ttr); 

if nargin < 3, Spread = 1; end;

[nin,Qunits] = size(Pinp);
[nout,nhidden] = size(Tcl);

net.type = 'PNN';
net.nin = nin;
net.nhidden = nhidden;
net.nout = nout;
net.actfn = 'gaussian';
net.fnshape = 'spherical';
net.outfn = 'compet';
net.spread = Spread;
net.nwts = nin*nhidden*2;
net.w1 = Pinp';
net.b1 = zeros(Qunits,1)+sqrt(-log(.5))/Spread;
net.w2 = Tcl;