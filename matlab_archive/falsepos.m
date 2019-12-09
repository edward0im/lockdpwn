function [root,ea,iter]=falsepos(func,xl,xu,es,maxit,varargin)

% ����ġ�� M����
%{
    160405 ���ͳݿ��� �ٿ���� ����
    
%}

if nargin<3, error('�Լ��� ��� 3���� ���ڰ� �ʿ��մϴ�.'),end
test=func(xl,varargin{:})*func(xu,varargin{:});
if test>0,error('���� �� ����'),end
if nargin<4|isempty(es), es=0.0001; end
if nargin<5|isempty(maxit), maxit=50; end



iter=0; xr=xl;
while(1)
    xrold = xr;
    
    % ����ġ�� �˰���
    xr = xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)); 
    
    iter=iter+1;
    if xr ~=0, ea=abs((xr-xrold)/xr)*100; end
    
    test=func(xl,varargin{:})*func(xr,varargin{:});
    if test<0
        xu=xr;
    elseif test>0
        xl=xr;
    else
        ea=0;
    end
    if ea <= es | iter >= maxit , break, end
end
root=xr;
    