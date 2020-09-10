%log_and_Contrast_stretch_transform
%对数和对比度拉伸变换
%log<=>e
f=imread('girl.jpg');

%对比度拉伸变换
g=im2uint8(mat2gray(log(1+double(f))));
figure(1);
imshow(g);
title('g=im2uint8(mat2gray(log(1+double(f))))');

%阈值化变换

g=im2uint8(mat2gray(g));
figure(2);
imshow(g);
title('g=im2uint8(mat2gray(g))');

