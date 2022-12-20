%clear all
close all
clc
[speech,sf]=audioread('TONE.wav');%reading the audio signal
sound(speech,sf); %Listen to audio file
speechlength = length(speech);% total length of speech
x = speechlength/sf; % x is the sampling period   
time = linspace(0, x, speechlength);%finding the length of time
figure(1)
subplot(2,2,1)
plot(time,speech), title('TONE,wave in frequency domain'),ylabel('Amplitude'), xlabel('Time (secs)');
dft_speech = fft(speech);
nfft = (0:length(speech)-1)*100/length(speech); 
subplot(2,2,2)
abs_value=fftshift((abs(dft_speech(:,1))));
plot(nfft,abs_value)
title('TONE,wave in time domain'),ylabel('Amplitude'), xlabel('dfft speech in freq (HZ)');
t=0:0.0005:1;
x=sin(2*pi*100*t);
sound(x,sf)
subplot(2,2,3)
plot(x)
title('sine wave'),  ylabel('Amp'), xlabel('Time (secs)');
dft_x = fft(x);
subplot(2,2,4)
abs_valu=fftshift((abs(dft_x)));
plot(abs_valu)
title('sine wave in freq domain'),ylabel('Amplitude'), xlabel('dfft sine in freq (HZ)');
 %filter design and simulations 
 w0=0.314;
 r=0.98;
 b2=0.96;
 b1=-1.95;
 b0=1;
 a0=1;
 a1=1.99;
 a2=1;
 a=[b2 -b1 b0];
 b=[a2 -a1 a0];
 figure(2)
 [zero pole gain] = tf2zp(a,b)
 zplane(zero,pole)
 grid on
%apply butter worth filter 
[b, a] = butter(6,500/(Fs/2));
freqz(b,a)
% use filter command 
clean1 = filter(b, a, speech);
% Play the sound.
player = audioplayer(clean1, Fs);
info = audioinfo('TONE.wav')
[speech, sf]=audioread('TONE.wav');;
dt = 1/sf;  % Sampling time [s]
t = 0:seconds(1/sf):seconds(info.Duration);
t = t(1:end-1);
plot(t,clean1 );          % Filtered output
title('Filtered Signal ');
xlabel('Time (s)'); 
ylabel ('Amplitude');
play(player);

%compute nff-dfft
y = fft(clean1);                               
dft_clean1 = abs(y);
%figure(6)
subplot(2,2,1)
plot(dft_clean1)
 clean2=filter(a,b,x);
%  figure(4)
 subplot(2,2,2)
 plot(clean2,'g')
% plr1 = audioplayer(clean2, Fs);
% play(plr1);
 
 
 clean3=filter(a,b,speech);
%  figure(5)
 subplot(2,2,3)
 plot(clean3,'yellow')
%  plr = audioplayer(clean3, Fs);
%  play(plr);
 
 
%plot H1(z) ,H2(z) and H3(z) 
%for H1(z) 
 w1=0.12;
 r1=0.98;
 b5=0.96;
 b4=-1.95;
 b3=1;
 a3=1;
 a4=1.99;
 a5=1;
 a=[b2 -b1 b0];
 b=[a2 -a1 a0];
 [zero pole gain] = tf2zp(a,b)
 zplane(zero,pole)
 grid on
%apply butter worth filter 
[b1, a1] = butter(6,500/(Fs/2));
freqz(b1,a1)
% use filter command 
clean1 = filter(b, a, speech);
% Play the sound.
player = audioplayer(clean1, Fs);
play(player);
 
%for H2(z) 
 w2=0.12;
 r2=0.98;
 b8=0.96;
 b7=-1.95;
 b6=1;
 a8=1;
 a7=1.99;
 a6=1;
 a=[b2 -b1 b0];
 b=[a2 -a1 a0];
 figure(5)
 [zero pole gain] = tf2zp(a,b)
 zplane(zero,pole)
 grid on
%apply butter worth filter 
[b, a] = butter(6,500/(Fs/2));
freqz(b,a)
% use filter command 
clean2 = filter(b, a, speech);
% Play the sound.
player = audioplayer(clean1, Fs);
play(player);
 
%for H3(z) 
 w3=0.12;
 r3=0.98;
 b11=0.96;
 b10=-1.95;
 b9=1;
 a11=1;
 a10=1.99;
 a9=1;
 a=[b2 -b1 b0];
 b=[a2 -a1 a0];
 figure(5)
 [zero pole gain] = tf2zp(a,b)
 zplane(zero,pole)
 grid on
%apply butter worth filter 
[b1, a1] = butter(6,500/(Fs/2));
freqz(b1,a1)
% use filter command 
clean3 = filter(b, a, speech);
% Play the sound.
player = audioplayer(clean3, Fs);
play(player);
%represent into time domain and frequency domain 
%y = sin(2*pi*player);
figure(6)
subplot(3,3,1)
plot(clean3)
subplot(3,3,2)
stem(clean3)
% (c) obtain overall filter
sys1=clean1+clean2+clean3;
sound(sys1)
%%
%portion 2 
clc
[speech,sf]=audioread('TONE.wav');%reading the audio signal
%[ht]=Frames(speech, 200, 0.8,fs); % 2 a i

[xm]=getframe(speech);
nof=size(xm,2);
nfft_fr=2^18;
fxm=fft(xm,nfft_fr);  % 2 a ii

afxm=abs(fxm(1:nfft_fr/2));
t_fr=[0:nfft_fr/2-1]/nfft_fr*sf;
figure 
imagesc(t_fr,speech,20*log10(afxm)), axis xy,colormap(jet),colorbar % 2 a iii
figure
for k=1 :nof
    plot(speech,afxm(:,k)) % 2 a iv
    pause
end
clean = filter(b, a, speech);
% Play the sound.
player = audioplayer(clean3, Fs);
play(player);





% separate script to print out 1-i through 1-iv print each separately
clc
clear all
close all
%(a)    Read the file TONE.wav into a vector called speech. Note its sample rate sf. 
%Plot speech versus time and play it using soundsc. 
info = audioinfo('TONE.wav')
[speech, sf]=audioread('TONE.wav');
player = audioplayer(speech,sf);
play(player);
dt = 1/sf;  % Sampling time [s]
t = 0:seconds(1/sf):seconds(info.Duration);
t = t(1:end-1);
figure
plot(t,speech)
title('audio signal');
xlabel('Time [s]')
ylabel('speech')
hold on
%Note the length of speech as lengthspeech.
lengthspeech=length(speech);
nfft=2^16;
dftspeech = fft(speech,nfft); %fft of speech
f = (0:nfft-1)*(sf/nfft)/10;
figure
plot(f,dftspeech)
title('audio signal fft');
xlabel('Frequency')
ylabel('dftspeech')
hold on
f1 = (0:nfft-1)*(sf/nfft)/20;
figure
plot(f1,dftspeech)
title('audio signal fft');
xlabel('Frequency')
ylabel('dftspeech')
z=f(:,10);
t1=t(:,8);
%for wo
wo=2*pi.*z.*t1;
%for poles and zeros
NUM = [1 -1.98 1];
DEN=[1 -1.94 0.96];
TRANF=tf(NUM,DEN)      %transfer function
[ZEROS POLES]=tf2zp(NUM,DEN);
disp('Poles of transfer function are:');
disp(POLES);
disp('Zeros of transfer function are:');
disp(ZEROS);
figure
zplane(NUM,DEN);
grid on
 
hold on

%for filter signal
clean1 = medfilt1(speech,90);                           
Fn = sf/2;                              % Nyquist Frequency (Hz)
Wp = 1000/Fn;                           % Passband Frequency (Normalised)
Ws = 1010/Fn;                           % Stopband Frequency (Normalised)
Rp =   1;                               % Passband Ripple (dB)
Rs = 150;                               % Stopband Ripple (dB)
[n,Ws] = cheb2ord(Wp,Ws,Rp,Rs);         
[z,p,k] = cheby2(n,Rs,Ws,'low');        
[soslp,glp] = zp2sos(z,p,k);    
filtered_sound2 = filtfilt(soslp, glp, clean1);
%_______________________________________________________________________________%
 
figure
plot(t,filtered_sound2);          % Filtered output
title('Filtered Signal ');
xlabel('Time (s)'); 
ylabel ('Amplitude');

