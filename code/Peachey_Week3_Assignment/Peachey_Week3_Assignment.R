# Approximately how many hours ahead of Sunbury was the peak flow in Lewisburg during the 2011 flood? (1 pt)
# approximately 9 hours

# Give one reason why information on the time between peak flow events up- and downstream could be valuable information? (3 pts)
#It could be valuable especially for the downstream area to estimate when flooding events will occur most extremely. This would allow the residents of the area to be able to safely evacuate if needed or take precautionary measures.

# Package scavenger hunt! (8 pts each)

## 1) Using Google and ONLY packages from GitHub or CRAN:
    # Find a package that contains at least one function specifically designed to measure genetic drift.
pkgs <- c("plyr","reshape","ggplot2","magrittr","viridis","shiny")
dl_pkgs <- subset(pkgs,!pkgs %in% rownames(installed.packages()))
if(length(dl_pkgs)!=0){
  for(i in dl_pkgs) install.packages(i)
}
library(shiny)
runGitHub(username="cjbattey",repo="driftR")
 # Copy-paste into your script - and run - an example from the reference manual for a function within this package related to a measure of genetic drift. 
        # Depending on the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
    
# After running the function example, manipulate a parameter within the function to create a new result. 
        # Common options might be allele frequency, population size, fitness level, etc. 
# changed population size from 100 to 1000
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
       
          # By manipulating these parameters you can see how it impacts the results.
          # This type of manipulation is one example of how theoretical ecology and modelling are used to predict patterns in nature.



## 2) Using Google and ONLY packages from GitHub or CRAN:
    # Find a package that will generate standard diversity metrics for community ecology, specifically Simpson's Diversity Index.
    # Copy-paste into your script - and run - an example from the reference manual for a function to calculate Simpson's diversity. 
install.packages("vegan")
library("vegan")
data("BCI")
simpson.unb(BCI, inverse = FALSE)
print(1         2         3         4         5         6         7         8         9        10        11        12 
     0.9768097 0.9705705 0.9666957 0.9735281 0.9697470 0.9650982 0.9695320 0.9694491 0.9557625 0.9683857 0.9682544 0.9576765 
     13        14        15        16        17        18        19        20        21        22        23        24 
     0.9715830 0.9740865 0.9730118 0.9708815 0.9570245 0.9704653 0.9678171 0.9771366 0.9709857 0.9571214 0.9752212 0.9719062 
     25        26        27        28        29        30        31        32        33        34        35        36 
     0.9748207 0.9733482 0.9693207 0.9523905 0.9507160 0.9622918 0.9658749 0.9586152 0.9608984 0.9629418 0.7997282 0.9671058 
     37        38        39        40        41        42        43        44        45        46        47        48 
     0.9587054 0.9386142 0.9382332 0.9155855 0.9755710 0.9755413 0.9593203 0.9602210 0.9550363 0.9669215 0.9694895 0.9699785 
     49        50 
     0.9632110 0.9702243)
diversity(BCI, "invsimpson")
print(1         2         3         4         5         6         7         8         9        10        11        12 
      39.415554 31.584877 28.254778 35.225771 31.081658 26.849731 30.489077 30.487609 21.471056 29.744868 29.273803 22.251827 
      13        14        15        16        17        18        19        20        21        22        23        24 
      32.475442 35.539830 34.371014 31.907937 21.984098 30.929617 29.054548 39.775448 31.853042 22.139382 36.170213 32.708387 
      25        26        27        28        29        30        31        32        33        34        35        36 
      36.516636 34.431303 30.299530 19.971863 19.269343 25.167317 27.457940 23.002620 24.209883 25.502106  4.960258 28.454909 
      37        38        39        40        41        42        43        44        45        46        47        48 
      22.989309 15.751596 15.629977 11.589250 37.235945 37.292428 23.235938 23.737903 21.224806 28.306797 30.495526 30.903463 
      49        50 
      25.611603 31.228916 )
 # Depending on the example usage of the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
    # After running the function example, modify your script to generate another diversity metric that is NOT part of the example. 
        # If there are two diversity metrics in the example script, neither of these will count as the modified script.
        # Hint: If the function can "only" caluclate Simpson's diversity, the inverse of Simpson's diversity is another common metric. 
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
        
          # Diversity metrics are frequently used in community ecology for reasons ranging from a quick comparison between sites to understanding community stability.
          # Their calculation can be very tedious by hand - and very fast with a package designed for the operation.



