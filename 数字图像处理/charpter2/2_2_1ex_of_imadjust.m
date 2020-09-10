%灰度变换函数imadjust测试
%调用 ex_of_imadjust;

f=imread('girl.jpg');
figure(1);
imshow(f);
title('原始图片:f');

g1=imadjust(f,[0 1],[1 0]);
figure(2);
imshow(g1);
title('灰度反转:g1');

g=imcomplement(f);
figure(3);
imshow(g);
title('imcomplement:g');

g2=imadjust(f,[0.5 0.75],[0 1]);
figure(4);
imshow(g2);
title('imadjust(f,[0.5 0.75],[0 1]):g2');

g3=imadjust(f,[],[],2);
figure(5);
imshow(g3);
title('imadjust(f,[],[],2):g3');

%************************
close all;

Low_High=stretchlim(f);
%低限 高限

g=imadjust(f,stretchlim(f),[]);
figure(1);
imshow(g);
title('g=imadjust(f,stretchlim(f),[]);');

g=imadjust(f,stretchlim(f),[1 0]);
figure(2);
imshow(g);
title('g=imadjust(f,stretchlim(f),[1 0])');






