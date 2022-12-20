
clear; clc; close all;
[LO_D,HI_D,LO_R,HI_R] = wfilters('db4') 

db=[LO_D',HI_D',LO_R',HI_R']

fdb=fft(db,128);
afdb=abs(fdb(1:64,:)).^2;
figure
for k=1:4
    subplot(4,1,k),plot(afdb(:,k))
end

s12=afdb(:,1)+afdb(:,2);
subplot(411), hold, plot(s12)

