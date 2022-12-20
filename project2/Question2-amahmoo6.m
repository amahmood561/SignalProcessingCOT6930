%%Question#2
%Part#1
%%==================================================================
%%Implement Adaptive Filter with size=0.1
Fs=1000;
Ts=1/Fs;
order=12;
mu=0.1;
SNR=10;
t=0:Ts:1-Ts;
x=sin(2*pi*t/15);
noise=randn(size(x));
x=x+noise;
x=max(x)\x;
x=x';
s=sin((2*pi*t/15)-pi/3);
b=fir1(order,0.3,'low');
d=awgn(b,SNR);

filteraion=filter(d,1,x);

lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([d.' w]);
title('Lms Filteration');
%%=====================================================================

%Part a)
%plotting
figure(2)
subplot(3,1,1);
stem(t,y)
subplot(3,1,2);
stem(t,e);
subplot(3,1,3);
stem(t,x);

%%===================================================================

%%Part b)
%%==================================================================
%%Implement Adaptive Filter with size=0.4
Fs=1000;
Ts=1/Fs;
order=12;
mu=0.1;
SNR=0;
t=0:Ts:1-Ts;
x=sin(2*pi*t/15);
noise=randn(size(x));
x=x+noise;
x=max(x)\x;
x=x';
s=sin((2*pi*t/15)-pi/3);
b=fir1(order,0.3,'low');
d=awgn(b,SNR);

filteraion=filter(d,1,x);

lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([d.' w]);
title('Lms Filteration');

figure(3)
subplot(3,1,1);
stem(t,y)
subplot(3,1,2);
stem(t,e);
subplot(3,1,3);
stem(t,x);

%%======================================================

%%Part c)

%%Implement Adaptive Filter with size=0.4
Fs=1000;
Ts=1/Fs;
order=4;
mu=0.1;
SNR=5;
t=0:Ts:1-Ts;
x=sin(2*pi*t/15);
noise=randn(size(x));
x=x+noise;
x=max(x)\x;
x=x';
s=sin((2*pi*t/15)-pi/3);
b=fir1(order,0.3,'low');
d=awgn(b,SNR);

filteraion=filter(d,1,x);

lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([d.' w]);
title('Lms Filteration');

figure(4)
subplot(3,1,1);
stem(t,y)
subplot(3,1,2);
stem(t,e);
subplot(3,1,3);
stem(t,x);

%%===========================================================


%%Implement Adaptive Filter with size=0.4
Fs=1000;
Ts=1/Fs;
order=12;
mu=0.1;
SNR=5;
t=0:Ts:1-Ts;
x=sin(2*pi*t/15);
noise=randn(size(x));
x=x+noise;
x=max(x)\x;
x=x';
s=sin((2*pi*t/15)-pi/3);
b=fir1(order,0.3,'low');
d=awgn(b,SNR);

filteraion=filter(d,1,x);

lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([d.' w]);
title('Lms Filteration');

figure(4)
subplot(3,1,1);
stem(t,y)
subplot(3,1,2);
stem(t,e);
subplot(3,1,3);
stem(t,x);

%%======================================================================
%%Part (e)
%%Theoretical Part

%%=====================================================================
%%Part(f)
%%Theory Based

%%=========================================================================



