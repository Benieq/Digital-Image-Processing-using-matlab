PQ=paddedsize(size(f));
D0=0.05*PQ(1);
H=hpfilter('gaussian',PQ(1),PQ(2),D0);
g=dftfilt(f,H);
figure(2)
imshow(g);