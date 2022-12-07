setwd("/users/shmabe/GitHub/Gabe-Repository/R Final Project")
USGS.csv <- read.csv("USGS Chesapeake Data.csv", header=T)
Big.Benthic.data <- read.csv("LivingResourcesIBIStation (1).csv", header=T)

#Subsetting the USGS water quality data to only include suspended sediment
USGS.SS <- subset(USGS.csv, USGS.csv$X.2 == "P80154")
head(USGS.SS)

#Excluding unimportant columns
USGS.FINAL <- subset(USGS.SS, select = c(X.3,X.6))
head(USGS.FINAL)

#Converting data to numeric
USGS.FINAL$X.6 <- as.numeric(USGS.FINAL$X.6)

#Summing the suspended sediment load for all rivers by year
USGS.FINAL.2 <- aggregate(x = USGS.FINAL$X.6, by = list(USGS.FINAL$X.3), FUN = sum) 
head(USGS.FINAL.2)


#Subsetting the Chesapeake benthic data to only include
head(Benthic.data)
Benthic.data <- subset(Big.Benthic.data, IBIParameter == c("PCT_BURROWER", "PCT_CLING", "PCT_SWIMMER", "SIMPSON_DIVERSITY", "TOTAL_ABUNDANCE"))

#Excluding unimportant columns
benthic.2 <- subset(Benthic.data, select = c(SampleDate, IBIParameter, IBIValue))
head(benthic.2)

#Changing SampleDate from month/day/year to only year
benthic.2$SampleDate <- format(as.Date(benthic.2$SampleDate, format="%m/%d/%Y"),"%Y")

#Converting the IBIParameter categories to columns of their own with the IBIValues as their respective values


#Merging sediment data and benthic data into a single data frame
