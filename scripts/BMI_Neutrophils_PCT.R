library("ggplot2")

setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')
df<-na.omit(data)

#BMI, Neutrophil_PCT
single.regression <- lm(BMI ~ Neutrophil_PCT, data=data)
print(single.regression)
ggplot(df, aes(x=BMI, y=Neutrophil_PCT)) +
  geom_point() +    
  geom_smooth(method=lm)




