function [ sim ] = RWR( train ,lambda )
%% ����RWRָ�겢����AUCֵ
    deg = repmat(sum(train,2),[1,size(train,2)]);
    train = train ./ deg; 	clear deg;
    train(isnan(train)) = 0;
    % ��ת�ƾ���
    I = sparse(eye(size(train,1)));                                
    % ���ɵ�λ����
    sim = (1 - lambda) * inv(I- lambda * train') * I;
    sim = sim+sim';
    sim = sim./mean(diag(sim)); % ��һ��
    sim(logical(eye(length(sim)))) = 1;
end
