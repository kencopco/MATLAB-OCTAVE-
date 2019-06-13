%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% UFO.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cmpsc 200 Assignment 2

% Author: <Jiacheng Sun> 
% Date: <7 February, 2018>

%{ 
Description: <Assignment 2, create a plot of UFO.csv and add some annotations to
                to the plot> 
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Importing and manipulating the data
M = csvread('UFO.csv');
N = numel(M) / 2
lat = M(:,1);
long = M(:,2);
x1 = linspace(-150,-50);
y1 = 60*ones(1,100);
x2 = x1;
y2 = 20 * ones(1,100);
x3 = -150 * ones(1,100);
y3 = linspace(20, 60);
x4 = -50 * ones(1,100);
y4 = y3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Plotting

plot(long,lat,'.r')
grid on;
hold on;
plot(x1,y1,'LineWidth',4,'--b',x2,y2,'LineWidth',4,'--b',x3,y3,'LineWidth',4,'--b',x4,y4,'LineWidth',4,'--b')
title('UFO Sightings(1985-2000)')
xlabel('Longitude')
ylabel('Latitude')
legend('UFO Sightings','Region of interest')
home_lat = 32;
home_long = 120;
plot(home_long,home_lat,'xk','MarkerSize',12,'LineWidth',3)
text(home_long, home_lat, 'Jiacheng ''s Home Town')
axis([-150, -50, 20, 60])







