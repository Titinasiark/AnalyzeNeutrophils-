## BTEC 395 proj

## install.packages("ggplot2")
library(ggplot2)

## Set working directory
getwd()

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)

## Single Regression Test
Neutrophils.regression <- lm(DROSHA ~ Neutrophils..x10.9.cells.L. , data = IBS1)
summary(Neutrophils.regression)
df<-na.omit(data)

## scatterplot
Neutrophil_PCT.regression <- lm(DROSHA ~ Neutrophils..x10.9.cells.L. , data=IBS1)
ggplot(IBS1, aes(x=DROSHA, y=Neutrophils..x10.9.cells.L. )) +
  geom_point() +    
  geom_smooth(method=lm)


