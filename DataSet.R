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

ggplot(data = AmesCom, aes(x = fulldate, y = indexcomchng)) + geom_point()  
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



