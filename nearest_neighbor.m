%Nearest neighbor training error rate is 0 percent.
%Nearest neighbor test error rate is 15 percent.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess. Each guess is found
%by searching through Xtrain to find the closest row, and then 
%outputting its label.
function yguess = nearest_neighbor(Xtrain,ytrain,Xrun)

[XRunRows, XRunCols] = size(Xrun);
[XTrainRows, XTrainCols] = size(Xtrain);
closest = zeros(XTrainRows,1);
yguess = zeros(XRunRows,1);


for i = 1: XRunRows
    for j = 1:length(ytrain)
        closest(j) = norm(Xrun(i,:) - Xtrain(j,:));
    end
    
    [distance, index] = min(closest);
     yguess(i) = ytrain(index);
end




end
