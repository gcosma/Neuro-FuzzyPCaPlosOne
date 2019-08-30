[trnNomo]=nomogram(training_data)
[chkNomo]=nomogram(testing_data)
[chknomo2]=ScaledN2point(chkNomo);%turn nomogram output to Organ Confined and Extra Prostatic

[X6,Y6,T6,AUC6,OPTROCPT6] = perfcurve(testing_data(:,end)',chknomo2',2)

plot(X6,Y6,'Color','cyan')
xlabel('False positive rate'); 
ylabel('True positive rate')
title('ROC for classification by Nomogram')
legend('Nomogram')