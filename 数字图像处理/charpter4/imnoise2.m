function R=imnoise2(type,varargin)
%type�Ǻ������ͣ�M*N����������Ĵ�С��a,bΪ��������
[M,N,a,b]=setDefaults(type,varargin{:});
%��ʼ���г���
switch lower(type)
    case 'uniform'
        R=a+(b-a)*rand(M,N);
    case 'gaussian'%����Ǹ�˹���ͣ�ִ�����淽��
        R=a+b*randn(M,N);
    case 'salt & pepper'%����ǽ������ͣ����������С�ڵ���3��a=0.05,b=0.05
        R=saltpepper(M,N,a,b);
    case 'lognormal'%������̬���ͣ����������С�ڵ���3��a=1,b=0.25,ִ�����淽��
        R=a*exp(b*randn(M,N));
    case 'rayleigh'%�������ͣ�ִ�����淽��
        R=a+(-b*log(1-rand(M,N))).^0.5;
    case 'exponential'%ָ�����ͣ�ִ�����淽��
        R=exponential(M,N,a);
    case 'erlang'%�������ͣ�����������С�ڵ���3��a=2��b=5
        R=erlang(M,N,a,b);
    otherwise%��������������ͣ����δ֪��������
        error('Unknown distribution type.')
end

function R=saltpepper(M,N,a,b);
if (a+b)>1
    error('the sum Pa+Pb must not exceed 1.')
end
R(1:M,1:N)=0.5;
X=rand(M,N);
R(X<=a)=0;
u=a+b;
R(X>a&X<=u)=1;

function R=exponential(M,N,a)
if a<=0
    error('Parameter a must be positive for exponential type.')
end
k=-1/a;
R=k*log(1-rand(M,N));



function R=erlang(M,N,a)
if(b~=round(b)||b<=0)
    error('Parameter a must be positive for exponential type.')
end
k=-1/a;
R=k*log(1-rand(M,N));



function varargout=setDefaults(type,varargin)
varargout=varargin;
P=numel(varargin)
if P<4
    varargout{4}=1;
end
if P<3
    varargout{3}=0;
end
if P<2
    varargout{2}=1;
end
if P<1
    varargout{1}=1;
end
if (P<=2)
    switch type
        case 'salt & pepper'
            varargout{3}=0.05;
            varargout{4}=0.05;
        case 'lognormal'
            varargout{3}=1;
            varargout{4}=0.25;
        case 'exponential'
            varargout{3}=1;
        case 'erlang'
            varargout{3}=2;
            varargout{4}=5;
    end
end
            
            