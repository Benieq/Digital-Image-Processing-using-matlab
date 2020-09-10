function f=spfilt(g,type,varargin)
%spfiltִ�����Ժͷ����ԵĿռ��˲�����gΪԭͼ��typeΪ�˲������ͣ�M*NΪ�˲���ģ���С
%�����������
[m,n,Q,d]=processInputs(varargin{:});
%��ʼִ���˲�
switch type
    case 'amean'%����ƽ���˲�
        w=fspecial('average',[m n]);
        f=imfilter(g,w,'replicate');
        
    case 'gmean'%����ƽ���˲�
        f=gmean(g,m,n);
        
    case 'hmean'%����ƽ���˲�
        f=harmean(g,m,n);
        
    case 'chmean'%������ƽ���˲���Q��Ĭ��ֵ��1.5
        f=charmean(g,m,n,Q);
        
    case 'median'%��ֵ�˲�
        f=medfilt2(g,[m n],'symmetric');
        
    case 'max'%���ֵ�˲�
        f=imdilate(g,ones(m,n));
        
    case 'min'%��Сֵ�˲�
        f=imerode(g,ones(m,n));
        
    case 'midpoint'%��ֵ�˲�
        f1=ordfilt2(g,1,ones(m,n),'symmetric');
        f2=ordfilt2(g,m*n,ones(m,n),'symmetric');
        f=imlincomb(0.5,f1,0.5,f2);
        
    case 'atrimmed'%˳��ƽ��ֵ�˲���d�����ǷǸ�������d��Ĭ��ֵ��2
        f=alphatrim(g,m,n,d);
        
    otherwise
        error('Unkown filter type.')
end

function f=gmean(g,m,n)
[g,revertClass]=tofloat(g);
f=exp(imfilter(log(g),ones(m,n),'replicate')).^(1/m/n);
f=revertClass(f);

function f=harmean(g,m,n)
[g,revertClass]=tofloat(g);
f=m*n./imfilter(1./(g+eps),ones(m,n),'replicate');
f=revertClass(f);

function f=charmean(g,m,n,q)
[g,revertClass]=tofloat(g);
f=imfilter(g.^(q+1),ones(m,n),'replicate');
f=f./(imfilter(g.^q,ones(m,n),'replicate')+eps);
f=revertClass(f);

function f=alphatrim(g,m,n,d)
if (d<=0)||(d/2~=round(d/2))
    error('d must be a positive, even integer.')
end
[g,revertClass]=tofloat(g);
f=imfilter(g,ones(m,n),'symmetric'):m*n
for k=2:d/2
    f=f-ordfilt2(g,k,ones(m,n),'symmetric');
end
f=f/(m*n-d);
f=revertClass(f);

function [m,n,Q,d]=processInputs(varargin)
m=3;
n=3;
Q=1.5;
d=2;
if nargin>0
    m=varargin{1};
end
if nargin>1
    n=varargin{2};
end
if nargin>2
    Q=varargin{3};
    d=varargin{3};
end
    