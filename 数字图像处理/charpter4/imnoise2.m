function R=imnoise2(type,varargin)
%type是函数类型，M*N是噪声数组的大小，a,b为两个参数
[M,N,a,b]=setDefaults(type,varargin{:});
%开始运行程序
switch lower(type)
    case 'uniform'
        R=a+(b-a)*rand(M,N);
    case 'gaussian'%如果是高斯类型，执行下面方程
        R=a+b*randn(M,N);
    case 'salt & pepper'%如果是焦盐类型，当输入参数小于等于3，a=0.05,b=0.05
        R=saltpepper(M,N,a,b);
    case 'lognormal'%对数正态类型，当输入参数小于等于3，a=1,b=0.25,执行下面方程
        R=a*exp(b*randn(M,N));
    case 'rayleigh'%瑞利类型，执行下面方程
        R=a+(-b*log(1-rand(M,N))).^0.5;
    case 'exponential'%指数类型，执行下面方程
        R=exponential(M,N,a);
    case 'erlang'%厄兰类型，如果输入参数小于等于3，a=2，b=5
        R=erlang(M,N,a,b);
    otherwise%如果不是以上类型，输出未知分配类型
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
            
            