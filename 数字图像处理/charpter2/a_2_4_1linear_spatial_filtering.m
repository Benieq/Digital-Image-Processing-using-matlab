%线性空间滤波
% 521*521 double
w=ones(10);

gd=imfilter(f_d_2,w);
figure(1);
imshow(gd,[ ]);
title('imfilter');

gd=imfilter(f_d_2,w,'replicate');
% replicate去除黑边
figure(2);
imshow(gd,[ ]);
title('imfilter_replicate');



