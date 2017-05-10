function name=search_name(type,ID)
if(type=='P')
    a = fopen('.\InteractionData\protein.txt');
    A= textscan(a,'%s');
    protein =string(A{1,1});
    fclose(a);
    
    name=protein(ID);
else
    b = fopen('.\InteractionData\drug.txt');
    B= textscan(b,'%s');
    drug =string(B{1,1});
    fclose(b);
    
    name=drug(ID);
end