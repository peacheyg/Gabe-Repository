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


#Subsetting the Chesapeake benthic data to only include certain benthic metrics
head(Benthic.data)
Benthic.data <- subset(Big.Benthic.data, IBIParameter == c("PCT_BURROWER", "PCT_CLING", "PCT_SWIMMER", "SIMPSON_DIVERSITY", "TOTAL_ABUNDANCE"))

#Excluding unimportant columns
benthic.2 <- subset(Benthic.data, select = c(SampleDate, IBIParameter, IBIValue))
head(benthic.2)

#Changing SampleDate from month/day/year to only year
benthic.2$SampleDate <- format(as.Date(benthic.2$SampleDate, format="%m/%d/%Y"),"%Y")


#Changing column names
colnames(USGS.FINAL.2)[colnames(USGS.FINAL.2) == "Sediment Load"] <- "SedimentLoad"
colnames(USGS.FINAL.2)[colnames(USGS.FINAL.2) == "Group.1"] <- "Year"
colnames(benthic.2)[colnames(benthic.2) == "SampleDate"] <- "Year"



#Subsetting to create separate data frames of each IBIParameter
FP.SD <- subset(benthic.2, IBIParameter == c("SIMPSON_DIVERSITY"))
FP.TA <- subset(benthic.2, IBIParameter == c("TOTAL_ABUNDANCE"))
FP.B <- subset(benthic.2, IBIParameter == c("PCT_BURROWER"))
FP.C <- subset(benthic.2, IBIParameter == c("PCT_CLING"))
FP.S <- subset(benthic.2, IBIParameter == c("PCT_SWIMMER"))

#Renaming IBIValue column
colnames(FP.SD)[colnames(FP.SD) == "IBIValue"] <- "SimpsonDiversity"
colnames(FP.TA)[colnames(FP.TA) == "IBIValue"] <- "TotalAbundance"
colnames(FP.B)[colnames(FP.B) == "IBIValue"] <- "PCTBurrower"
colnames(FP.C)[colnames(FP.C) == "IBIValue"] <- "PCTClinger"
colnames(FP.S)[colnames(FP.S) == "IBIValue"] <- "PCTSwimmer"

#Removing IBIParameter column
FP.SD <- FP.SD[,-2]
FP.TA <- FP.TA[,-2]
FP.B <- FP.B[,-2]
FP.C <- FP.C[,-2]
FP.S <- FP.S[,-2]

#Merging Simpson's Diveristy with Sediment Load
FP.SDSS <- merge(FP.SD, USGS.FINAL.2, by="Year")
head(FP.SDSS)
#Pearson's Correlation of Simpson's Diversity and Sediment Load
PC.SDSS <- cor.test(FP.SDSS$SimpsonDiversity, FP.SDSS$SedimentLoad, 
                     method = "pearson")
PC.SDSS

#Merging Simpson's Diversity, Total Abundance, and Suspended Sediment
FP.SDTA <- merge(FP.SD, FP.TA, by="Year")
FP.SDTASS <- merge(FP.SDTA, USGS.FINAL.2, by="Year")
head(FP.SDTASS)
#Multivariate Regression of Simpson's Diversity and Abundance with Sediment Load
lm.SDTASS = lm(SimpsonDiversity + TotalAbundance ~ SedimentLoad, data = FP.SDTASS)
summary(lm.SD)

#Merging benthic animal classes and Suspended Sediment
FP.BC <- merge(FP.B, FP.C, by="Year")
FP.BCS <- merge(FP.BC, FP.S, by="Year")
FP.BCSSS <- merge(FP.BCS, USGS.FINAL.2, by="Year")
head(FP.BCSSS)

#ANOVA of benthic animal classes

MANOVA.BCSSS <- manova(cbind(PCTBurrower, PCTClinger, PCTSwimmer) ~ SedimentLoad, data = FP.BCSSS)
summary(MANOVA.BCSSS)

#Plotting sediment load over time in a line graph
USGS.FINAL.2$Year <- as.numeric(as.character(USGS.FINAL.2$Year))
lg.SS <- ggplot(aes(x = Year, y = SedimentLoad), data = USGS.FINAL.2, group=1) + geom_line(color="turquoise4") + theme_minimal() + 
  labs(x="Year", y="Sediment Load (lbs/year)")
lg.SS
#Plotting benthic organism classes by year as boxplot
Benthic.graph.df <- subset(benthic.2, IBIParameter == c("PCT_BURROWER", "PCT_CLING", "PCT_SWIMMER"))
boxplot(IBIValue~IBIParameter,data=Benthic.graph.df,
        xlab="Benthic Class", ylab="Percent of Total Animals Surveyed", col=("turquoise4"))

#Plotting simpson's diversity as a function of sediment load in a scatter plot
plot(FP.SDSS$SedimentLoad, FP.SDSS$SimpsonDiversity,
     xlab="Sediment Load (lbs/year)", ylab="Simpson's Diversity", pch=19)+abline(lm(FP.SDSS$SimpsonDiversity~FP.SDSS$SedimentLoad), col="red")
