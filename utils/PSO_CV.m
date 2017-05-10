function Precision=PSO_CV(s,s1,s2,SD,SD1,SD2,SD3,SP,SP1,SP2,DP)

n=10;  % 取前n位相似度最高的dr
m=10;  % 取前m位相似度最高的p，取1512则对所有排序
W=100; % 前W位预测关系
K=3;   % k折交叉

%相似度整合
SD=s1*SD+(1-s1)*(SD1+SD2+SD3);
SP=s2*SP+(1-s2)*(SP1+SP2);

%已知对应关系
[row1,col1] = find(DP==1);
X1=[col1 row1]; % [药物;靶点]

%交叉验证
count=zeros(K,1); % 记录前W位成功预测到的对应关系
[M,N]=size(X1);
indices=crossvalind('Kfold',X1(1:M,N),K); 

for k=1:K
    test_logic = (indices == k);% 获得test集元素在数据集中对应的单元编号
    test = X1(test_logic,:);    % test样本集
    
    % 将test中的已知关系变为未知关系
    DP_cv=DP;
    for i=1:length(test)
        DP_cv(test(i,2),test(i,1))=0;
    end
    
    % 在DP_cv基础上，计算得分
    S=[];
    for drugID=1:708
        score = cal_score(drugID,n,m,s,SD,SP,DP_cv); % drugID与未对应靶点之间的关系
        S=[S;score];
    end
    
    S=sortrows(S,-3);
    SS=S(1:W,:);
    C= intersect(test,SS(:,1:2),'rows');
    count(k)=size(C,1); % 成功预测出的个数
end

Precision=sum(count)/(k*W);
fprintf('Precision:%f\n',Precision);
end



