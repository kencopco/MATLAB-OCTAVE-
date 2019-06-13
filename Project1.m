%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATE: March 28, 2018
% NAME: Jiacheng Sun
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DESCRIPTION: A script to plot a functinon and a cubic spline interpolant.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear; clc		% Clear workspace and console

% Input

a = 0;			% Interval [a,b]		
b = 10;

n = 53;			% Number of nodes to use
tol = 1e-3;		% Tolerance for plot

f = @(x) sin(x);	% Given function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Create the spline

% Nodes

x = linspace(a,b,n); 	% A vector of n equally spaced points from a to b
y = f(x);		% A vector of corresponding y-values

% Get coefficients

[a, b, c, d] = spline(x,y);

% Cubic spline

S = [a' b' c' d'];	% A matrix where the ith row has the coefficients of
			% the ith cubic polynomial

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plotting

% Clear existing figures
clf

% Plotting the function

figure(1)
hold on

% x,y-values for plotting f(x)
x_ = linspace(x(1),x(n)); 	
y_ = f(x_);	
plot(x_,y_,'b-','LineWidth',2)

% Plotting the spline

for i = 1:n-1
	% Define the ith cubic polynomial
	S = @(t) a(i) + b(i)*(t-x(i)) + c(i)*(t-x(i)).^2 + d(i)*(t-x(i)).^3;
	
	% x,y-values for plotting ith cubic
	x_ = linspace(x(i),x(i+1));		
	y_ = S(x_);
	
	% Plot ith cubic
	plot(x_,y_,'r--','LineWidth',2)
end

% Add nodes
plot(x,y,'k+','LineWidth',3)

% Add a labels
xlabel('x')
ylabel('y')
myTitle = sprintf('Function f(x) and Cubic Spline S(x) (n=%i)',n);
title(myTitle);
legend('f(x)','S(x)')

% Plotting the error

figure(2)
hold on

for i = 1:n-1
	% Define the ith cubic polynomial
	S = @(t) a(i) + b(i)*(t-x(i)) + c(i)*(t-x(i)).^2 + d(i)*(t-x(i)).^3;
	
	% x,y-values for plotting the error
	x_ = linspace(x(i),x(i+1));
	y_ = S(x_) - f(x_);

	% Plot the error
	plot(x_,y_,'LineWidth',2)

	% Plot horizontal lines at the tolerance
	L1 = tol*ones(1,length(x_));
	L2 = -L1;
	plot(x_,L1,'r--','LineWidth',2)
	plot(x_,L2,'r--','LineWidth',2)
end

% Change plot window
axis([x(1),x(n),-tol*1.1,tol*1.1])

% Add labels
xlabel('x')
ylabel('Error')
myTitle = sprintf('Cubic Spline Error (n=%i)',n);
title(myTitle)

