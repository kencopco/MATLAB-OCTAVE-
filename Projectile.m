%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Projectile.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cmpsc 200 Assignment 1

% Author: <Jiacheng Sun> 
% Date: <2018/1/22>

%{ 
Description: a program to calculate the horizontal distance away 
from the beginning point. the initial height is 80, shooting angle pi/4
g is 9.81.
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Initial Data

% Set initial values for v0, theta, y0, and g


v0 = 10:10:100
theta = pi/4
y0 = 80
g = 9.81

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Calculated values

% Calculate the vectors v0x, v0y, t, and x

v0x = v0*cos(theta);
v0y = v0*sin(theta);

t = (v0y + sqrt(v0y.^2 + 2*g*y0))/g;
x = v0x.*t;
% <suppress this output by ending your lines with the ; operator>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Output

% Calculate the final result table and assign to 'distances'.

% <add your code here>
distance = [v0' x']
% <the final 'distances' table should be not be suppressed>
