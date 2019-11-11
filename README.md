# <p align = "center">  Analyze Neutrophils and Analyze Neutrophils_PCT
### <p align = "center"> BTEC 330 Project-2 BY Titina Sirak

Neutrophils help to fight infections. If you have high Neutrophil levels, it tells your doctor you have inflammation or infection somewhere in your body. If it’s low, you could be at risk for infection. The normal range is 1.6 to 7.0 cells per 1000 mm^3 of blood.
Data obtained from WebMD . (doi https://www.webmd.com/a-to-z-guides/complete-blood-count#1)

##### Single regressions, ANOVA test, box-and-whiskers plot and scatterplots for clinical bloodwork 

([AnalyzeNeutrophils.R](../master/AnalyzeNeutrophils.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. Neutrophils and Neutropils_PCT from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D scatterplots, one-way ANOVA with IBS-subtype as Independent Variable (X), and Neutrophils as Dependent Variable (Y). The output includes results of ANOVA test, a formatted box-and-whiskers plot and  and a formatted scattered plot.
Data (RobinsonEtAl_Sup1.csv) was downloaded from: 
Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

##
##### BTEC330 F2019 Project2 Sirak
## Install necessary packages
```
install.packages("ggplot2")
library(ggplot2)
```
##### Read data
```
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS)
write.csv(IBS, "data_output/Neutrophils.csv")
```
######  Single Regressions 
######  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
######  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
######  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
######  http://r-statistics.co/Linear-Regression.html

##### Single Regression Test, BMI vs. Neutrophils
```
Neutrophils.regression <- lm(BMI ~ Neutrophils, data = IBS)
summary(Neutrophils.regression)
```

##### Output the results to a file
###### Data obtained from doi: http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
```
sink('data_output/Neutrophils_regression.txt', append = TRUE)
print(Neutrophils.regression)
sink()
df<-na.omit(data)
```

##### ANOVA: IBS-subtype vs. Neutrophils
###### Data obtained from doi: http://www.sthda.com/english/wiki/one-way-anova-test-in-r
```
Neutrophils.aov <- aov(Neutrophils ~ IBS.subtype, data = IBS)
summary(Neutrophils.aov)
sink('data_output/Neutrophils_anova.txt', append = TRUE)
print(Neutrophils.aov)
sink()
```
##### Scatterplots
##### Print scatterplot and box plots as .png files into "fig_output" project directory.
###### Data obtained from doi: http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization
https://www.statmethods.net/graphs/scatterplot.html

```
ggplot(IBS, aes(x = BMI, y = Neutrophils)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE)

 https://www.stat.berkeley.edu/~s133/saving.html
dev.copy(png,"fig_output/Neutrophils_scatterplot.png")
dev.off()

Neutrophils_scatterplot <- ggplot(IBS, aes(x = BMI, y = Neutrophils)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE)
  
```
![Neutrophils_PCT](../master/fig_output/RplotNeutrophils_PCT.png?sanitize=true)
##

##### Box plots
 ###### Data obtained from doi: https://www.statmethods.net/graphs/boxplot.html
 https://tomizonor.wordpress.com/2013/04/18/color-boxplot/
 ```
c1 <- rainbow(10)
c2 <- rainbow(10, alpha=0.2)
c3 <- rainbow(10, v=0.7)

boxplot(Neutrophils ~ IBS.subtype, data = IBS, main="Neutrophils by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "Neutrophils", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"fig_output/Neutrophils_boxplot.png")
dev.off()
```
##### Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the Neutrophils_result parameter
```
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)

IBS$Neutrophils_result <- "NA"


IBS$Neutrophils_result[IBS$Neutrophils > 7.0] <- "HIGH"

IBS$Neutrophils_result[IBS$Neutrophils <= 7.0 & IBS$Neutrophils >= 1.6] <- "NORMAL"

IBS$Neutrophils_result[IBS$Neutrophils < 1.6] <- "LOW"
write.csv(IBS, "data_output/Neutrophils.csv")
```

![Neutrophils](../master/fig_output/RplotNeutrophils.png?sanitize=true)
##
##
