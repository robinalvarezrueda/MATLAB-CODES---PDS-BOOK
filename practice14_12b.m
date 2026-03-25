%% PRACTICE 14.12b. VERIFICATION OF THE OPERATION OF THE TRAINED MLP – CLASSIFICATION OF NEW INPUTS

clc, close all, clear all
load trained_weights_W1_W2

% Some distorted letters to test the trained network (AS COLUMN VECTORS):
Ac=[0 0 1 0 0 0 1 0 1 0 1 0 0 0 1 0 0 1 1 0 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
Hc=[1 0 0 0 1 0 0 0 0 1 1 0 0 0 1 1 1 0 1 1 1 0 0 0 1 1 0 0 0 1 1 0 0 0 1]';
Cc=[1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 1 0 0 1]';
Sc=[0 1 0 1 0 1 0 0 0 1 1 0 0 0 0 0 1 1 1 0 0 0 0 0 1 1 0 0 0 1 1 1 1 1 1]';
Tc=[1 1 1 1 1 1 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 1 0 1 0 0]';
test_letters=[Ac Hc Cc Sc Tc]; % Matrix containing the test letters

% OUTPUTS OF THE 5 NEURONS IN THE OUTPUT LAYER:
output_1 = logistic(W2*[1;logistic(W1*[1;test_letters(:,1)])])'
output_2 = logistic(W2*[1;logistic(W1*[1;test_letters(:,2)])])'
output_3 = logistic(W2*[1;logistic(W1*[1;test_letters(:,3)])])'
output_4 = logistic(W2*[1;logistic(W1*[1;test_letters(:,4)])])'
output_5 = logistic(W2*[1;logistic(W1*[1;test_letters(:,5)])])'
