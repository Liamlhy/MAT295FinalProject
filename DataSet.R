library(dplyr)
Ames <- read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/AmesHousing.csv")
corn <- read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/corn.csv")
pork<-read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/pork.csv")
soy<-read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/soybeans.csv")

Ames$Date <- paste(Ames$Mo.Sold, Ames$Yr.Sold, sep = " ")
AmesCom<- left_join(AmesCom, corn, by="Date")
AmesCom<- left_join(AmesCom, pork, by="Date")
AmesCom<- left_join(AmesCom, soy, by="Date")

#adding dates
AmesCom<- left_join(AmesCom, corn, by="Date")

AmesCom$indexcom <- AmesCom$CornPrice + AmesCom$SoyPrice +AmesCom$PorkPrice

AmesCom$indexcomchng <- AmesCom$CoreChange... + AmesCom$SoyChange... +AmesCom$PorkChange...

ggplot(data = AmesCom, aes(x = fulldate, y = indexcom)) + geom_point()  
+ stat_smooth(method = lm) + labs(title = "")

ggplot(data = AmesCom, aes(x = fulldate, y = newcomchg)) + geom_point()  
+ stat_smooth(method = lm) + labs(title = "")


lmtest <- lm(SalePrice~CornPrice,data=AmesCom)
summary(lmtest)

lmtest1 <- lm(SalePrice~SoyPrice,data=AmesCom)
summary(lmtest1)

lmtest2 <- lm(SalePrice~newcomchg,data=AmesCom)
summary(lmtest2)

ggplot(data = trydate, aes(x = Group.1, y = x)) + geom_point()  
+ stat_smooth(method = lm) + labs(title = "")

trydate <- aggregate(AmesCom[, 82], list(AmesCom$Date), mean)

AmesCom$d <- paste(AmesCom$Yr.Sold,AmesCom$Mo.Sold, sep = "")
avgMonthPrice <- aggregate(AmesCom[, 82], list(AmesCom$d), mean)

trydate$Date <- trydate$Group.1

AmesCom<- left_join(AmesCom, trydate, by="Date")

AmesCom$MonthAvgPrice <- AmesCom$x 

#creates new variable for total square footage
AmesCom$TotalSF <- AmesCom$Total.Bsmt.SF + AmesCom$X1st.Flr.SF + AmesCom$X2nd.Flr.SF

lmtestSf <- lm(SalePrice~TotalSF,data=AmesCom)
summary(lmtestSf)
#above Reg gives R62 of .6288
