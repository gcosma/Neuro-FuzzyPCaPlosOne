[m,n]=size(training_data);
data=training_data(:,1:n-1);
testdata=testing_data(:,1:n-1);
labels=training_data(:,n);
testlabels=testing_data(:,n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Uncomment the function you want to use
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%svmModel = svmtrain(data,labels,'Kernel_Function','linear');
svmModel = svmtrain(data,labels,'Kernel_Function','quadratic');
%svmModel = svmtrain(data,labels,'Kernel_Function','rbf');
%svmModel = svmtrain(data,labels,'Kernel_Function','mlp');
pred1 = svmclassify(svmModel,testdata, 'Showplot',true)
chkRMSE=norm(pred1-testlabels)/sqrt(length(pred1))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%prot roc
[X15,Y15,T15,AUC15,OPTROCPT15] = perfcurve(testlabels',pred1',2);
plot(X15,Y15, 'Color','magenta')

xlabel('False positive rate (1-Specificity)'); ylabel('True positive rate (Sensitivity)')
title('ROC Curve')
legend('SVM')
