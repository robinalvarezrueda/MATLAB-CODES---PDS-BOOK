%% PRACTICE 14.9. Linear Classification in three dimensions

clc; close all; clear all
% Data:
x = [0   -0.3 -0.4  0.3 0.3 0.4 0.2 0.3 0.8; ...
    -0.4 -0.2  1.3 -1.3 0.5 0.3 0.5 0.2 0.4;
    -0.4 -0.2  1.3 -1.3 0.5 0.3 0.5 0.2 0.4];
t = [0 0 0 0 1 1 1 1 1]; % desired outputs
w = rand(1,3); % randomly generated weights
b = rand;      % randomly generated bias
% Plot the 3D points:
plot3(x(1,1:4), x(2,1:4), x(3,1:4), '*'); hold on
plot3(x(1,5:9), x(2,5:9), x(3,5:9), '+'); hold on
axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]); hold 
[X,Y] = meshgrid(-1.5:0.5:1.5);
Z = (-b - w(1)*X - w(2)*Y) ./ w(3);
surf(X,Y,Z); hold
title('Initial Decision Boundary')
% Create VideoWriter object
video_evolution = VideoWriter('DecisionBoundary3D');
video_evolution.FrameRate = 1;
open(video_evolution);
figure
% Try 30 epochs (iterations) to check convergence
for j = 1:30
    y = step_unit (w*x + b);
    if all(t == y)
        break
    end
    w = w + (t - y)*x';
    b = b + (t - y)*ones(length(x),1);
    plot3(x(1,1:4), x(2,1:4), x(3,1:4), '*'); hold on
    plot3(x(1,5:9), x(2,5:9), x(3,5:9), '+'); hold on
    axis([-1.5 1.5 -1.5 1.5 -1.5 1.5]); hold on
    [X,Y] = meshgrid(-1.5:0.5:1.5);
    Z = (-b - w(1)*X - w(2)*Y) ./ w(3);
    surf(X,Y,Z); hold
    title('Decision Boundary Evolution')
    M = getframe(gcf);
    writeVideo(video_evolution, M);
end
if j == 40
    fprintf('Solution not found.\n')
else
    fprintf('Solution found in %i epochs.\n', j)
end
y = step_unit(w*x + b);
close(video_evolution)
