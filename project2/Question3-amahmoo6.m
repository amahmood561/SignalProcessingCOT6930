%%Question#3
%%========================================================
%%Load .wav file
Fs=44074;
Ts=1/Fs;
order=12;
mu=0.1;
SNR=10;
t=0:Ts:1-Ts;
x=audioread('Tone.mp4');
noise=randn(size(x));
x=x+noise;
x=max(x)/x;
x=x';
plot(x)
s=sin((2*pi*t/15)-pi/3);
b=fir1(order,0.3,'low');
d=awgn(b,SNR);

filteraion=filter(d,1,x);

lms=dsp.LMSFilter(order+1,'StepSize',mu,'WeightsOutputPort',true);
[y,e,w]=step(lms,x,filteraion);
stem([d.' w]);
title('Lms Filteration');

%Part a)
%plotting
figure(2)
subplot(3,1,1);
stem(t,y)
subplot(3,1,2);
stem(t,e);
subplot(3,1,3);
stem(t,x);