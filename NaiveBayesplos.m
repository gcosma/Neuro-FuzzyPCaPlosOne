%% NaiveBayes Classifier
% The |classify| function has other two other types, 'diagLinear' and
% 'diagQuadratic'. They are similar to 'linear' and 'quadratic', but with
% diagonal covariance matrix estimates. These diagonal choices are specific
% examples of a Naive Bayes classifier, because they assume the variables
% are conditionally independent given the class label. Naive Bayes
% classifiers are among the most popular classifiers. While the assumption
% of class-conditional independence between variables is not true in
% general, Naive Bayes classifiers have been found to work well in practice
% on many data sets.  
%
% The |NaiveBayes| class can be used to create a more general type of
% Naive Bayes classifier.

[m,n]=size(training_data);
data=training_data(:,1:n-1);
testdata=testing_data(:,1:n-1);
labels=training_data(:,n);
testlabels=testing_data(:,n);

nbGau= NaiveBayes.fit(data, labels);
nbGauClass= nbGau.predict(testdata);
bad = ~strcmp(nbGauClass,testlabels);
nbGauResubErr = sum(bad)/ n
nbGauClassFun = @(xtrain,ytrain,xtest)...
               (predict(NaiveBayes.fit(xtrain,ytrain), xtest));
[XNB,YNB,TNB,AUCNB,OPTROCPTNB] = perfcurve(testlabels',nbGauClass','2')
plot(XNB,YNB, 'Color','magenta')

[c,cm] = confusion(testlabels',nbGauClass')

fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-c))
fprintf('Percentage Incorrect Classification : %f%%\n', 100*c)