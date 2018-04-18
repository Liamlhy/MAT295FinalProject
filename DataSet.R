library(dplyr)
Ames <- read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/AmesHousing.csv")
corn <- read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/corn.csv")
pork<-read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/pork.csv")
soy<-read.csv("~/Desktop/Spring 2018/MAT295/FinalProject/soybeans.csv")

Ames$Date <- paste(Ames$Mo.Sold, Ames$Yr.Sold, sep = " ")
AmesCom<- left_join(Ames, corn, by="Date")
AmesCom<- left_join(AmesCom, pork, by="Date")
AmesCom<- left_join(AmesCom, soy, by="Date")



#test
