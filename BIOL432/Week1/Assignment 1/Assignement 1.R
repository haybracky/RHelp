# BIOL432 Assignment 1
## Hayley Brackenridge
### 08/01/19

# Create a new project in R Studio and write an R script that will estimate the volume of an organism’s leg, 
# given a dataset of measurements. The input dataset may contain a number of measurements and other variables 
# but will always include the columns ‘limb.length’ ‘limb.width’ and ‘units’, though not always in that order. 
# The organisms in the datasets could be anything from an insect to a human or other large mammal, and your 
# program should work on any of them.

MyData<- read.csv("measurements.csv") # load the data file
MyData # view dataset
str(MyData) # check variable types

MyData$Vol<- ((MyData$limb.width/2)^2)*pi*MyData$limb.length # estimate volume using V=pi(r^2)h
MyData$Vol # view new volume column

for(i in 1:length(MyData$units)){
  if (MyData$units[i]=="mm") {
    MyData$limb.volume[i]<- (MyData$Vol[i]*0.001)
  } else {
    MyData$limb.volume[i]<- (MyData$Vol[i]*16.3871)
  }
} # use a for loop with an if and else statement to convert mm and in to cm 
MyData$limb.volume # view new cm volume

write.csv(MyData,"volume.csv") # export the modified data.frame as a csv

mean(MyData$limb.volume) # calculate average limb volume
