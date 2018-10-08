%% Initialization
clear ; close all; clc

% pre-process emails
load 'rawEmails.m';
load 'labels.m';

emailIndices = mapEmails(rawEmails);

% train test split
m = size(emailIndices, 1);
[X, y, X_test, y_test] = trainTestSplit(rawEmails, labels, m, 0.4);

% train SVM with Gaussian kernel


% test spam classification



