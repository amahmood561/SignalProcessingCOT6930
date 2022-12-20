clear; clc; close all;
%[x,sr]=audioread('dft.wav');
[x,sr]=audioread('sa1.wav');
td=1/sr;
%soundsc(x,sr)
lx=length(x);
t=[0:lx-1]*td;
% figuree
% plot(t,x)

[xm, ht]=frames(x, 125, 0.9, sr);
nof=size(xm,2);
lof=size(xm,1);
nfft_fr=2^11;
fxm=fft(xm,nfft_fr);

afxm=abs(fxm(1:nfft_fr/2,:));
t_fr=[0:nof-1]*ht;
f=[0:nfft_fr/2-1]/nfft_fr*sr;
%figure
%imagesc(t_fr,f,20*log10(afxm)), axis xy, colormap(jet), colorbar
M=20;  %no of lags acf
r=zeros(M,M);
dy=M/sr*1e3;  %duration (ms) of a frame with M samples
V=zeros(M,M,nof);
D=zeros(M,nof);
VV=V;
Dv=D;
figure
for k=1:1:nof
    y=xm(:,k);
    [ym, hty]=frames(y,dy , 0.9, sr);%Divide each frame into 10 sample frames with 9 sample overlap
    nofy=size(ym,2);
    r=ym*ym'; %acf estimate  /nofy
    [v d]=eig(r);  
    V(:,:,k)=v;
    lambda=diag(d);
    D(:,k)=lambda;
    vym=v'*ym;
    rv=vym*vym'; %acf estimate /nofy
    [vv dv]=eig(rv);
    Vv(:,:,k)=vv;
    lambdav=diag(dv);
    subplot(311),stem(lambda), hold, pause(0.3), stem(diag(rv)), legend('eigs','diag rv'), hold off
    subplot(312), plot(y)
    subplot(313), plot(v)
  
end
figure
plot(D)
