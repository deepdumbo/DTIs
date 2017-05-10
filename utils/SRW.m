function [sim] = SRW( train, steps, lambda )
%
%����SRWָ��
%

deg = repmat(sum(train,2),[1,size(train,2)]);
train = train ./ deg; clear deg;
train(isnan(train)) = 0;
% ��ת�ƾ���
I = sparse(eye(size(train,1)));
% ���ɵ�λ����
tempsim = I;
% �����ݴ�ÿ���ĵ������
stepi = 0; sim = sparse(size(train,1),size(train,2));
% ������ߵĵ��� sim�����洢ÿ�������ķ�ֵ֮��
while(stepi < steps)
    tempsim = (1-lambda)*I + lambda * train' * tempsim;
    stepi = stepi + 1;
    sim = sim + tempsim;
end
sim = sim+sim';  % ���ƶȾ���������
sim = sim./mean(diag(sim)); % ��һ��
sim(logical(eye(length(sim)))) = 1;
end
