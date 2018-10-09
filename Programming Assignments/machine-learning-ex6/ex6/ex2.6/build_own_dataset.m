%% Initialization
clear ; close all; clc

% pre-process emails
load 'rawEmails.m';
load 'labels.m';

emailIndices = mapEmails(rawEmails);

% train test split
m = size(emailIndices, 1);
[X, y, X_test, y_test] = trainTestSplit(emailIndices, labels, m, 0.4);

% train SVM with linear kernel
C = 0.05;
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
p = svmPredict(model, X);
fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);

% test spam classification
p = svmPredict(model, X_test);
fprintf('Test Accuracy: %f\n', mean(double(p == y_test)) * 100);
