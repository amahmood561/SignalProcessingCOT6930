clear; clc; close all;

sr=16000;
lx=800;

td=1/sr;

t=[0:lx-1]*td;
x=sin(2*pi*100*t)+sin(2*pi*1500*t);
% wavelet decomposition
L=6;
[c,l] = wavedec(x, L, 'db4');


figure
subplot(L+2,1,1),plot(t,x), title('sa1'), xlabel('t(s)')
approx=appcoef(c,l,'db4');
la=length(approx);


ns=2;
for n=1:L
    td=td*2;
    dd=detcoef(c,l,n,'db4');  
    ldd=length(dd)
    tt=(0:ldd-1)*td;
    subplot(L+2,1,ns), plot(tt,dd), title(['Level ', num2str(n), ' detail coefficients']), , xlabel('t(s)')
    ns=ns+1;
end

tt=(0:la-1)*td;
subplot(L+2,1,ns),plot(tt,approx), title('approximation coefficients')

% reconstruct

xr=waverec(c,l,'db4');
figure
plot(t,x), hold, plot(t,xr), legend('orogonal','reconstructed')

%create projections
xrr=zeros(lx,L+1);
cc=zeros(size(c));
beg=0;
fin=0;
figure
    for k=1:L+1
        beg=fin+1;
        fin=beg+l(k)-1;
        cc(beg:fin)=c(beg:fin);
        xrr(:,k)=waverec(cc,l,'dB4');
        cc=zeros(size(c));
        subplot(L+1,1,k),plot(t,xrr(:,k)), title(['Projection level ', num2str(k)])
    end

%% plot the wavelet
figure
[phi,psi,xval] = wavefun('db4',15);
subplot(211),plot(xval,psi); title('db4 Wavelet');
subplot(212),plot(xval,phi); title('db4 scaling function');


figure
[phi,psi,xval] = wavefun('haar',15);
subplot(211),plot(xval,psi); title('haar Wavelet');
subplot(212),plot(xval,phi); title('haar scaling function');


% figure
% plot(t,xrr), title('projections')
% 
% xrrs=sum(xrr,2);
% figure
% plot(x), hold, pause, plot(xrrs), legend('original','sum of projections')

% figure
% subplot(211),plot(t,x)
% %Add noise to x
% 
% SNR=0;
% 
% ex=x'*x/lx;
% ew=ex*10^(-SNR/10);
% 
% w=randn(lx,1);
% w=w*sqrt(ew);
% x=x+w;
% subplot(212), plot(t,x), title(['signal+ noise, SNR= ', num2str(SNR), 'dB']);
%Break xm into frames
% [xm, ht]=frames(x, 200, 60, sr);
% nof=size(xm,2);
% lof=size(xm,1);




