%% Set Up Cost Function
function [jVal, gradient] = costFunction(theta)
	diff = X*theta-y;
  	jVal = sum(diff.^2)/(2*m);
  	gradient = (X'*diff)/m;
end