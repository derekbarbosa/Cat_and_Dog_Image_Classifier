%Closest average training error rate is 20 percent.
%Closest average test error rate is 17 percent.

%This function takes in a training data matrix Xtrain, training
%label vector ytrain and uses them to compute the average cat
%and dog vectors. It also takes in a data matrix Xrun and 
%produces a vector of label guesses yguess, corresponding to whether
%each row of Xtest is closer to the average cat or average dog.
function yguess = closest_average(Xtrain,ytrain,Xrun)

[catAvg, dogAvg] = average_pet(Xtrain,ytrain); %averages for cat and dog using average_pet function with training matricies as inputs

[XRunRow,XRunCol] = size(Xrun); %return size of xrun 
yguess = (zeros(1,XRunRow)); %yguess = zeroes

    for i = 1:XRunRow
        deltaCat = ((norm(Xrun(i,:) - catAvg))); %calculate the distance using norm function
        deltaDog = ((norm(Xrun(i,:) - dogAvg)));
        if (deltaCat <= deltaDog) 
            yguess(i) = -1;
        elseif (deltaCat > deltaDog)
            yguess(i) = 1;
        end
    end
   yguess = yguess';
  

end
