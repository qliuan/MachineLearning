%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
global X y m

data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);
n = 2;
X = [ones(m, 1) X];

%% Set Up Cost Function
function [jVal, gradient] = costFunction(theta)
	diff = X*theta-y;
  	jVal = sum(diff.^2)/(2*m);
  	gradient = (X'*diff)/m;
end

%% Call Advanced Optimation Algorithm to Compute OptTheta
options = optimset('GradObj', 'on', 'MaxIter', 100);
initialTheta = zeros(n+1,1);
[optTheta, functionVal, exitFlag] = fminunc(@costFunction, initialTheta, options);

%% Display Advanced Optimation Algorithm's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', optTheta);
fprintf('Cost Function Value: \n');
computeCostMulti(X, y, optTheta)
fprintf('\n');

%% Estimate the price of a 1650 sq-ft, 3 br house and pause
price = [1, 1650, 3]*optTheta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;



% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('Cost Function Value: \n');
computeCostMulti(X, y, theta)
fprintf('\n');

%% Estimate the price of a 1650 sq-ft, 3 br house and pause
price = [1, 1650, 3]*optTheta;

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

