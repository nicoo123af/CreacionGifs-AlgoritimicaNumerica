
t=0.7;
 u=(1-t)*x1+t*x2; 
 v=(1-t)*y1+t*y2; 


T = delaunay(u,v);
% imshow('ant.jpg')
% hold on
% triplot(T,x2,y2);
NT = length(T);
P1=cell(1,NT);
P2=cell(1,NT);
for k = 1:NT
    aux1 = T(k,:);
    X = x1(aux1);
    Y = y1(aux1);
    U = u(aux1);
    V = v(aux1);
    P1{k} = get_afin(X,Y,U,V);
end
for k=1:NT
    aux2 = T(k,:);
    X = x2(aux2);
    Y = y2(aux2);
    U = u(aux2);
    V = v(aux2);
    P2{k} = get_afin(X,Y,U,V);
end
[N,M,NP]=size(im);
zona=determina_triang(T,u,v,N,M);
a=warp_img(im,P1,zona);
[N2,M2,NP2]=size(im2);
zona2=determina_triang(T,u,v,N2,M2);
b=warp_img(im2,P2,zona2);
solucion=(1-t)*a+ t*b;
imshow(solucion);








