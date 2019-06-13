%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Project 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DATE: March 28, 2018
% NAME: Jiacheng Sun
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [a,b,c,d] = spline(x,y)

% A function returning the coefficients of a cubic spline interpolating a set
% of given nodes.

% INPUTS

% x - a row vector of x-values
% y - a row vector of the corresponding y-values

% OUTPUTS

% The outputs a,b,c,d are vectors of cofficients such that a(i), b(i), c(i),
% and d(i) are the coefficients of the ith cubic of the form:

% S(x) = a(i) + b(i)*(x-x(i)) + c(i)*(x-(i))^2 + d(i)*(x-x(i))^3

% a,b,c,d should be vectors of length n-1, where x,y have length n

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  h =[];
  for i = 1 : length(x)-1
    h0 = x(i);    
    h1 = x(i+1);  
    h(i) = h1 - h0;
  end
  
  a = [];
  for i = 1: length(x)- 1
    a(i) = y(i);     

  end

  alpha = [];
  for i = 2 : length(x)-1
    a0 = y(i-1);
    a1 = y(i);
    a2 = y(i+1);
    alpha(i) = 3/h(i)*(a2 - a1) - 3/h(i-1)*(a1 - a0);  
  end

  A = zeros(length(h)+1, length(h)+1);
  for i = 2 : length(h)
    if i == length(h)
      A(i,i) = 2 * (h(i-1) + h(i));
      A(i,i+1) = h(i);
      A(i+1,i) = 0;
     else
      A(i,i) = 2 * (h(i-1) + h(i));
      A(i,i+1) = h(i);
      A(i+1,i) = h(i);
     end
  end
  A(1,1) = 1;
  A(2,1) = h(1);
  A(length(h)+1,length(h)+1) = 1;

  B = transpose(alpha);
  B(length(alpha)+1) = 0;

  %disp(A)
  %disp(B)
  %disp(h)
  
  c0 = linsolve(A,B);
  c = transpose(c0(1:length(c0)-1)); 
  
  b = [];
  d = [];
  for i = 1 : length(x) - 1
    b(i) = 1/h(i)*(y(i+1)-y(i)) - h(i)/3*(2*c0(i)+c0(i+1));
    d(i) = 1/(3*h(i))*(c0(i+1)-c0(i));
  end
  
end
