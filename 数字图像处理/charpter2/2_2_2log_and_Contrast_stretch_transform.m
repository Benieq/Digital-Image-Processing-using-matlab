%log_and_Contrast_stretch_transform
%�����ͶԱȶ�����任
%log<=>e
f=imread('girl.jpg');

%�Աȶ�����任
g=im2uint8(mat2gray(log(1+double(f))));
figure(1);
imshow(g);
title('g=im2uint8(mat2gray(log(1+double(f))))');

%��ֵ���任

g=im2uint8(mat2gray(g));
figure(2);
imshow(g);
title('g=im2uint8(mat2gray(g))');

