function d=cal_Sdr_p(n,DP,c)
% �������ҩ�����֪�е�

d=[];
for i=1:n
    dd=find(DP(:,c(i,1))==1); % ��c_i_1����֪�е�ID
    dd1(1:length(dd),1)=c(i,1);
    dd1(1:length(dd),2)=dd;
    d=[d;dd1];
    clear dd1;
end
end