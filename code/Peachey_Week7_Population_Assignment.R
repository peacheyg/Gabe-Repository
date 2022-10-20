# Load the "anytime" and "ggplot2" packages to complete this week's assignment.
setwd("/users/shmabe/GitHub/R4Eco_2022/Week7")
library(anytime)
library(ggplot2)
# Read the "Plankton_move_average" CSV in from GitHub. 
# These are data from the Great Lakes Environmental Research Laboratory plankton sampling.
df_w7 <- read.csv("Plankton_move_average.csv")
head(df_w7)
#Use the following lines to format the date and remove NAs from the dataset:
df_w7$Date <- as.Date(df_w7$Date, origin = "0001-01-01") # Setting values to "day zero".
df_w7 <- na.omit(df_w7)

#Plot these population data over time with the following code:
ggplot(df_w7)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=df_w7, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=df_w7, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=df_w7, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=df_w7, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 

# Export this plot to have on hand for reference in the next section of the assignment (and upload with your script).

# (1) - Which species is most likely to be r-selected prey and which its primary predator? (2 pts)
# What is one relationship the third species MIGHT have to the first two? (2 pts)
D. mendotae is most likely to be r-selected prey, and Limnocalanus is most likely to be its primary predator
Bythotrephes might have a weak commensalistic relationship with the first two. However, Limnocalanus has its highest peak subsequently, and possibly consequently, to the highest peak of Bythotrephes.
#Now copy/paste in the Lotka-Volterra function, plotting script, and load the "deSolve" package from the tutorial:
library(deSolve)
dev.off()
LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y)
    dy = -y*(gamma - delta*x)
    return(list(c(dx, dy)))
  })
}

# (2) - What do alpha, beta, gamma, and delta represent in this function? (4 pts)
alpha: rate of D. mendotae population growth
beta: rate of predation
gamma: rate of D. mendotae consumption or D mendotae population stability
delta: rate of D. mendotae consumption or Limnocalanus die-off
# (3) - By only changing values for alpha, beta, gamma, and/or delta
# change the default parameters of the L-V model to best approximate the relationship between Limncalanus and D.mendotae, assuming both plots are on the same time scale.
Pars <- c(alpha = 1.8, beta = 0.7, gamma = .2, delta = .5)
State <- c(x = 10, y = 10)
Time <- seq(0, 100, by = 1)
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))
# What are the changes you've made to alpha, beta, gamma, and delta from the default values; and what do they say in a relative sense about the plankton data? (4 pts)
I changed alpha to 1.8, beta to 0.7, and delta to 0.5, which tells us that D. mendotae has  a higher rate of population growth and predation and lower rate of Limnocalanus die-off.
# Are there other paramenter changes that could have created the same end result? (2 pts)
Other parameter changes that could have created the same results may include "proportional" decreases in gamma and beta.
# Export your final L-V plot with a legend that includes the appropriate genus and/or species name as if the model results were the real plankton data, 
# and upload with your script. (hint - remember which one is the predator and which is the prey)
matplot(out[,-1], type = "l", xlab = "Time", ylab = "Population")
legend("topright", c("Limnocalanus", "D. mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)



