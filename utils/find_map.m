function [name]=find_map(name,n)
%药物名称
a = fopen('.\map\drug_dict_map.txt');
A= textscan(a,'%s  %s','Delimiter',':');
drug_map =string( [A{1,1} A{1,2}] );
fclose(a);
%靶点名称
b = fopen('.\map\protein_dict_map.txt');
B= textscan(a,'%s  %s','Delimiter',':');
protein_map = string([B{1,1} B{1,2}]);
fclose(b);

for i=1:n
    a=find(protein_map==name(i,2));
    name(i,4)=protein_map(a,2);
    b=find(drug_map==name(i,1));
    name(i,3)=drug_map(b,2);
end
end

