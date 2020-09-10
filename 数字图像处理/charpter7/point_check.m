%µã¼ì²â
function point_check(f)
w=[-1 -1 -1;
    -1 8 -1;
    -1 -1 -1];
g=abs(imfilter(tofloat(f),w));
T=max(g(:));
g=g>=T;
imshow(g);
end