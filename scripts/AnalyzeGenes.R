## Homework submitted by Titina Sirak
## gene slected Mast cell typelisted below,
## KIT, PRG2, CTSG, MS4A2, and TPSAB1
## Set working directory
getwd()

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)



##ANOVA: IBS-Subtype vs. KIT

KIT.aov <- aov(KIT ~ IBSsubtype, data = IBS1)

summary(KIT.aov)

sink('../data_output/KIT_anova.txt', append = TRUE)

print(KIT.aov)

sink()

## Scatterplot

c1 <- rainbow(10)

c2 <- rainbow(10, alpha=0.2)

c3 <- rainbow(10, v=0.7)

boxplot(KIT ~ IBSsubtype, data = IBS1, main="KIT by IBSsubtype", 
        xlab = "IBSsubtype", ylab = "KIT", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"../fig_output/KIT_boxplot.png")

dev.off()


##ANOVA: IBS-Subtype vs.TPSAB1

TPSAB1.aov <- aov(TPSAB1 ~ IBSsubtype, data = IBS1)

summary(TPSAB1.aov)

sink('../data_output/TPSAB1_anova.txt', append = TRUE)

print(TPSAB1.aov)

sink()

## Scatterplot

c1 <- rainbow(10)

c2 <- rainbow(10, alpha=0.2)

c3 <- rainbow(10, v=0.7)

boxplot(TPSAB1 ~ IBSsubtype, data = IBS1, main="TPSAB1 by IBSsubtype", 
        xlab = "IBSsubtype", ylab = "TPSAB1", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"../fig_output/TPSAB1_boxplot.png")

dev.off()

##ANOVA: IBS-Subtype vs. PRG2 

PRG2.aov <- aov(PRG2 ~ IBSsubtype, data = IBS1)

summary(PRG2.aov)

sink('../data_output/PRG2_anova.txt', append = TRUE)

print(PRG2.aov)

sink()

## Scatterplot

c1 <- rainbow(10)

c2 <- rainbow(10, alpha=0.2)

c3 <- rainbow(10, v=0.7)

boxplot(PRG2 ~ IBSsubtype, data = IBS1, main="PRG2 by IBSsubtype", 
        xlab = "IBSsubtype", ylab = "PRG2", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"../fig_output/PRG2_boxplot.png")

dev.off()

##ANOVA: IBS-Subtype vs. MS4A2

MS4A2.aov <- aov(MS4A2 ~ IBSsubtype, data = IBS1)

summary(MS4A2.aov)

sink('../data_output/MS4A2_anova.txt', append = TRUE)

print(MS4A2.aov)

sink()

## Scatterplot

c1 <- rainbow(10)

c2 <- rainbow(10, alpha=0.2)

c3 <- rainbow(10, v=0.7)

boxplot(MS4A2 ~ IBSsubtype, data = IBS1, main="MS4A2 by IBSsubtype", 
        xlab = "IBSsubtype", ylab = "MS4A2", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"../fig_output/MS4A2_boxplot.png")

dev.off()

##ANOVA: IBS-Subtype vs.CTSG

CTSG.aov <- aov(CTSG ~ IBSsubtype, data = IBS1)

summary(CTSG.aov)

sink('../data_output/CTSG_anova.txt', append = TRUE)

print(CTSG.aov)

sink()

## Scatterplot

c1 <- rainbow(10)

c2 <- rainbow(10, alpha=0.2)

c3 <- rainbow(10, v=0.7)

boxplot(CTSG ~ IBSsubtype, data = IBS1, main="CTSG by IBSsubtype", 
        xlab = "IBSsubtype", ylab = "CTSG", col=c2, medcol=c3, whiskcol=c1, staplecol=c3, boxcol=c3, outcol=c3, pch=23, cex=2)

dev.copy(png,"../fig_output/CTSG_boxplot.png")

dev.off()





