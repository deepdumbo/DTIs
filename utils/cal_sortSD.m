function c=cal_sortSD(n,drugID,SD,DP)
%
% ���룺
%       n ���������ҩ�����
%       drugID ��Ѱ������ҩ���ҩ��
%       SD ҩ�����ƶȾ���
%       DP ҩ��-�е��Ӧ��ϵ����
% �����
%       c ��drugID���ƶ�ǰnλ��ҩ��ID�������ƶ�
%
M=length(SD);
a(:,1)=1:M;
a(:,2)=SD(:,drugID);
% a=708*2
b=sortrows(a,-2); %ҩ�����ƶ�����
% b=708*2
j=0;
c=zeros(n,2);%�洢���ƶ�ǰnλ��ҩ��ID�������ƶ�
for i=1:M
    if( sum(DP(:,b(i,1)))~=0 ) %�ҳ�����b������֪�е��ҩ�����c
        j=j+1;
        if(j==n+1)%��nλ�����������
            break;
        end
        c(j,:)=b(i,:);
    end
end
% c=708*2
end
