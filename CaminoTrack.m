for k=1:length(track)
    aux = Q1*[track(1,k) track(2,k) 1]';
    x(k) = aux(1);
    y(k) = aux(2);
end
