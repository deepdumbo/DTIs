addpath(genpath('./utils'));
Nets = { 'mat_drug_disease', 'mat_drug_se', 'mat_protein_disease'};

for i = 1 : length(Nets)
    tic
    inputID = char(strcat('./InteractionData/', Nets(i), '.txt'));
    M = load(inputID);
    Sim = 1 - pdist(M, 'jaccard');
    Sim = squareform(Sim);
    Sim = Sim + eye(size(M,1));
    Sim(isnan(Sim)) = 0;
    outputID = char(strcat('./Sim/Jaccard/JdSim_', Nets(i), '.txt'));
    dlmwrite(outputID, Sim, '\t');
    toc
end
