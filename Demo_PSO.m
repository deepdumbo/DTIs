clear;clc;
addpath(genpath('./utils'));
addpath(genpath('./PSOt'));

SD=load('.\SimilarityData\Similarity_Matrix_Drugs.txt'); % drug-drug sililarity 
SP=load('.\SimilarityData\Similarity_Matrix_Proteins.txt'); % protein-protein similarity
DP=load('.\InteractionData\mat_protein_drug.txt'); % DTIs
SP=SP/100; % normalize

SD1=load('.\Sim\SRW\FinaSim_mat_drug_drug.txt');
SD2=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_disease.txt');
SD3=load('.\Sim\SRW\FinaSim_JdSim_mat_drug_se.txt');

SP1=load('.\Sim\SRW\FinaSim_mat_protein_protein.txt');
SP2=load('.\Sim\SRW\FinaSim_JdSim_mat_protein_disease.txt');

% VarRange
s_range=[0,1];
s1_range=[0,1];
s2_range=[0,1];
range = [s_range;s1_range;s2_range];

Max_V = 0.3 * (range(:,2)-range(:,1));  % max particle velocity
n=3; % dimension of problem
psopm = [1 % Epochs between updating display
    8 % Maximum number of iterations (epochs) to train
    2 % population size
    2 ; 2 ; 0.9 ; 0.4 ; 1500 ; 1e-25 ; 500 ; NaN ; 0 ; 0 ];
pm = pso_Trelea_vectorized(SD,SD1,SD2,SD3,SP,SP1,SP2,DP,'PSOfunc',n,Max_V,range,1,psopm)  % PSO



