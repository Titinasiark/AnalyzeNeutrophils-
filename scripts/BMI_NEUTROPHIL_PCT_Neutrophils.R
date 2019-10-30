library("ggplot2")
library("scatterplot3d")

setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')
df <- na.omit(data)

fit1 <- lm(formula = BMI ~ Neutrophil_PCT + Neutrophils, data=df)
summary(fit1)

s3d(df) <- scatterplot3d(df$BMI, df$Neutrophil_PCT, df$Neutrophils,  pch=16, color="steelblue", box="TRUE", highlight.3d=FALSE, type="h", main="BMI x Neutrophil_PCT x Neutrophils")
fit <- lm(BMI ~ Neutrophil_PCT + Neutrophils, data=df)
s3d$plane3d(fit)

