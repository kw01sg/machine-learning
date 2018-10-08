function [X, y, X_test, y_test] = trainTestSplit(rawData, labels, rawDataSize, split_fraction)

X = [];
y = [];

X_test = [];
y_test = [];

split_id = unique(round(rand(rawDataSize * split_fraction, 1) .* rawDataSize));

for i = 1:rawDataSize
    if ismember(i, split_id)
        X_test = [X_test, rawData(i)];
        y_test = [y_test, labels(i)];
    else
        X = [X, rawData(i)];
        y = [y, labels(i)];
    endif
endfor

endfunction