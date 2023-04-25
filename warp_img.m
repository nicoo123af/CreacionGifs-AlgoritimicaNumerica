function im=warp_img(im,P,zona)
im=double(im)/255;
[N,M,NP]=size(im);
X = ones(N,M);
Y = ones(N,M);
NT  = length(P);
Q=cell(1,NT);

for k = 1:length(P)
    Qaux = inv([P{k};[0 0 1]]);
    Q{k}=Qaux(1:2,:);
end
for v=1:M
    for u=1:N
        uv=[v u 1]';
        z =zona(u,v);
        xy = Q{z}*uv;
        X(u,v) = xy(1,1);
        Y(u,v) = xy(2,1);
    end
end
for k = 1:NP
    im(:,:,k)=interp2(im(:,:,k),X,Y,'bicubic');
end
return