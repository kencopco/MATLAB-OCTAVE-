function [a,b] = delivery(x,y,V)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: Jiacheng Sun
% Date: 9th June, 2018
%
% Description: A function to find the best location
% (a,b) for a distribution center to deliver V(i)
% tons of material to each customer at (x(i),y(i)).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main Function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for A = 0:30 
  for B = 0:50
    D(A+1,B+1) = totalCost(x,y,V,A,B);
  end
end
[i,j]= find(D == min(min(D)));
k = i - 1;
g = j - 1;
a = k(1);
b = g(1);
% End of the main function
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Local Functions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [d] = dist(X,Y,A,B)

% Add your code here to find the distance from
% the point (X,Y) to the point (A,B)
d = sqrt((A-X).^2 + (B-Y).^2);
% Note: X,Y,A,B are all scalars

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [C] = totalCost(x,y,V,A,B)

% Add your code here to find the total cost of
% delivering to all customers if the distribution
% center was located at the point (A,B)
C = sum(dist(x,y,A,B).*V/2);
% Note: A,B are sclaras, but x,y,V are vectors

end
