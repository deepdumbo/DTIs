function d=cal_Sdr_p(n,DP,c)
% 求出相似药物的已知靶点

d=[];
for i=1:n
    dd=find(DP(:,c(i,1))==1); % 找c_i_1的已知靶点ID
    dd1(1:length(dd),1)=c(i,1);
    dd1(1:length(dd),2)=dd;
    d=[d;dd1];
    clear dd1;
end
end