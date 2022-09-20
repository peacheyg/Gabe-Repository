# With the data frame you created last week you will:
new.df #next time include code to create everything here again. I get why you did it this way though. Why do you have new.df here but use df throughout?
# Create a barplot for one numeric column, grouped by the character vector with 3 unique values
df.mean <- aggregate(as.numeric(as.character(df$col5)) ~df$col2, FUN = "mean") #this throws errors based on your data frame. You need to make sure $col5 is read as numeric.
df.mean
  # Add error bars with mean and standard deviation to the plot
df.sd <- aggregate(df$col5 ~df$col2, FUN = "sd")
  # Change the x and y labels and add a title
plot(df1$dec.num ~ df1$uniqu.num, xlab = "Explanatory", ylab = "Response", main = "My Favorite Scatter Plot") #Just here as an example?
  # Export the plot as a PDF that is 4 inches wide and 7 inches tall.

# Create a scatter plot between two of your numeric columns.
plot(df$col5 ~ df$col4)
  # Change the point shape and color to something NOT used in the example.
plot(df$col5 ~ df$col4, xlab = "Explanatory", ylab = "Response", main = "Gabe's Scatter PLot", 
     cex.axis=0.8, cex.main = 0.5, cex.lab = 1.25, pch=8, col = "peachpuff1") #excellent color choice.
  # Change the x and y labels and add a title
plot(df$col5 ~ df$col4, xlab = "Explanatory", ylab = "Response", main = "Gabe's Scatter Plot")
  # Export the plot as a JPEG by using the "Export" button in the plotting pane.

# Upload both plots with the script used to create them to GitHub.
  # Follow the same file naming format as last week for the script.
  # Name plots as Lastname_barplot or Lastname_scatterplot. Save them to your "plots" folder.

#where is the code to create your barplot, the PDF of the plot with specific dimensions, and/or set the working directory?