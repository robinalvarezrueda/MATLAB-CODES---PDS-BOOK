%% PRACTICE 14.7. Linear Classification and Evolution of the Decision Boundary

clc; close all;
% Data:
x = [1   -0.8  -1.4  0.9 1.3 0.5 0.1 1.3 1.2;  -1.4 -0.7   2.3 -2.2 1.5 0.4 0.4 1.2 0.8];
t = [0 0 0 0 1 1 1 1 1]; % desired outputs
w = rand(1,2); % randomly generated weights
b = rand;      % randomly generated bias

plot(x(1,1:4), x(2,1:4), '*'); hold on
plot(x(1,5:9), x(2,5:9), '+'); hold on
axis([-3 3 -3 3]); hold 
X = -1.5:0.5:1.5;
Y = (-b - w(1)*X) ./ w(2); % decision boundary equation
plot(X, Y);hold;
title('Initial Decision Boundary')
legend('Data1','Data2','Boundary')
grid on

% Create VideoWriter object:
video_evolution = VideoWriter('decisionBoundary2D');
video_evolution.FrameRate = 1;
open(video_evolution);

% Try 40 epochs (iterations) to check if it converges
figure
for j = 1:40
    y = step_unit (w*x + b);
    if all(t == y)
        break
    end
    w = w + (t - y)*x';
    b = b + (t - y)*ones(length(x),1);
    plot(x(1,1:4), x(2,1:4), '*'); hold on
    plot(x(1,5:9), x(2,5:9), '+'); hold on
    axis([-3 3 -3 3]); hold on
    X = -3:0.5:3;
    Y = (-b - w(1)*X) ./ w(2);
    plot(X, Y); hold
    title(' Evolution of the Decision Boundary')
    legend('Data1','Data2','Boundary')
    grid on
    M = getframe(gcf); % capture a frame from the current figure
    writeVideo(video_evolution, M); % save the frame in the video object
end
if j == 40
    fprintf('Solution not found.\n')
else
    fprintf('Solution found in %i epochs.\n', j)
end
y = step_unit(w*x + b);
close(video_evolution)
