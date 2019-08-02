function [root,ea,iter] = newtraph(func,dfunc,xr,es,maxit,varargin)

% 160405

%{
input:
    func = �Լ��� �̸�
    dfunc = ���Լ��� �̸�
    xr = ù��°�� ����ϰ� ���� x�� ��
    es = �̻����� ������ �� (�⺻ = 0.0001%)
    maxit = �ִ� �ݺ���� Ƚ��
    p1,p2... = �Լ����� ����ϴ� �߰����� ��������
output:
    root = ���� ��
    ea = �뷫���� ������ �� (%)
    iter = �ݺ�Ƚ��
%}

% ���� ���ڰ��� 3�� ������ ��� ���α׷��� �����մϴ�
if nargin < 3, error('at least 3 input arguments required'),end

% ���� ���ڰ��� 4�� ������ ��� es(������)���� 0.0001%�� �մϴ�
if nargin<4 | isempty(es),es=0.0001;end

% ���� ���ڰ��� 5�� ������ ��� maxit(�ִ�ݺ����)���� 50������ �մϴ�
if nargin<5 | isempty(maxit), maxit=50;end

% iter ���� 0���� �ʱ�ȭ��Ų ��
iter = 0;

% iter ���� maxit ������ Ŀ�������� ������ ���ϴ�
while(1)
    
    % xrold�� ����ڰ� ������ xr ���� �ְ�
    xrold = xr;
    
    % Newton-Raphson ���� �̿��� xr ���� �ٻ��ŵ�ϴ�
    xr = xr - func(xr)/dfunc(xr);
    
    % �ݺ�Ƚ���� +1 �մϴ�
    iter = iter +1;
    
    % ���� xr ���� 0�� �ƴϸ� ea(������ ��)�� ���մϴ�
    if xr ~= 0, ea = abs((xr-xrold)/xr) * 100; end
    
    % ���� ea(������)���� es(�̻����� ������)������ �۴ٸ� ������ Ż���մϴ�.
    if ea <= es | iter >= maxit, break, end
end

% xr(�����)�� root(������)�� �����մϴ�
root = xr; 
