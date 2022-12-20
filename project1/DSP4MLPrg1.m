clear; clc; close all;
[x,sr]=audioread('TONE.wav');
%soundsc(s,sr)
%plot vs time
lx=length(x);
t=[0:lx-1]/sr; %time vector in seconds
figure
plot(t,x)
xlabel('t(s)')
%Optional, to see samples stored in your computer
% hold
% plot(t,x,'r.')
%Find DFT
nfft=2^20;        %nfft>=lx, no of points in DFT

fx=fft(x,nfft);
afx=abs(fx);

f=[0:nfft-1]/nfft*sr;  %frequency calibrated to Hz (analog frequency). Maximum is sr/2
fn=[0:nfft-1]/nfft; %normalized frequency multiplied by 2*pi is one period of X(e^jw)
figure
plot(fn,afx)
xlabel('\omega (x 2 \pi)')
title('Spectral magnitude')

%Center DFT around zero frequency

oafx=fftshift(afx);
%calibrate frequency axis
of=[-nfft/2:nfft/2-1]/nfft*sr;
figure
plot(of,oafx)
title('Spectral magnitude of signal with interference')
xlabel('f(Hz)')

%Prototype filter 1 - all zero- fir
fo=1329.98/sr;
%Choose filter to put spectral zeros at notch frequencies
b=[1 -2*cos(2*pi*fo) 1];
a=1;
%obtain filter transfer function: spectral magnitude
fho=freqz(b,a,nfft,'whole');
afho=abs(fho);
figure(2), hold
plot(fn,1000*afho,'r')
legend('signal','filter-1')
%zoom in on Figure(2) to see what the filter can do, and what it does not
%do.
%filter the signal
yo=filter(b,a,x);
fyo=fft(yo,nfft);
afyo=abs(fyo);

%Explore the output by plotting in time and frequency

figure
subplot(2,2,1), plot(t,x)
subplot(2,2,2), plot(t,yo)
subplot(2,2,3), plot(fn,afx)
subplot(2,2,4), plot(fn,afyo)

%Listen to the filtered signal
soundsc(yo,sr)

%Not quite right, is it?

%Improve on the filter by adding poles

r=0.98;
a=[1 -2*r*cos(2*pi*fo) r*r];
y=filter(b,a,x);

fy=fft(y,nfft);
afy=abs(fy);
fh=freqz(b,a,nfft,'whole');
afh=abs(fh);
figure
subplot(2,2,1), plot(t,x)
subplot(2,2,2), plot(t,y)
subplot(2,2,3), plot(fn,afx)
subplot(2,2,4), plot(fn,afy)

%Listen again
pause
soundsc(y,sr)



