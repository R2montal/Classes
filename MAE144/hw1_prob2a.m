clear all; clc; close all; format default;

%% HW1_prob2a

b = RR_poly([-2 2 -5 5], 1);
a = RR_poly([-1 1 -3 3 -6 6], 1);

f = RR_poly([-1 -1 -3 -3 -6 -6], 1);

[x,y] = RR_diophantine(a, b, f);

test = trim(a*x + b*y);

% Prob dont need: test = trim(a*x + b*y);
%                 residual1 = norm(f - test);




%% H1_prob2b

% Note: When tring to determine if D(s)=y(s)/x(s) is proper, use this rule for the
% following: 
% Proper: if y(s) is LESS then or equal to the degree of x(s)
% Improper: if y(s) is GREATER then or equal to the degree of x(s)
% P.S. we are coming the highest degrees between x(s) and y(s) to determing
% if controller is proper

% In our case y(s) has a high order of 5 and x(s) 3. Thus becauase y(s) is
% greater than x(s) this D(s) controller is IMPROPER.

% a(s) and b(s) do not change, only f(s) is modified by modifiying k.

%multiple for k=3 by (s+20)^k (this no work) 
%f = RR_poly([-1 -61 -1263 -9383 -11786 -27966 -31560 -55200 -48000], 1);

%multiple for k=5 by (s+20)^k (this no work) 
f = RR_poly([-1 -101 -4103 -84303 -892306 -4252606 -5864600 -12504000 ...
    -1488000 -24000000 -19200000], 1);

[x,y] = RR_diophantine(a, b, f)

% if k = 5 then we have order y(s) to be greater then the highest order of
% x(s) making this controller PROPER



