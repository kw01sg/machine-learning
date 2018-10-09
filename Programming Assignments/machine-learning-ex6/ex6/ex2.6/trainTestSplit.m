function [X, y, X_test, y_test] = trainTestSplit(emailIndices, labels, rawDataSize, split_fraction)

testSize = round(split_fraction * rawDataSize);
X = [];
y = [];

X_test = [];
y_test = [];

disp('Generating Random ids ...');
split_id = randperm(rawDataSize, testSize);

disp('Splitting Data ...');
for i = 1:rawDataSize
    if ismember(i, split_id)
        X_test = [X_test; emailIndices(i, :)];
        y_test = [y_test; labels(i)];
    else
        X = [X; emailIndices(i, :)];
        y = [y; labels(i)];
    endif
endfor

endfunction