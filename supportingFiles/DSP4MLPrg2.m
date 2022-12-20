clear; clc; close all;
[x,sr]=audioread('TONE.wav');

[xm, ht]=frames(x, 100, 0.9, sr);
nof=size(xm,2);
nfft_fr=2^16;
fxm=fft(xm,nfft_fr);

afxm=abs(fxm(1:nfft_fr/2,:));
t_fr=[0:nof-1]*ht;
f=[0:nfft_fr/2-1]/nfft_fr*sr;
figure
imagesc(t_fr,f,20*log10(afxm)), axis xy, colormap(jet), colorbar
figure
for k=1:nof
    plot(f,afxm(:,k))
    pause
end
