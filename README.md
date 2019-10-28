## AnalyzeNeutrophils_PCT

### Single and multiple regressions, and scatterplots for clinical bloodwork and gene expression data.
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
### Results of multiple regression, BMI x Neutrophils_PCT + Neutrophils
```
> library("ggplot2")
library("scatterplot3d")

setwd('C:/Users/tihet/Downloads/AnalyzeNeutrophils--master/AnalyzeNeutrophils--master/data/')
data <- read.csv('RobinsonEtAl_Sup1.csv')
df <- na.omit(data)
fit1 <- lm(formula = BMI ~ Neutrophil_PCT + Neutrophils, data=df)
summary(fit1)

Call:
lm(formula = BMI ~ Neutrophil_PCT + Neutrophils, data = df)

Residuals:
   Min     1Q Median     3Q    Max 
-5.738 -2.226 -0.702  1.017 11.748 

Coefficients:
               Estimate Std. Error t value Pr(>|t|)    
(Intercept)    25.96779    5.67039   4.580 0.000182 ***
Neutrophil_PCT -0.05572    0.14613  -0.381 0.707002    
Neutrophils     0.70526    1.01916   0.692 0.496893    


---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.429 on 20 degrees of freedom
Multiple R-squared:  0.02889,	Adjusted R-squared:  -0.06822 
F-statistic: 0.2975 on 2 and 20 DF,  p-value: 0.7459

```
s3d(df) <- scatterplot3d(df$BMI, df$Neutrophil_PCT, df$Neutrophils,  pch=16, color="steelblue", box="TRUE", highlight.3d=FALSE, type="h", main="BMI x Neutrophil_PCT x Neutrophils")
fit <- lm(BMI ~ Neutrophil_PCT + Neutrophils, data=df)
s3d$plane3d(fit)
```
![Neutrophils_PCT](../master/fig_output/RplotNeutrophils_PCT.png?sanitize=true)
