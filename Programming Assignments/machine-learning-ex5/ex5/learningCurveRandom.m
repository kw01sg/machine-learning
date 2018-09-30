function [error_train, error_val] = ...
    learningCurveRandom(X, y, X_val, y_val, lambda)

% Number of training and cross validation examples
m = size(X, 1);
r = size(X_val, 1);

error_train = zeros(m, 1);
error_val = zeros(m, 1);

for i = 1:m
    
    % initialize error accumulators
    error_train_accum = zeros(50, 1);
    error_val_accum = zeros(50,1);

    % average across multiple sets of randomly selected examples
    for j = 1:50
        % random datasets
        random_index = randperm(m, i);

        if i < r
            val_random_index = randperm(r, i);
        else
            val_random_index = randperm(r, r);
        endif
        

        % compute theta
        theta = trainLinearReg(X(random_index, :), y(random_index), lambda);

        % compute training error
        error_train_accum(j) = linearRegCostFunction(X(random_index, :), y(random_index), theta, 0);

        % compute cross validation error
        error_val_accum(j) = linearRegCostFunction(X_val(val_random_index, :), y_val(val_random_index), theta, 0); 
    endfor

    error_train(i) = mean(error_train_accum);
    error_val(i) = mean(error_val_accum);
endfor

endfunction