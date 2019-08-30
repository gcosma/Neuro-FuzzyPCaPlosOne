% group the age values
% will take the age values vector and 
% transform them into their grouped value

% take matrix A and col which is the age column

%A is the matrix with all the prostate cancer data
%col is the age column


col=1;  %change this to the column number the age column resides in the matrix of values

[m,n]=size(A);
for i=1:1:m
 if A(i,col)>=70
   A(i,col)=11;
 elseif A(i,col)>=65
   A(i,col)=10;
 elseif A(i,col)>=60
   A(i,col)=9;
  elseif A(i,col)>=55
   A(i,col)=8;   
   elseif A(i,col)>=50
   A(i,col)=7;
   elseif A(i,col)>=45
   A(i,col)=6; 
  elseif A(i,col)>=40
   A(i,col)=5;  
   elseif A(i,col)>=35
   A(i,col)=4;   
   elseif A(i,col)>=30
   A(i,col)=3;   
     elseif A(i,col)>=25
   A(i,col)=2;   
 else
       A(i,col)=1;  
 end
end

