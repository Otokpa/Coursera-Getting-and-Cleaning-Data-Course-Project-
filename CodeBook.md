###the UCI HAR Dataset working directory:

-activity_labels.txt are the descriptive names and id for the activity types found in the train and test data sets.

-features.txt are the descriptive names of the variables found in the train and test data sets

-activityData.txt is the final output of the run_analysis.R script

-in the test and train directory we have we have 3 data sets each that are to be merged to form the data with its corresponding subject id and activity id.

### Cleaning the data

-the script uses gsub to clean the variables  by replacing -std, -mean, bodybody  and - with Std, Mean, body. It also removes ’() and -‘.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

Mean: Mean value
Std: Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
this is the list of the mean and standard deviation variables cleaned:


 "activity.id"                        
 "subject.id"                         
 "tBodyAcc Mean X"                   
 "tBodyAcc Mean Y"                    
 "tBodyAcc Mean Z"                    
 "tGravityAcc Mean X"                
 "tGravityAcc Mean Y"                 
 "tGravityAcc Mean Z"                 
 "tBodyAccJerk Mean X"               
"tBodyAccJerk Mean Y"                
"tBodyAccJerk Mean Z"                
"tBodyGyro Mean X"                  
 "tBodyGyro Mean Y"                   
"tBodyGyro Mean Z"                   
"tBodyGyroJerk Mean X"              
 "tBodyGyroJerk Mean Y"               
"tBodyGyroJerk Mean Z"               
"tBodyAccMag Mean"                  
"tGravityAccMag Mean"                
"tBodyAccJerkMag Mean"               
"tBodyGyroMag Mean"                 
"tBodyGyroJerkMag Mean"              
"fBodyAcc Mean X"                   
"fBodyAcc Mean Y"                   
"fBodyAcc Mean Z"                    
"fBodyAcc MeanFreq X"                
"fBodyAcc MeanFreq Y"               
"fBodyAcc MeanFreq Z"                
"fBodyAccJerk Mean X"                
"fBodyAccJerk Mean Y"               
"fBodyAccJerk Mean Z"                
"fBodyAccJerk MeanFreq X"            
"fBodyAccJerk MeanFreq Y"           
"fBodyAccJerk MeanFreq Z"            
"fBodyGyro Mean X"                   
"fBodyGyro Mean Y"                  
"fBodyGyro Mean Z"                   
"fBodyGyro MeanFreq X"               
"fBodyGyro MeanFreq Y"              
"fBodyGyro MeanFreq Z"               
"fBodyAccMag Mean"                   
"fBodyAccMag MeanFreq"              
"fbodyAccJerkMag Mean"               
"fbodyAccJerkMag MeanFreq"           
"fbodyGyroMag Mean"                 
"fbodyGyroMag MeanFreq"              
"fbodyGyroJerkMag Mean"              
"fbodyGyroJerkMag MeanFreq"         
"angletBodyAccMean,gravity"          
"angletBodyAccJerkMean,gravityMean"  
"angletBodyGyroMean,gravityMean"    
"angletBodyGyroJerkMean,gravityMean" 
"angleX,gravityMean"                 
"angleY,gravityMean"                
"angleZ,gravityMean"                 
"tBodyAcc Std X"                     
"tBodyAcc Std Y"                    
"tBodyAcc Std Z"                     
"tGravityAcc Std X"                  
"tGravityAcc Std Y"                 
"tGravityAcc Std Z"                  
"tBodyAccJerk Std X"                 
"tBodyAccJerk Std Y"                
"tBodyAccJerk Std Z"                 
"tBodyGyro Std X"                    
"tBodyGyro Std Y"                   
"tBodyGyro Std Z"                    
"tBodyGyroJerk Std X"                
"tBodyGyroJerk Std Y"               
"tBodyGyroJerk Std Z"                
"tBodyAccMag Std"                    
"tGravityAccMag Std"                
"tBodyAccJerkMag Std"                
"tBodyGyroMag Std"                   
"tBodyGyroJerkMag Std"              
"fBodyAcc Std X"                     
"fBodyAcc Std Y"                     
"fBodyAcc Std Z"                    
"fBodyAccJerk Std X"                 
"fBodyAccJerk Std Y"                 
"fBodyAccJerk Std Z"                
"fBodyGyro Std X"                    
"fBodyGyro Std Y"                    
"fBodyGyro Std Z"                   
"fBodyAccMag Std"                    
"fbodyAccJerkMag Std"                
"fbodyGyroMag Std"                  
"fbodyGyroJerkMag Std"               
"activity.name"
