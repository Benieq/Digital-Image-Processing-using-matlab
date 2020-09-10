f=imread('girl.jpg');
f_s=tofloat(f);
f_2 = rgb2gray(f);
f_d=mat2gray(f); 
f_d_2=mat2gray(f_2);

clear f_2
clear f_d
clear f_s
f=f_d_2;
clear f_d_2
