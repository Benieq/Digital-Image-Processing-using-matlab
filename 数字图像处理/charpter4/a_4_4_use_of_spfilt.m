%������Ϊ0.1�Ľ���������Ⱦ
[M,N]=size(f);
R=imnoise2('salt & pepper',M,N,0.1,0);
gp=f;
gp(R==0)=0;
%������������Ⱦ
R=imnoise2('salt & pepper',M,N,0,0.1);
gs=f;
gs(R==1)=255;
%Q����������˲���
fp=spfilt(gp,'chmean',3,3,1.5);
%Q����������˲���
fs=spfilt(gs,'chmean',3,3,-1.5);
%������С�˲���
fpmax=spfilt(gp,'max',3,3);
fsmin=spfilt(gs,'min',3,3);

figure(1);
imshow(f);
title('f');

figure(2);
imshow(fp);
title('fp');

figure(3);
imshow(fpmax);
title('fpmax');

figure(4);
imshow(fs);
title('fs');

figure(5);
imshow(fsmin);
title('fsmin');

figure(6);
imshow(gp);
title('gp');

figure(7);
imshow(gs);
title('gs');

figure(8);
imshow(R);
title('R');