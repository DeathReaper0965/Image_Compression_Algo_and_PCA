function centroids = computeCentroids(X, idx, K)

[m n] = size(X);

centroids = zeros(K, n);


%temp = idx(:)==1;

for k=1:K
    num = 0;
    res = zeros(1, n);

    for i=1:m
        if(idx(i) == k)
            res = res + X(i, :);
            num = num+1;
        end
    end
    centroids(k, :) = (res/num);
end

end
