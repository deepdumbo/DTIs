function c=cal_sortSD(n,drugID,SD,DP)
%
% 输入：
%       n 输出的相似药物个数
%       drugID 待寻找相似药物的药物
%       SD 药物相似度矩阵
%       DP 药物-靶点对应关系矩阵
% 输出：
%       c 与drugID相似度前n位的药物ID及其相似度
%
M=length(SD);
a(:,1)=1:M;
a(:,2)=SD(:,drugID);
% a=708*2
b=sortrows(a,-2); %药物相似度排序
% b=708*2
j=0;
c=zeros(n,2);%存储相似度前n位的药物ID及其相似度
for i=1:M
    if( sum(DP(:,b(i,1)))~=0 ) %找出排序b中有已知靶点的药物存入c
        j=j+1;
        if(j==n+1)%若n位已满，则结束
            break;
        end
        c(j,:)=b(i,:);
    end
end
% c=708*2
end
