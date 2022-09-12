# Now it is time to create your own data frame using the tools we have learned this week.
# First, resave this script as: your last name_Week1_Assignment
  # e.g. mine would be Wilson_Week1_Assignemnt


# Create 3 numeric vectors and 2 character vectors that are each 15 values in length with the following structures:
  # One character vector with all unique values
a <- c('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o')
  # One character vector with exactly 3 unique values
b <- c('a','a','a','a','a','b','b','b','b','b','c','c','c','c','c')
  # One numeric vector with all unique values
c <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
  # One numeric vector with some repeated values (number of your choosing)
d <- c(1,1,1,2,2,2,3,3,3,4,4,4,5,5,5)
  # One numeric vector with some decimal values (of your choosing)
e <- c(1.1,1.2,1.3,2.1,2.2,2.3,3.1,3.2,3.3,4.1,4.2,4.3,5.1,5.2,5.3)
# Bind the vectors into a single data frame, rename the columns, and make the character vector with unique values the row names.
data <- cbind(a,b,c,d,e)
data
df <- as.data.frame(data)
df
colnames(df) <- c("col1", "col2", "col3", "col4", "col5")
df
row.names(df) <- df$col1
df

# Remove the character vector with unique values from the data frame.
df.b <- df[,-1]
df.b
# Add 1 row with unique numeric values to the data frame.
f <- c(11,12,13,14,15,16,17,18,19,20,21,22,23,24,25) #This is a column instead of a row.

new.df <- cbind(df, f) #You should have used "df.b" here - this contains the column you removed in line 28.
new.df
# Export the data frame as a .csv file 
setwd("/users/shmabe/GitHub/Gabe-Repository")
write.csv(new.df,file="week1df.csv")
# Generate summary statistics of your data frame and copy them as text into your script under a new section heading.
summary(new.df) #Forgot to copy them into your script. Most of the numeric columns are also displaying as character here.
# Upload your script and your .csv file to Blackboard.


