# <p align = "center"> ### AnalyzeNeutrophil
### BTEC 330 Project-2 BY Titina Sirak

### Single and multiple regressions, and scatterplots for clinical bloodwork 
([AnalyzeNeutrophils.R](../master/AnalyzeNeutrophils.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. variables from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D and 3-D scatterplots for the results. 

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
