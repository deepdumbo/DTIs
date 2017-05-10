
clear;
addpath(genpath('./utils'));
M=10;         % the top M similar drugs with known targets
N=10;         % the top N similar proteins for each known target of the similar drugs
alpha=0.45;   % the weight of drug similarity in the DTIs scores evaluation
w_dr=0.35;    % the weight of original drug similarity measure in the integrated drug similarity evaluation
w_p=0.1;      % the weight of original protein similarity measure in the integrated protein similarity evaluation
K=10;         % K-fold cross-validation
run data_load; % load data

[row,col] = find(DP==1);
Known=[col row]; % Known drug-target pairs
[m,n]=size(Known);
indices=crossvalind('Kfold',Known(1:m,n),K);
L_r=zeros(K,1); % the right predictions

L=100; % the top-L predictions
% for L=40:20:100 % the top-L predictions
    for k=1:K
        fprintf('%d of %d ...\n',k,K);
        test_logic = (indices == k);
        test = Known(test_logic,:); % test set
        
        % transforming the known drug-target interactions in the test set into unknown
        DP_cv=DP;
        for i=1:length(test)
            DP_cv( test(i,2),test(i,1) )=0;
        end
        
        % scoring computation
        Score=[];
        for drugID=1:708
            temp = cal_score(drugID,M,N,alpha,SD,SP,DP_cv);
            Score=[Score;temp];
        end
        
        Score=sortrows(Score,-3); % sort
        Score=Score(1:L,:); % the top-L predictions
        right= intersect(test,Score(:,1:2),'rows'); % right predictions
        L_r(k)=size(right,1); % the number of right predictions
    end
    Precision=sum(L_r)/(K*L); % Average Precision
    fprintf('L = %d , Precision = %f\n',L,Precision);
% end




