
SD=load('.\SimilarityData\Similarity_Matrix_Drugs.txt');%药物相似度矩阵
SP=load('.\SimilarityData\Similarity_Matrix_Proteins.txt');%靶点相似度矩阵
DP=load('.\InteractionData\mat_protein_drug.txt');%药物、靶点对应关系
SP=SP/100;%靶点相似度归一化到[0,1]

%相似度整合
%%{
SD1=load('.\Sim\SRW\FinaSim_mat_drug_drug.txt');
SD2=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_disease.txt');
SD3=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_se.txt');
SD=w_dr*SD+(1-w_dr)*(SD1+SD2+SD3);

SP1=load('.\Sim\SRW\FinaSim_mat_protein_protein.txt');
SP2=load('.\Sim\SRW\FinaSim_JdSim_mat_protein_disease.txt');
SP=w_p*SP+(1-w_p)*(SP1+SP2);
%}