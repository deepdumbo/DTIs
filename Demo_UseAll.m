addpath(genpath('./utils'));
clear;
M=10;         % the top M similar drugs with known targets
N=10;         % the top N similar proteins for each known target of the similar drugs
alpha=0.45;   % the weight of drug similarity in the DTIs scores evaluation
w_dr=0.35;    % the weight of original drug similarity measure in the integrated drug similarity evaluation
w_p=0.1;      % the weight of original protein similarity measure in the integrated protein similarity evaluation
L=100;        % the top-L predictions

run data_load; % load data 

Score=[];
for drugID=1:708
    temp = cal_score(drugID,M,N,alpha,SD,SP,DP);
    Score=[Score;temp];
end
Score=sortrows(Score,-3); % sort 

% the top-L predictions
Top_L=[];
Top_L=string(Top_L);
for i=1:L
    Top_L(i,1)=string(search_name('D',Score(i,1)));
    Top_L(i,2)=string(search_name('P',Score(i,2)));
end
Top_L = find_map(Top_L,L);
fid=fopen(['./result/Top',num2str(L),'.txt'],'w+');
for i=1:L
    a=Top_L(i,:);
    fprintf(fid,'%s \t %s \t %s \t %s\n',a(1),a(2),a(3),a(4));
end
fclose(fid);

% The list of identical predictions in the results of our algorithm and reference [1].
D = textscan(fopen('.\result\ref1\D.txt'),'%s');
P = textscan(fopen('.\result\ref1\P.txt'),'%s');
ref(:,1) = string(D{1,1});
ref(:,2) = string(P{1,1});
SamePre = intersect(Top_L(1:L,1:2),ref(1:L,:),'rows'); % identical predictions
num = size(SamePre,1); % the number of identical predictions 
SamePre=find_map(SamePre,num);

fid=fopen(['./result/SamePre',num2str(num),'.txt'],'w+');
for i=1:num
    a=SamePre(i,:);
    fprintf(fid,'%s \t %s \t %s \t %s\n',a(1),a(2),a(3),a(4));
end
fclose(fid);



