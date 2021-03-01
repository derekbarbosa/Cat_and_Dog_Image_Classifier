%Linear discriminant analysis training error rate is 49 percent.
%Linear discriminant analysis test error rate is 54 percent.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the cat
%and dog sample mean vectors as well as the sample covariance matrix 
%(which is assumed to be equal for cats and dogs). 
%It also takes in a data matrix Xrun and produces a vector of
%label guesses yguess, corresponding to the ML rule for
%jointly Gaussian vectors with different means and the same 
%covariance matrix.
function yguess = lda(Xtrain,ytrain,Xrun)

[catAvg, dogAvg] = average_pet(Xtrain,ytrain); %averages for cat and dog using average_pet function with training matricies as inputs

cat_mat = Xtrain(find(ytrain==1),:);
dog_mat = Xtrain(find(ytrain==-1),:);

[XTrainRow,XTrainCol] = size(Xtrain);
[XRunRow,XRunCol] = size (Xrun);

yguess = zeros(XRunRow,1);

[trainedCat,~] = size(cat_mat);
[trainedDog,~] = size(dog_mat);

catCov = cov(trainedCat);
dogCov = cov(trainedDog);

covMat = (((1/(XTrainRow-2))*(((trainedCat-1)*catCov)+((trainedDog-1)*dogCov))));

invcov= pinv(covMat);

LDA2 = (dogAvg'*invcov*dogAvg) - (catAvg'*invcov*catAvg);

    for i=1:XRunRow
        LDA1 = 2*Xrun(i,:)'*invcov*(dogAvg-catAvg);
        if LDA1 >= LDA2
            yguess(i) = 1;
        else
            yguess(i) = -1;
        end
    end

end