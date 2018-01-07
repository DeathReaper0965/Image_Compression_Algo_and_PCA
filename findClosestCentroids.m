function idx = findClosestCentroids(X, centroids)

K = size(centroids, 1);

idx = zeros(size(X,1), 1);

%temp = zeros(K, 1);

for i=1:size(X, 1)
    min = inf;

    for j=1:K
        temp = X(i, :)' - centroids(j, :)';
        t = temp' * temp;
        if(t < min)
            min = t;
            idx(i) = j;
        end
    end
end






end
