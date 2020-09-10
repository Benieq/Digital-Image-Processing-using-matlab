%Ïß¼ì²â

w=[2 -1 -1 ;
    -1 2 -1 ;
    -1 -1 2];
g=imfilter(tofloat(f),w);
imshow(g,[])
gtop=g(1:120,1:120);
gtop=pixeldup(gtop,4);
figure(1);
imshow(gtop,[]);
title('gtop');

gbot=g(end-119:end,end-119:end);
gbot=pixeldup(gbot,4);
figure(2);
imshow(gbot,[]);
title('gbot');

g=abs(g);
figure(3)
imshow(g,[]);
title('abs g');

T=max(g(:));
g=g>=T;
figure(4);
imshow(g);
title('g max');
