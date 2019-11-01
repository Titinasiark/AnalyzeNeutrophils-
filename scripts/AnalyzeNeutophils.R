### BTEC330 Sirak Project2

## Install necessary packages

install.packages("ggplot2")
library(ggplot2)

write.csv(IBS1, "data_output/output.csv")

##  Single Regressions for BMI vs. Neutrophils
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html
## Read data
setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')

df<-na.omit(data)

#BMI, Neutrophils

single.regression <- lm(BMI ~ Neutrophils, data=data)
print(single.regression)
ggplot(df, aes(x=BMI, y=Neutrophils)) +
  geom_point() +    
  geom_smooth(method=lm)

##  Single Regressions for BMI vs. Neutrophils_PCT
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html
## Read data

#BMI, Neutrophil_PCT
single.regression <- lm(BMI ~ Neutrophil_PCT, data=data)
print(single.regression)
ggplot(df, aes(x=BMI, y=Neutrophil_PCT)) +
  geom_point() +    
  geom_smooth(method=lm)
