function P=get_afin(x,y,u,v)
H1 = [x y x.^0];
H2 = H1;
coefs1 = H1\u;
coefs2 = H2\v;
P = [coefs1' ; coefs2'];
return