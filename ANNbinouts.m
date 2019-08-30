%Copyright (c) <2015>, <Georgina Cosma et. al>
%<publication title> Prediction of Pathological Stage in Patients with Prostate Cancer: A Neuro-Fuzzy Model
%All rights reserved.


function [outpt] = ANNbinouts(Tar)
Tar=round(Tar);
[p,pp]=size(Tar);
pstageANN=zeros(length(Tar),2);
for ppp=1:p
if Tar(ppp)==1
    pstageANN(ppp,1)=1; %if class 1 is OCD so give 1 for OCD in col 1 otherwise 0
    pstageANN(ppp,2)=0; %if col 1 is class 1 then col 2 is 0
else
    pstageANN(ppp,1)=0;%if class 1 is ED so give 1 for OCD in col 1 otherwise 0
    pstageANN(ppp,2)=1; %if col 1 is class 0 then col 2 is 1
end
end
outpt=pstageANN;
end

