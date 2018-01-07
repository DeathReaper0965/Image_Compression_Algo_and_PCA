
clear ; close all; clc

fprintf('Finding closest centroids.\n\n');

load('data2.mat');

K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5];

fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1:3));
fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nComputing centroids means.\n\n');

centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');
fprintf('\n(the centroids should be\n');
fprintf('   [ 2.428301 3.157924 ]\n');
fprintf('   [ 5.813503 2.633656 ]\n');
fprintf('   [ 7.119387 3.616684 ]\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;


fprintf('\nRunning K-Means clustering on example dataset.\n\n');

load('data2.mat');

K = 3;
max_iters = 10;

initial_centroids = [3 3; 6 2; 8 5];

[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Done.\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

A = double(imread('bird_small.png'));

A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

img_size = size(A);

X = reshape(A, img_size(1) * img_size(2), 3);

K = 16;
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Program paused. Press enter to continue.\n');
pause;


fprintf('\nApplying K-Means to compress an image.\n\n');

idx = findClosestCentroids(X, centroids);

X_recovered = centroids(idx,:);

X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

subplot(1, 2, 1);
imagesc(A);
title('Original');

subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf('Program paused. Press enter to continue.\n');
pause;
