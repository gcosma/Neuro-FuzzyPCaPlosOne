%scale nomogram on a 2 point scale
function [scaledNo]=ScaledN2point(nomo)
%scaled nomogram on a scale of 1-2
% 1 confined
% 2 unconfined

[mn,nn]=size(nomo);
scaledNo=zeros(length(nomo),1);
for i=1:1:mn
 if nomo(i,nn)>=4;
   scaledNo(i)=2;
 else
   scaledNo(i)=1;
 end
end
end
