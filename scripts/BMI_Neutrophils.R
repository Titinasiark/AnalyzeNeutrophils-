library("ggplot2")

setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')
df<-na.omit(data)

#BMI, Neutrophils

single.regression <- lm(BMI ~ Neutrophils, data=data)
print(single.regression)
ggplot(df, aes(x=BMI, y=Neutrophils)) +
  geom_point() +    
  geom_smooth(method=lm)
