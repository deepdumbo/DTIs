function z=PSOfunc(in,SD,SD1,SD2,SD3,SP,SP1,SP2,DP)
s=in(:,1);
s1=in(:,2);
s2=in(:,3);

% ´ýÓÅ»¯º¯Êý
nx=size(in,1);
z=zeros(nx,1);

for i=1:nx
    z(i,:)=PSO_CV(s(i),s1(i),s2(i),SD,SD1,SD2,SD3,SP,SP1,SP2,DP);
end
