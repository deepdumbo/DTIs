function score2=cal_score(drugID,n,m,s,SD,SP,DP)
%
% ����drugID������δ��Ӧ�е�����ƶ�
%
% ���룺
%       drugID��ҩ��
%       n��ȡǰnλ���ƶ���ߵ�dr
%       m��ȡǰmλ���ƶ���ߵ�p��ȡ1512�����������
%       s�����ƶȵ÷� = ϵ��s * Drug��Drug�����ƶ� + (1-s) * Target��Target�����ƶ�
%       SD��ҩ�����ƶȾ���
%       SP���е����ƶȾ���
%       DP��ҩ��е��Ӧ��ϵ
%
% �����
%       score2��[drugID ; �е�ID ; ���ƶ�]
%

% ���ƶ�ǰn�Ҿ�����֪�е��ҩ�Ｏ��  c:[����ҩ��ID ; ���ƶ�]
c=cal_sortSD(n,drugID,SD,DP);

% ����ҩ����֪�е�ļ���  d:[����ҩ��ID ; ����ҩ����֪�е�ID]
d=cal_Sdr_p(n,DP,c);

% ���d��ÿ����֪�е��m�����ưе�  f:[����ҩ��ID ; ����ҩ���Ӧ�е�ID ; ��Ӧ�е�����ưе��ID ; ���ƶ�]
f=cal_p_Sp(m,SP,d);

%����÷�
for i=1:length(f)
    g=find(c(:,1)==f(i,1));
    score(i,1)=f(i,3);
    score(i,2)=s*c(g,2)+(1-s)*f(i,4);
end
%score   �е�ID �� ���ƶ�

%ȥ����֪�Ķ�Ӧ��ϵ
j=0;
for i=1:length(score)
    if (DP(score(i,1),drugID)~=1)
        j=j+1;
        score1(j,:)=score(i,:);
    end
end

%�����ظ���Ԥ��е�
q=unique(score1(:,1));
for i=1:length(q)
    r=find(score1(:,1)==q(i));
    y=sum(score1(r,2)); %ȡ����
    score2(i,1)=drugID;
    score2(i,2)=q(i);
    score2(i,3)=y;
    clear r ;% ÿ��r��ά�Ȳ�һ��
end

%�÷�����
score2=sortrows(score2,-3);

end
