clear; clc; close all;

%generate a custom signal using wavelet (psi) and scaling function(phi)
figure
[phi,psi,xval] = wavefun('db4',6);
subplot(211),plot(xval,psi); title('db4 Wavelet');
subplot(212),plot(xval,phi); title('db4 scaling function');
lph=length(phi);
phi4=phi(1:4:lph);
psi4=psi(1:4:lph);

x=[phi zeros(1,500) 0.6*phi4 zeros(1,500) psi zeros(1,500) 2*psi4];

sr=16000;
lx=length(x);

td=1/sr;

t=[0:lx-1]*td;

% wavelet decomposition
L=3;  %level
[c,l] = wavedec(x, L, 'db4');

%display coeeficcients
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





