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


% test sample email 1
filename = 'emailSample1.txt';
fileContent = readFile(filename);
tokenizedEmail = processEmail(fileContent);
emailIndices = mapEmails({tokenizedEmail});
p = svmPredict(model, emailIndices);
fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');


% test sample email 2
filename = 'emailSample2.txt';
fileContent = readFile(filename);
tokenizedEmail = processEmail(fileContent);
emailIndices = mapEmails({tokenizedEmail});
p = svmPredict(model, emailIndices);
fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');