function [  sim] = LRW( train, steps, lambda )
%% ����LRWָ�겢����AUCֵ
    deg = repmat(sum(train,2),[1,size(train,2)]);
    train = train ./ deg; clear deg;    
    train(isnan(train)) = 0;
    % ��ת�ƾ���
    I = sparse(eye(size(train,1)));                                 
    % ���ɵ�λ����
    sim = I;
    stepi = 0;
    while(stepi < steps)                                     
    % ������ߵĵ���
        sim = (1-lambda)*I + lambda * train' * sim;
        stepi = stepi + 1;
    end 
    sim = sim+sim';    
    sim = sim./mean(diag(sim)); % ��һ��
    sim(logical(eye(length(sim)))) = 1;
    
end
