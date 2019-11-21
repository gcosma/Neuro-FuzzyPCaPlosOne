# Neuro-FuzzyPCaPlosOne
Matlab code for the Neuro-Fuzzy Paper 


Copyright (c) <2015>, <Georgina Cosma et. al>
<publication title> Prediction of Pathological Stage in Patients with Prostate Cancer: A Neuro-Fuzzy Model

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

%INSTRUCTIONS

%Please email g.cosma@lboro.ac.uk if you are experiencing any problems with performing the experiments using the 
%PLOSdata or if using the code on another dataset. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To repeat the experiments %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

1. Open MATLAB
2. Drag and drop the PLOSdata.mat onto the command line. This loads the data.
3. Drag and drop the NeuroFuzzyApproach.m file onto the command line. This runs both neurofuzzy and FCM.
4. Drag and drop the ANNPLOS.m file onto the command line. This runs both ANN.
5. Drag and drop the NaiveBayesGD.m file onto the command line. This runs both NB-GD as described in the paper.
6. Drag and drop the SVM.m file onto the command line. This runs both SVM as described in the paper. You can change the kernel functions. 
7. Drag and drop the EvaluateNomogram.m file onto the command line. This creates the nomogram and then evaluates it. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To run the neuro-fuzzy predictor GUI  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%See Neuro-Fuzzy System Example.ppt for examples of the neuro-fuzzy tool making a prediction

%If you just want to use the prediction tool

1. Type: anfisedit in MATLAB's command line. The Anfis Edit will open.
2. Select File-->Import From File-->Prostate_Prediction.fis
3. Select View-->Rules
4.Now you can use the tool to predict cancer staging. 
5. You can select the Gleason 1, Gleason 2, PSA Group, Age Group, ClinicalTstage Group, 
by moving the red horizontal bars or by inputting the values into the input box located on the bottom left.
6. System will precit the Pathological Stage. The predicted value is on the top right. PathologicalSatage= [predicted value]    
7. For evaluation purposes the pathological stage value was rounded, however, it is meaningful to look at these values before they are rounded as they are
good indicators of the likelihood of Organ Confined or Extra Prostatic cancer.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Source-code  Files                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PLOSdata.mat - holds the pre-processed data from CGA. It holds the training and testing data.
Age.m - converts a vector of age values into grouped values
PSA.m - converts a vector of PSA values into grouped values
ANNbinouts.m - converts the ANN outputs into binary form for evaluation purposes
ANNPLOS.m - Runs ANN onto the dataset
NaiveBayesGC- Runs Naive Bayes with GD onto the dataset
EvaluateNomogram.m - calls the functions: Nomogram, ScaledN2point and applies and evaluates nomogram.
makeBinary.m - converts a vertor into binary, e.g. 2 is 0 1 , 3 is 0 0 1, etc
NeuroFuzzyApproach - runs the neuro-fuzzy and FCM approaches
nomogram.m - function that given a set of inputs retunrns th enomogram output
SVM - runs the SVM-QUdratic. User can change function easily.
ScalesN2point - converts the nomogram output to a two point classification, OCD and ED
