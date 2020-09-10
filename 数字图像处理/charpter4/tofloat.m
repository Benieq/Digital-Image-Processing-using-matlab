function [out, revertclass]=tofloat(in)
%tofloat convert image to floating point
%通过应用适当的比例因子，把一副logical,uint8,uint16,int16类图像变换成single类的图像

% 2.2.4intrans.m 使用
identity=@(x) x;
tosingle=@im2single;
 
table={'uint8', tosingle, @im2uint8
    'uint16', tosingle, @im2uint16
    'int16', tosingle, @im2int16
    'logical', tosingle, @logical
    'double', identity, identity
    'single', identity, identity};
classIndex=find(strcmp(class(in),table(:,1)));
if isempty(classIndex)
error('Unsupported inut image class.')
end
 
out=table{classIndex,2}(in);
revertclass=table{classIndex,3};