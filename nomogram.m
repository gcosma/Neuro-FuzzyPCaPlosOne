%Copyright (c) <2015>, <Georgina Cosma et. al>
%<publication title> Prediction of Pathological Stage in Patients with Prostate Cancer: A Neuro-Fuzzy Model
%All rights reserved.
%The AJCC pTNM Nomogram in Matlab

%This is the data structure

%column 1 Gleason 1
%column 2 Gleason 2
%column 3 PSA
%column 4 Age
%column 5 t-stage

%1 T1, 2 T2a, 3 T2b, 4 T2c, 5 T3a,b or T4 

%4 point scale
%stage1 1: unilateral unfelt by sxamination small cancer
%stage2 IIA: unilateral
%stage3 IIB: bolateral
%stage4 III: extraprostatic
%stage5 IV: extraprostatic

%Call the function as follows on the command line
%trnnomo=nomogram(training_data);
%chknomo=nomogram(testing_data);

function [nomo]=nomogram(B)
[m,n]=size(B); %row m col n

%Make a copy of the original matrix B into AA
Anomo=zeros(length(B),n);
for a=1:n %col
    for z=1:1:m %row
        Anomo(z,a)=B(z,a);
    end
end

%which is the PSA column to search as the nomogram goes up to 20

col=3;
%%%%%%%%%%%%%%%%%%%%%%%
for i=1:1:m
 if Anomo(i,col)>20
   Anomo(i,col)=20;
 end
end

%the nomogram code
b=zeros(length(Anomo),1);
for j=1:1:m %row m		
   gscore=Anomo(j,1)+Anomo(j,2);
   if (Anomo(j,5)==5) 
          b(j)=4;        
	elseif (Anomo(j,5)<4 && (gscore==7))
           b(j)=2;
	elseif (Anomo(j,5)==4) 
           b(j)=3;
    elseif (Anomo(j,5)==3 && Anomo(j,3)<20 && (gscore<=7))
           b(j)=2;        
	elseif (Anomo(j,5)==2 && Anomo(j,3)<20 && (gscore==7))
           b(j)=2;   
	elseif (Anomo(j,5)==2 && Anomo(j,3)>=10 && Anomo(j,3)<20 && (gscore<=6))
           b(j)=2;   
	elseif (Anomo(j,5)==1 && Anomo(j,3)>=10 && Anomo(j,3)<20 && (gscore<=6))
           b(j)=2; 
	elseif (Anomo(j,5)==1 && Anomo(j,3)<20 && (gscore==7))
           b(j)=2;
    elseif (Anomo(j,5)==1 && Anomo(j,3)<10 &&(gscore<=6))
           b(j)=1;
	elseif (Anomo(j,5)==2 && Anomo(j,3)<10 &&(gscore<=6))
           b(j)=1;   
    elseif(gscore>=8) || Anomo(j,5)>20
	   b(j)=3; 	 
   end
end
 nomo=b;
end
