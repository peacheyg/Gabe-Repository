# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."
setwd("/users/shmabe/GitHub/R4Eco_2022/Week6")
df <- read.csv("Toscano_Griffen_Data.csv")
head(df)
library(MASS)
library(MuMIn)
library(mgcv)
# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from the tutorial. 
  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 
    # In one model only include additive effects.

#Run out of order - line 23 needs to be up here.
glmm.mod1 <- glmmPQL(prop.cons~temperature+carapace.width+claw.width, family = binomial, random = ~ 1 | block, data = df)
summary(glmm.mod1)
    # In the other model include one interactive effect.
glmm.mod2 <- glmmPQL(prop.cons~temperature+carapace.width*claw.width, family = binomial, random = ~ 1 | block, data = df)
summary(glmm.mod2)
    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.
?glmmPQL
# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
  # So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):
df$prop.cons <- df$eaten/df$prey 

# (Q1) - The code in line 8 is performing two operations at once. What are they? (2 pts)
#?

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)
#The interactive effect did affect which variables predict proportional consumption because it produced lower p values.
#What about r-squared, specific variables, etc? This is a very tiny part of the difference and not specific.
  
# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)
plot(glmm.mod1$residuals, ylim = c(-4,4))
plot(glmm.mod2$residuals, ylim = c(-.1,.1))
#Why the limits? What about the actual questions?

# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)
gam.mod1 <- gam(activity.level~temperature+carapace.width+claw.width, family = binomial, random = list(ID=~ 1), data = df)

gam.mod2 <- gam(activity.level~temperature*carapace.width+claw.width, family = binomial, random = list(ID=~ 1), data = df)

AIC(gam.mod1) 
"466.0729"
AIC(gam.mod2) 
"464.2142"
# (Q4) - Which model is a better fit? (2 pt)
The general additive model with the interactive effect is a better fit because it produced a lower AIC value.

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)
plot(gam.mod1$residuals, ylim = c(-4,4))
plot(gam.mod2$residuals, ylim = c(-4,4))
A little confident because the model with the interactive effect produced residual with a more defined trend.
#No, and it didn't! You don't want a trend in the residuals...neither model shows any pattern which is good.






