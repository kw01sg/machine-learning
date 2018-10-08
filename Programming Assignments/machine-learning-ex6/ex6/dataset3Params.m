function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% declare parameter options
C_options = [0.01,0.03,0.1,0.3,1,3,10,30];
sigma_options = [0.01,0.03,0.1,0.3,1,3,10,30];

errors = ones(size(C_options, 2), size(sigma_options, 2));

for i = 1:size(C_options, 2)
    for j = 1:size(sigma_options, 2)
        % train model using C_options(i) and sigma_options(j)
        model = svmTrain(X, y, C_options(i), @(x1, x2) gaussianKernel(x1, x2, sigma_options(j)));

        % compute predictions on cross validation set using trained model
        predictions = svmPredict(model, Xval);

        % compute and store prediction error in errors(i,j)
        errors(i, j) = mean(double(predictions != yval));
    endfor
endfor

% Get optimal C and sigma
[min_error, id_c] = min(min(errors, [], 2));
C = C_options(id_c);

[min_error, id_sigma] = min(min(errors, [], 1));
sigma = sigma_options(id_sigma);

% =========================================================================

end
