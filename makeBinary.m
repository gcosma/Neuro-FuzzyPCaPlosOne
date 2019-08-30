%Copyright (c) <2015>, <Georgina Cosma et. al>
%<publication title> Prediction of Pathological Stage in Patients with Prostate Cancer: A Neuro-Fuzzy Model
%All rights reserved.


function [OUTMAT]=makeBinary(inVector)
IV=round(inVector);
[m,n]=size(IV); %row m col n
%vector must be mx1
%this must be equal to number of clusters but 
%FCM gives a bigger number so max number must be defined
%d=max(IV(:,end)); 
ncc=2;
 for i=1:1:m
  if IV(i)>ncc;
    IV(i)=ncc;
  end
 end
 
new= repmat(IV(:,end),1,ncc);
[~,n]=size(new);
for i=1:n
c=new(:,i);
c(c~=i)=0;
c(c>=i)=1;
new(:,i)=c; 
end   
OUTMAT=new;
end



