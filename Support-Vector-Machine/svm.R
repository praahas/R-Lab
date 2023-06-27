#SVM
rm(list=ls())
# Importing the dataset
dataset = read.csv('C:/Users/Praahas/Projects/R/dataset/Social_Network_Ads.csv')
dataset = dataset[3:5]
dataset

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

View(dataset)
# Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)

set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)
# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])


# Fitting SVM to the Training set
#install.packages('e1071')
library(e1071)

classifier = svm(formula = Purchased ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])

y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

plot(classifier,training_set)
plot(classifier,test_set)