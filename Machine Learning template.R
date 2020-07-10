# Data Preprocessing

# import the dataset
dataset = read.csv("Data.csv")

# take care of missing data in Age column
dataset$Age = ifelse(is.na(dataset$Age),        # check to see if NA in 'Age'
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),  # function to remove NA with mean
                     dataset$Age)        # replaces the NA values with mean in 'Age'

# take care of missing data in Salary column
dataset$Salary = ifelse(is.na(dataset$Salary),        # check to see if NA in 'Salary'
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),  # function to remove NA with mean
                     dataset$Salary)        # replaces the NA values with mean in 'Salary'

# encoding categorical data
dataset$Country = factor(x = dataset$Country,      # character to be categoriized
                         levels = c('France', 'Spain', 'Germany'),   # different levels
                         labels = c(1, 2, 3))     # labels to give to the levels

# splitting dataset into training and test
# load caTools package
library(caTools)
# set random seed
set.seed(123)
# create the split for the dependent variable
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# training set
training_set = subset(dataset, split == TRUE)    # 80% go here
# test set
test_set = subset(dataset, split == FALSE)    # 20% go here
# feature scaling
training_set[,2:3] = scale(training_set[,2:3])    # scale the non categorical columns
test_set[,2:3] = scale(test_set[,2:3])
