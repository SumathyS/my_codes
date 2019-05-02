perc <- read.table("E:/Research/swat/ESA Scenarios/perc.csv", header=TRUE, 
                   sep=",")
library(ggplot2)
library(RColorBrewer)

ggplot(perc,aes(x=Pollutant,y=Percent, fill=Pollutant))+geom_boxplot(ylim=c(50,50,50))+facet_grid(~BMP)+ 
  labs(x = "", y = "Percent Decrease from Baseline",color="Pollutant")+
  scale_y_continuous(limits = c(-2, 100))+
  scale_fill_brewer(palette="BrBG")+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+
  theme(strip.text=element_text(color="white", face="bold",size=14))+ theme(axis.title.x = element_text(face="bold", colour="black", size=20),
                                                                    axis.text.x  = element_text(angle=90, vjust=0.5, size=20))+ theme(axis.title.y = element_text(face="bold", colour="black", size=20),
                                                                                                                                      axis.text.y  = element_text(vjust=0.5, size=20))+theme(legend.position = "none")+theme(legend.key.size = unit(1, "in"))+theme(legend.text=element_text(size=20)) 

env <- read.table("E:/Research/swat/ESA Scenarios/env.csv", header=TRUE, 
                   sep=",")
attach(env)
library(ggplot2)
library(RColorBrewer)

ggplot(env,aes(x=BMP,y=Percent,fill=BMP))+geom_boxplot(ylim=c(10,10,10))+
  labs(x = "BMPs", y = "Percent of Total Flow",color="BMP")+
  scale_y_continuous(limits = c(10, 80))+
  scale_fill_brewer(palette="BrBG")+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+
  theme(strip.text=element_text(color="white", face="bold",size=20))+ theme(axis.title.x = element_text(face="bold", colour="black", size=20),
                                                                            axis.text.x  = element_text(angle=90, vjust=0.5, size=20))+ theme(axis.title.y = element_text(face="bold", colour="black", size=20),
                                                                                                                                              axis.text.y  = element_text(vjust=0.5, size=20,colour="black" ))+theme(legend.position = "top")+ theme(legend.key.size = unit(0.5, "in"))+theme(axis.text.x = element_blank())+theme(legend.text=element_text(size=20))+guides(fill=guide_legend(nrow=2,byrow=TRUE))                                                                                                                                              
boxplot(Percent~BMP,ylab="Percent of Total Flow",xlab="BMPs",size=16, horizontal=TRUE)