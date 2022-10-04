# Look at the plot and model results for our Dryad data in the tutorial. Part 1: Without knowing which points represent which groups, 
  # give one explanation for why these data might be difficult to draw spatial inferences about genes.(3 points)
#The data might be difficult to draw spatial inferences about genes because it doesn't show topography, and there's not enough randomly sampled data.
  # Part 2: Despite the drawbacks, give the result or interpretation that you feel most confident in (3 points), and EXPLAIN WHY (4 points).
#The interpretation I feel most confident in is that more randomly-sampled data needs to be collected and other factors such as topography should be considered to fully understand the relationship between the genes and their geographic region.

# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.
  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". (2 points)
require(devtools)
install.packages("stability")
library(stability)
data("ge_data")
ge_data

  # Create two linear models for Yield Response: one related to the Environment and one to the Genotype. (2 points each)
mod.Env <- lm(ge_data$Yield ~ ge_data$Env)
mod.Gen <- lm(ge_data$Yield ~ ge_data$Gen)
  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.

# Test the significance of both models and look at the model summary. (3 points each)
anova(mod.Env)
summary(mod.Env)
anova(mod.Gen)
summary(mod.Gen)
  # Which model is a better fit to explain the yield response, and WHY? (6 points)
  # Hint: Does one model seem more likely to be over-fitted?
#Environment is a better fit to explain the yield response because it has a smaller p value.
# Which environment would be your very WORST choice for generating a strong yield response? (2 points)
#Sargodha would be the worst choice for generating a strong yield response.