function [s, hoptime]=frames(x,td,olf,fs)
% function [s, hoptime]=frames(x,td,olf,fs)
%x is input data vector, td is duration of one frame in ms. 
%olf is the overlap as a decimal fraction. 0<=olf<1. hoptime is the
%recirocal of hoprate (no of frames/second)
%fs is the sampling rate
%frames are arranged in the columns of matrix s
lx=length(x);
L=fix(td*fs/1000);  % window length in samples
noverlap=fix(olf*L); %number of overlapping samples between each segment
hoptime=(L-noverlap)/fs;
nseg= fix((lx-noverlap)/(L-noverlap));
s=zeros(L,nseg);                         % convert x to matrix form
for k=1:nseg
    begin=(k-1)*(L-noverlap)+1;
    s(:,k)=x(begin:(begin+L-1));  
end
