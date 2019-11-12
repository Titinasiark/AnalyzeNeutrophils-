## BTEC330 F2019 Project2 Sirak

## Install necessary packages
library(ggplot2)
## Read data
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS)
write.csv(IBS, "data_output/Neutrophils.csv")

##  Single Regressions 
##  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test, BMI vs. Neutrophils
Neutrophils.regression <- lm(BMI ~ Neutrophils, data = IBS)
summary(Neutrophils.regression)

## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/
sink('data_output/Neutrophils_regression.txt', append = TRUE)
print(Neutrophils.regression)
sink()
df<-na.omit(data)


## ANOVA: IBS-subtype vs. Neutrophils
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r
Neutrophils.aov <- aov(Neutrophils ~ IBS.subtype, data = IBS)
summary(Neutrophils.aov)
sink('data_output/Neutrophils_anova.txt', append = TRUE)
print(Neutrophils.aov)
sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS, aes(x = BMI, y = Neutrophils)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE)

## https://www.stat.berkeley.edu/~s133/saving.html
dev.copy(png,"fig_output/Neutrophils_scatterplot.png")
dev.off()

Neutrophils_scatterplot <- ggplot(IBS, aes(x = BMI, y = Neutrophils)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE) 

## Box plots
## https://www.statmethods.net/graphs/boxplot.html

## https://tomizonor.wordpress.com/2013/04/18/color-boxplot/
c1 <- rainbow(10)
c2 <- rainbow(10, alpha=0.2)
c3 <- rainbow(10, v=0.7)

boxplot(Neutrophils ~ IBS.subtype, data = IBS, main="Neutrophils by IBS subtype", 
                       xlab = "IBS.subtype", ylab = "Neutrophils", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"fig_output/Neutrophils_boxplot.png")
dev.off()

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the Neutrophils_result parameter

IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)

IBS$Neutrophils_result <- "NA"


IBS$Neutrophils_result[IBS$Neutrophils > 7.0] <- "HIGH"

IBS$Neutrophils_result[IBS$Neutrophils <= 7.0 & IBS$Neutrophils >= 1.6] <- "NORMAL"

IBS$Neutrophils_result[IBS$Neutrophils < 1.6] <- "LOW"
write.csv(IBS, "data_output/Neutrophils.csv")


## BTEC330 Project AnalyzeNeutrophil_PCT Sirak

## Install necessary packages
library(ggplot2)
## Read data
IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS)
write.csv(IBS, "data_output/Neutrophil_PCT.csv")

##  Single Regressions 
##  Data obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html

## Single Regression Test, BMI vs. Neutrophil_PCT

Neutrophil_PCT.regression <- lm(BMI ~ Neutrophil_PCT, data = IBS)

summary(Neutrophil_PCT.regression)

## Output the results to a file
## http://www.cookbook-r.com/Data_input_and_output/Writing_text_and_output_from_analyses_to_a_file/

sink('data_output/Neutrophil_PCT_regression.txt', append = TRUE)

print(Neutrophil_PCT.regression)

sink()

df<-na.omit(data)


## ANOVA: IBS-subtype vs. Neutrophil_PCT
## http://www.sthda.com/english/wiki/one-way-anova-test-in-r

Neutrophil_PCT.aov <- aov(Neutrophil_PCT ~ IBS.subtype, data = IBS)

summary(Neutrophil_PCT.aov)

sink('data_output/Neutrophil_PCT_anova.txt', append = TRUE)

print(Neutrophil_PCT.aov)

sink()

## Print scatterplot and box plots as .png files into "fig_output" project directory.
## http://www.sthda.com/english/wiki/ggsave-save-a-ggplot-r-software-and-data-visualization

## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS, aes(x = BMI, y = Neutrophil_PCT)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE)

## https://www.stat.berkeley.edu/~s133/saving.html
dev.copy(png,"fig_output/Neutrophil_PCT_scatterplot.png")

dev.off()

Neutrophil_PCT_scatterplot <- ggplot(IBS, aes(x = BMI, y = Neutrophil_PCT)) +
  geom_point(na.rm=TRUE) +    
  geom_smooth(method = lm,na.rm=TRUE) 

## Box plots
## https://www.statmethods.net/graphs/boxplot.html

## https://tomizonor.wordpress.com/2013/04/18/color-boxplot/
c1 <- rainbow(10)
c2 <- rainbow(10, alpha=0.2)
c3 <- rainbow(10, v=0.7)

boxplot(Neutrophil_PCT ~ IBS.subtype, data = IBS, main="Neutrophil_PCT by IBS subtype", 
        xlab = "IBS.subtype", ylab = "Neutrophil_PCT", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"fig_output/Neutrophil_PCT_boxplot.png")
dev.off()

## Assign "HIGH", "NORMAL", or "LOW" based on clinical range to the Neutrophil_PCT_result parameter

IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)

IBS$Neutrophil_PCT_result <- "NA"


IBS$Neutrophil_PCT_result[IBS$Neutrophil_PCT > 71] <- "HIGH"

IBS$Neutrophil_PCT_result[IBS$Neutrophil_PCT <= 71 & IBS$Neutrophil_PCT >= 34] <- "NORMAL"

IBS$Neutrophil_PCT_result[IBS$Neutrophil_PCT < 34] <- "LOW"

write.csv(IBS, "data_output/Neutrophil_PCT.csv")


