%Perceptron training error rate is 0 percent
%Perceptron test error rate is 18 percent
%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to the decision rule corresponding
%to a very simple one-layer neural network: the perceptron. 
%It also takes in a data matrix Xrun and produces a vector of label
%guesses yguess, corresponding to the sign of the linear prediction.
function yguess = perceptron(Xtrain,ytrain,Xrun)

PERCEIVE = pinv(Xtrain'*Xtrain)*Xtrain'*ytrain;

[XRunRows,XRunCols] = size(Xrun);
yguess = zeros(XRunRows,1);


for i = 1:XRunRows
    if Xrun(i,:)*PERCEIVE>=0
        yguess(i)=1;
    else
        yguess(i)=-1;
    end
end
end
