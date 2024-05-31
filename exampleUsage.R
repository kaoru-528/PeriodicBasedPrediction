# # when you run this program for the first time, you have to install thire packages
# install.packages("tictoc")
# install.packages("doParallel")
# install.packages("foreach")

# Load necessary libraries
library(doParallel)
library(foreach)
library(tictoc)

periodicBasedPrediction_Path = paste0(dirname(rstudioapi::getSourceEditorContext()$path), "/src/wseBasedPrediction.R")
source(periodicBasedPrediction_Path)

# Load data
Data = LoadData(DataPath = "/example/exampleDS.txt")
DataTransform = "none"
ThresholdName = "ldt"
ThresholdMode = "h"
Index = 3
PredictionPercentage = 0.5

PeriodicResult = PeriodicBasedPrediction(Data, DataTransform, ThresholdName, ThresholdMode, Index, PredictionPercentage)

QuatraticResult = QuatraticBasedPrediction(Data, DataTransform, ThresholdName, ThresholdMode, Index, PredictionPercentage)
