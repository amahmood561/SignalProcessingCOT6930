%%Question#1
%Part#1
%%==================================================================
%%Implement Adaptive Filter with size=0.4
Fs=1000;
Ts=1/Fs;
order=12;
t=0:Ts:1-Ts;
x=sin(2*pi*t/30);
noise=randn(size(x));
x=x+noise;
x=max(x)\x;
x=x';
b=fir1(order,0.3,'low');
filteraion=filter(b,1,x);
mu=0.4;
lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([b.' w]);
title('Lms Filteration');

%Part#
%%==================================================================

%Part 2
%%Plotting
%%Plot x[n]
figure(2)
subplot(4,1,1)
stem(t,x)
d=cos(2*pi*t/30);
subplot(4,1,2)
stem(t,d)
subplot(4,1,3)
stem(t,y)
subplot(4,1,4)
stem(t,e)

%%==============================================================

%Part 3
%% i) Error Signal
e=d-y;
disp('Error Signal is:')
disp(e);
figure(3)
stem(t,e)

%% ii) Squared Error Calcualte
E=0.02;
J=E*e*e;

%% iii) Handwritten Work

%%==========================================================

%%Part 4
%%3D plot
w0=x;
w1=y;
figure(4)
mesh(x,y,J);

%%===============================================


