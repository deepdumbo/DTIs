addpath(genpath('./utils'));
Nets = { 'JdSim_mat_drug_disease', 'JdSim_mat_drug_se', 'JdSim_mat_protein_disease','mat_drug_drug','mat_protein_protein'};
steps=10;
lambda=0.8;
for i = 1 : length(Nets)
    tic
    inputID = char(strcat('./Sim/Jaccard/', Nets(i), '.txt'));
    M = load(inputID);
    Sim = SRW( M, steps, lambda ); % superposed random walk 
    outputID = char(strcat('./Sim/SRW/FinaSim_', Nets(i), '.txt'));
    
    dlmwrite(outputID, Sim, '\t');
    toc
end







