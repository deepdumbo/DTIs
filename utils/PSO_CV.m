function Precision=PSO_CV(s,s1,s2,SD,SD1,SD2,SD3,SP,SP1,SP2,DP)

n=10;  % ȡǰnλ���ƶ���ߵ�dr
m=10;  % ȡǰmλ���ƶ���ߵ�p��ȡ1512�����������
W=100; % ǰWλԤ���ϵ
K=3;   % k�۽���

%���ƶ�����
SD=s1*SD+(1-s1)*(SD1+SD2+SD3);
SP=s2*SP+(1-s2)*(SP1+SP2);

%��֪��Ӧ��ϵ
[row1,col1] = find(DP==1);
X1=[col1 row1]; % [ҩ��;�е�]

%������֤
count=zeros(K,1); % ��¼ǰWλ�ɹ�Ԥ�⵽�Ķ�Ӧ��ϵ
[M,N]=size(X1);
indices=crossvalind('Kfold',X1(1:M,N),K); 

for k=1:K
    test_logic = (indices == k);% ���test��Ԫ�������ݼ��ж�Ӧ�ĵ�Ԫ���
    test = X1(test_logic,:);    % test������
    
    % ��test�е���֪��ϵ��Ϊδ֪��ϵ
    DP_cv=DP;
    for i=1:length(test)
        DP_cv(test(i,2),test(i,1))=0;
    end
    
    % ��DP_cv�����ϣ�����÷�
    S=[];
    for drugID=1:708
        score = cal_score(drugID,n,m,s,SD,SP,DP_cv); % drugID��δ��Ӧ�е�֮��Ĺ�ϵ
        S=[S;score];
    end
    
    S=sortrows(S,-3);
    SS=S(1:W,:);
    C= intersect(test,SS(:,1:2),'rows');
    count(k)=size(C,1); % �ɹ�Ԥ����ĸ���
end

Precision=sum(count)/(k*W);
fprintf('Precision:%f\n',Precision);
end



