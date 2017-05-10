function score2=cal_score(drugID,n,m,s,SD,SP,DP)
%
% 计算drugID与所有未对应靶点的相似度
%
% 输入：
%       drugID：药物
%       n：取前n位相似度最高的dr
%       m：取前m位相似度最高的p，取1512则对所有排序
%       s：相似度得分 = 系数s * Drug与Drug的相似度 + (1-s) * Target与Target的相似度
%       SD：药物相似度矩阵
%       SP：靶点相似度矩阵
%       DP：药物、靶点对应关系
%
% 输出：
%       score2：[drugID ; 靶点ID ; 相似度]
%

% 相似度前n且具有已知靶点的药物集合  c:[相似药物ID ; 相似度]
c=cal_sortSD(n,drugID,SD,DP);

% 相似药物已知靶点的集合  d:[相似药物ID ; 相似药物已知靶点ID]
d=cal_Sdr_p(n,DP,c);

% 求出d中每个已知靶点的m个相似靶点  f:[相似药物ID ; 相似药物对应靶点ID ; 对应靶点的相似靶点的ID ; 相似度]
f=cal_p_Sp(m,SP,d);

%计算得分
for i=1:length(f)
    g=find(c(:,1)==f(i,1));
    score(i,1)=f(i,3);
    score(i,2)=s*c(g,2)+(1-s)*f(i,4);
end
%score   靶点ID ； 相似度

%去除已知的对应关系
j=0;
for i=1:length(score)
    if (DP(score(i,1),drugID)~=1)
        j=j+1;
        score1(j,:)=score(i,:);
    end
end

%对于重复的预测靶点
q=unique(score1(:,1));
for i=1:length(q)
    r=find(score1(:,1)==q(i));
    y=sum(score1(r,2)); %取叠加
    score2(i,1)=drugID;
    score2(i,2)=q(i);
    score2(i,3)=y;
    clear r ;% 每次r的维度不一样
end

%得分排序
score2=sortrows(score2,-3);

end
