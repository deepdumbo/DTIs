
SD=load('.\SimilarityData\Similarity_Matrix_Drugs.txt');%ҩ�����ƶȾ���
SP=load('.\SimilarityData\Similarity_Matrix_Proteins.txt');%�е����ƶȾ���
DP=load('.\InteractionData\mat_protein_drug.txt');%ҩ��е��Ӧ��ϵ
SP=SP/100;%�е����ƶȹ�һ����[0,1]

%���ƶ�����
%%{
SD1=load('.\Sim\SRW\FinaSim_mat_drug_drug.txt');
SD2=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_disease.txt');
SD3=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_se.txt');
SD=w_dr*SD+(1-w_dr)*(SD1+SD2+SD3);

SP1=load('.\Sim\SRW\FinaSim_mat_protein_protein.txt');
SP2=load('.\Sim\SRW\FinaSim_JdSim_mat_protein_disease.txt');
SP=w_p*SP+(1-w_p)*(SP1+SP2);
%}