%This is the code for the neuro-fuzzy approach
%number of clusters which is the max value of 
%last column which holds target results

[m,n]=size(training_data);
k1=n-1; 
k2=n;%targets
%nc=max(Anew(:,n)); % how many clusters
nc=2
%FCM
fismat=genfis3(training_data(:,1:k1),training_data(:,k2),'sugeno',nc,[2,200,0.000001,1]);
fuzout=evalfis(training_data(:,1:k1),fismat);
trnRMSE=norm(fuzout-training_data(:,k2))/sqrt(length(fuzout))
chkfuzout=evalfis(testing_data(:,1:k1),fismat);
chkRMSE=norm(chkfuzout-testing_data(:,k2))/sqrt(length(chkfuzout))

%ANFIS
fismat2=anfis(training_data,fismat,[200 0 0.000001]);
fuzout2=evalfis(training_data(:,1:k1),fismat2);
trnRMSE2=norm(fuzout2-training_data(:,k2))/sqrt(length(fuzout2))
chkfuzout2=evalfis(testing_data(:,1:k1),fismat2);
chkRMSE2=norm(chkfuzout2-testing_data(:,k2))/sqrt(length(chkfuzout2))

[trnfuzoutbin]=makeBinary(fuzout);
[trnfuzoutbin2]=makeBinary(fuzout2);
[chkfuzoutbin]=makeBinary(chkfuzout);
[chkfuzoutbin2]=makeBinary(chkfuzout2);

hold on
%ANFIS against targets
[X1,Y1,T1,AUC1,OPTROCPT1] = perfcurve(testing_data(:,k2)',chkfuzout2',2); 
plot(X1,Y1, 'Color','blue')

%FCM
[X2,Y2,T2,AUC2,OPTROCPT2] = perfcurve(testing_data(:,k2)',chkfuzout',2); 
plot(X2,Y2, 'Color','red')

xlabel('False positive rate (1-Specificity)'); ylabel('True positive rate (Sensitivity)')
title('ROC Curves')
legend('Neuro-fuzzy','FCM')
hold off
