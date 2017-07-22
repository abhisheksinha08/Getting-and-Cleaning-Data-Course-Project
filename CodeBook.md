#Code Book  

The data is collected from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

###Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


###Steps

1. Only mean and standard deviation variables were selected from both test and train data.
2. Subject data and actiity was labelled.
3. Train and Test data was combined with Subject and Activity data.
4. Further Test and Train data was combined.
5. Mean value of each selected variable was calculated for each Subject and Activity Label.


###Feature Info

1. Subject_Id - Id of the subject
2. Activity_Name - Name of the activity
3. Other variables - Mean of Extracted Variable from the source dataset


###References:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.