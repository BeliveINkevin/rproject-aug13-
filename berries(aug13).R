library(readr)
library(ggplot2)
library(ggpubr)
library(dplyr)
chewy<-read_csv("C:/Users/kevin/Downloads/berry_sugar_chewy.csv")
springy<-read_csv("C:/Users/kevin/Downloads/berry_sugar_springy.csv")
summary(chewy)
summary(springy)

entiredata <- dplyr::bind_cols(chewy,springy)
nrow(entiredata)
head(entiredata)
tail(entiredata)

entiredata=entiredata[,-c(4,6)]
entiredata=entiredata[,c(3,5,1,2,4)]
head(entiredata)
tail(entiredata)

xx<-ggplot(data=entiredata,aes(x=entiredata$chewiness,y=entiredata$sugar))+geom_jitter()
xy<-ggplot(data=entiredata,aes(x=entiredata$chewiness,y=entiredata$springiness))+geom_jitter()
xz<-ggplot(data=entiredata,aes(x=entiredata$chewiness,y=entiredata$nacl))+geom_jitter()

figure<-ggarrange(xx,xy,xz,labels=c("a","b","c"), ncol=2, nrow=2)
figure

tt<-ggplot(data=entiredata,aes(x=entiredata$chewiness,y=entiredata$sugTrt,
                               color=factor(entiredata$sugTrt)))+geom_jitter()
tt

chewiness<-lm(entiredata$chewiness~entiredata$springiness+entiredata$nacl+entiredata$sugar)
summary(chewiness)
springiness<-lm(entiredata$springiness~entiredata$chewiness+entiredata$nacl+entiredata$sugar)
summary(springiness)