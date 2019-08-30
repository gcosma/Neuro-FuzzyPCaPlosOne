% group the PSA values
% will take the PSA values vector and 
% transform them into their grouped value

% take matrix A and col which is the PSA column

% A is the matrix with all the prostate cancer data
% col is the PSA column

col=1;
[m,n]=size(A);

col=1;  %change this to the column number the PSA column resides in the matrix of values
%normalise PSA vector
for i=1:1:m
 if A(i,col)>=20
   A(i,col)=6;
 elseif A(i,col)>=10
   A(i,col)=5;
 elseif A(i,col)>=6.0
   A(i,col)=4;
  elseif A(i,col)>=4.0
   A(i,col)=3;   
   elseif A(i,col)>2.5
   A(i,col)=2;
   elseif A(i,col)>=0
   A(i,col)=1; 
 end
end


