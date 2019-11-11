# <p align = "center">  Analyze Neutrophils and Analyze Neutrophils_PCT
### <p align = "center"> BTEC 330 Project-2 BY Titina Sirak

Neutrophils help to fight infections. If you have high Neutrophil levels, it tells your doctor you have inflammation or infection somewhere in your body. If it’s low, you could be at risk for infection. The normal range is 1.6 to 7.0 cells per 1000 mm^3 of blood.

### Single and multiple regressions, and scatterplots for clinical bloodwork 
([AnalyzeNeutrophils.R](../master/AnalyzeNeutrophils.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. Neutrophils and Neutropils_PCT from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D scatterplots, one-way ANOVA with IBS-subtype as Independent Variable (X), and Neutrophils as Dependent Variable (Y). The output includes results of ANOVA test, a formatted box-and-whiskers plot and  and a formatted scattered plot.
 
Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

##
### Results of single regression, BMI x Neutrophils_PCT
```
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
```
![Neutrophils_PCT](../master/fig_output/RplotNeutrophils_PCT.png?sanitize=true)
##
### Results of single regression, BMI x Neutrophils
```
> library("ggplot2")

setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')
df<-na.omit(data)

#BMI, Neutrophils

single.regression <- lm(BMI ~ Neutrophils, data=data)
print(single.regression)
ggplot(df, aes(x=BMI, y=Neutrophils)) +
  geom_point() +    
  geom_smooth(method=lm)  

```

![Neutrophils](../master/fig_output/RplotNeutrophils.png?sanitize=true)
##
##
