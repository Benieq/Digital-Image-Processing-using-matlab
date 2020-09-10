%µÍÍ¨/Æ½»¬ ÆµÂÊÓòÂË²¨Æ÷

[f ,revertclass]=tofloat(f);
PQ=paddedsize(size(f));
[U ,V]=dftuv(PQ(1),PQ(2));
D=hypot(U,V);
D0=0.05*PQ(2);
F=fft2(f,PQ(1),PQ(2));

H=exp( -(D.^2) / (2*D0^2) ) ;

g=dftfilt(f,H);
g=revertclass(g);

figure(1);
imshow(fftshift(H));

figure(2);
imshow(log(1+ abs(fftshift(F))),[]);

figure(3);
imshow(g);
