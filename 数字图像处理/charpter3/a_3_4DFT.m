%¶þÎ¬ÀëÉ¢¸µÁ¢Ò¶±ä»»
read_girl
clear f_2
clear f_d
clear f_s
f=f_d_2
clear f_d_2

imshow(f)
f=tofloat(f);
F=fft2(f);
S=fftshift(log(1+abs(F)));
figure(1)
imshow(S,[])
h=fspecial('sobel')';
figure(2) 
freqz2(h)
PQ=paddedsize(size(f));
H=freqz2(h,PQ(1),PQ(2));
H1=ifftshift(H);
figure(3)
imshow(abs(H),[])
figure(4)
imshow(abs(H1),[])
 
gs=imfilter(f,h);
gf=dftfilt(f,H1);

figure(5)
imshow(gs,[])
figure(6)
imshow(gf,[])

figure(7)
imshow(abs(gs),[])
figure(7)
imshow(abs(gf),[])
figure(8)
imshow(abs(gs)>0.2*abs(max(gs(:))))
figure(9)
imshow(abs(gf)>0.2*abs(max(gs(:))))


