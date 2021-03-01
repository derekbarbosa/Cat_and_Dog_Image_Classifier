%This function takes in a data matrix X and a label
%vector y and outputs the average cat image and average dog image.
function [avgcat,avgdog] = average_pet(X,y)

[Xrow, Xcol] = size(X);
cats = zeros(1,Xcol); %%empty vec to store  all cats from sample
catRunSum = 0; %%running sum
dogs = zeros(1,Xcol); %%empty vec to store all dogs from sample
dogRunSum = 0; %%running sum

loop = length(y); %%var to loop over.
columns = 1:(Xcol); %store number of columns. vector from 1:col_size



    for i = 1:loop %loop
        if (y(i) == -1)
            cats = cats + X(i,columns); %add a cats entry from X to cats matrix
            catRunSum = catRunSum + 1; %running sum to do avg
        elseif (y(i) == 1)
            dogs = dogs + X(i,columns); %add a dogs entry from X to dogs matrix
            dogRunSum = dogRunSum +1; %running sum to do avg
        end
    end
    
    
avgcat = cats/catRunSum;
avgdog = dogs/dogRunSum;


end