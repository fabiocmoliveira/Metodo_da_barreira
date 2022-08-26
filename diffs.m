% clc
clear all

syms x1 x2 x3 x4 x5 c1 c2 c3
% 
f=(x1-2)^4+(x1-2*x2)^2;
f1=diff(f,x1);disp(f1)
f2=diff(f,x2);disp(f2)

g=x1^2-x2;%g=-g;
% g1=diff(log(-g),x1);disp(g1)
% g2=diff(log(-g),x2);disp(g2)

g1=diff(-1/g,x1);disp(g1)
g2=diff(-1/g,x2);disp(g2)
