function centroids = kMeansInitCentroids(X, K)

centroids = zeros(K, size(X, 2));


randIdx = randperm(size(X, 1));
centroids = X(randIdx(1:K), :);



end
