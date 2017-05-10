function f=cal_p_Sp(m,SP,d)
%
% 求出d中每个已知靶点的相似靶点
%
% 输入：
%        m：取前m位相似度最高的p，取1512则对所有排序
%        SP：靶点相似度矩阵
% 输出：
%        f：相似药物ID；相似药物对应靶点ID；对应靶点的相似靶点的ID；相似度
%

f=[];
for i=1:length(d)
    e=SP(:,d(i,2)); % 1512*1
    e1(1:length(e),1)=d(i,1);
    e1(1:length(e),2)=d(i,2);
    e1(1:length(e),3)=1:1512;
    e1(1:length(e),4)=e; % e1：相似药物ID；相似药物对应靶点ID；对应靶点的相似靶点的ID；相似度
    e2 = sortrows(e1,-4); % 药物相似度排序
    e2=e2(1:m,:); % ee为d_121_13的m个相似靶点集合
    f=[f;e2];
    clear e e1 e2;
end

end
