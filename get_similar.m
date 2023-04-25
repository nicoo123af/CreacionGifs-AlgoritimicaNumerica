function [P,res] = get_similar(X,Y,E,N)
H = [[X; -Y] [Y; X] [X.^0; zeros(length(X),1)] [zeros(length(Y),1); Y.^0]];
v = [E; N];
c =(H)\(v);
P = [c(1:3)' ;c(2) -c(1) c(4)];
res = v-H*c;
return