## unzip and read in Data
unzip("repdata-data-StormData.csv.bz2")
Stor <- read.csv("repdata-data-StormData.csv")

##Questions
##Your data analysis must address the following questions:
##1. Across the United States, which types of events 
##    (as indicated in the EVTYPE variable) are most harmful with 
##    respect to population health?
##2. Across the United States, which types of events have the 
##    greatest economic consequences?

##Consider writing your report as if it were to be 
##read by a government or municipal manager who might be 
##responsible for preparing for severe weather events and will 
##need to prioritize resources for different types of events. 
##However, there is no need to make any specific recommendations in 
##your report.


fatalites <- aggregate(FATALITIES ~ EVTYPE, StormData, sum)
injuries <- aggregate(INJURIES ~ EVTYPE, StormData, sum)