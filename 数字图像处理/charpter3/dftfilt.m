function g = dftfilt(f,H,classout)
% �˺����ɽ�������ͼ���һ���˲��������ɴ������е�
% �˲�ϸ�ڲ�������˲��ͼ��к��ͼ��
% ����.m�ļ�������һ���ļ���
% file->set path->add with subfolder
% ���㺯�������ļ�����ӵ�����·��
% save�Ϳ��Խ�����ӵ���ĺ�������
[f,revertClass]=tofloat(f);
F=fft2(f,size(H,1),size(H,2));
g=ifft2(H.*F);
g=g(1:size(f,1),1:size(f,2));
if nargin==2||strcmp(classout,'original')
    g=revertClass(g);
elseif strcmp(classout,'fltpoint')
    return
else
    error('undefined class for the output image')
end