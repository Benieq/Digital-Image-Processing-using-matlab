function H = hpfilter(type, M, N, D0, n)

% 计算给定类型（理想、巴特沃兹、高斯）的频域高通滤波器
if nargin == 4
    n = 1;
end
Hlp = lpfilter(type, M, N, D0, n);
H = 1 - Hlp;     