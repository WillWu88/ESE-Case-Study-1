%% This code evaluates the test set.

% ** Important.  This script requires that:
% 1)'centroid_labels' be established in the workspace
% AND
% 2)'centroids' be established in the workspace
% AND
% 3)'test' be established in the workspace

% You should save 1) and 2) in a file named 'classifierdata.mat' as part of
% your submission.

predictions = zeros(200, 1);
outliers = zeros(200, 1);
centroid_labels = [9;4;3;6;2;8;6;7;8;0;2;0;1;1;2;5;0;8;9;3];

% loop through the test set, figure out the predicted number
for i = 1:200
    testing_vector = test(i, :);
    % Extract the centroid that is closest to the test image
    [prediction_index, vec_distance] = assign_vector_to_centroid(testing_vector, centroids);
    predictions(i) = centroid_labels(prediction_index);
end

%% DESIGN AND IMPLEMENT A STRATEGY TO SET THE outliers VECTOR
% outliers(i) should be set to 1 if the i^th entry is an outlier
% otherwise, outliers(i) should be 0
% FILL IN

%% MAKE A STEM PLOT OF THE OUTLIER FLAG
figure('Name','Outlier Flag');
% FILL IN

%% The following plots the correct and incorrect predictions
% Make sure you understand how this plot is constructed
figure;
plot(correctlabels, 'o');
hold on;
plot(predictions, 'x');
title('Predictions');

%% The following line provides the number of instances where and entry in correctlabel is
% equatl to the corresponding entry in prediction
% However, remember that some of these are outliers
sum(correctlabels == predictions)

function [index, vec_distance] = assign_vector_to_centroid(data, centroids)
    % By default, this function assumes that size(data)=(1, 785)
    [cRow, cCol] = size(centroids);
    cNorm = zeros(1, cRow);

    for cent = 1:cRow
        cNorm(cent) = norm(data(:, 1:784) - centroids(cent, 1:784));
    end

    cNorm = cNorm';
    [sorted, vIndex] = sortrows(cNorm);
    index = vIndex(1);
    vec_distance = sorted(1);
end
