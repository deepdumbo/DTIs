function [ sim ] = RWR( train ,lambda )
%% 计算RWR指标并返回AUC值
    deg = repmat(sum(train,2),[1,size(train,2)]);
    train = train ./ deg; 	clear deg;
    train(isnan(train)) = 0;
    % 求转移矩阵
    I = sparse(eye(size(train,1)));                                
    % 生成单位矩阵
    sim = (1 - lambda) * inv(I- lambda * train') * I;
    sim = sim+sim';
    sim = sim./mean(diag(sim)); % 归一化
    sim(logical(eye(length(sim)))) = 1;
end
