## unzip and read in Data

StormData <- read.csv("repdata-data-StormData.csv.bz2")

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

## sum of fatalities and injuries for each event type
fatalites <- aggregate(FATALITIES ~ EVTYPE, StormData, sum)
injuries <- aggregate(INJURIES ~ EVTYPE, StormData, sum)

## top 5 for fatalities and injuries
fatal <- subset(fatalites, fatalites$FATALITIES > 600)
injury <- subset(injuries, injuries$INJURIES > 5000)

## combined the two lists, where both injuries and fatalities
## were in the top 5
harm <- merge(fatal, injury, by = "EVTYPE")

## prints the 12 events that are still present
as.character(harm$EVTYPE)


#combines to one list
type <- c("INJURIES", "INJURIES", "INJURIES", "INJURIES", "INJURIES")
injury1 <- cbind(injury, type)
type <- c("FATALITIES", "FATALITIES", "FATALITIES", "FATALITIES", "FATALITIES")
fatal1 <- cbind(fatal, type)
colnames(injury1) <- c("Event", "number", "type")
colnames(fatal1) <- c("Event", "number", "type")
plot_data <- rbind(injury1, fatal1)


qplot(x=EVTYPE, y=number, fill=type,
      data=plot_data, geom="bar", stat="identity",
      position="dodge")



