clc 
clear all
close all

f=@(x)(x(1)-2)^4+(x(1)-2*x(2))^2;
x0=[0 1]';
% options = optimoptions(@fmincon,'Algorithm','sqp');
[x1,fval,~,output] = fmincon(f,x0,[],[],[],[],[],[],@confun);%,options);
disp(x1)


[x1,x2]=meshgrid(0:.1:2,0:.1:2);
f=(x1-2).^4+(x1-2*x2).^2;
x=0.:0.1:2;
y=x.^2;
figure
surface(x1,x2,f)
hold on
line(x,y,max(f),'Color',[1 1 1])
hold off

