#load data
aaf18 <- read.csv("E:/Research/swat/Calibration/figures/aaf18.csv", header=TRUE, 
                     sep=",")
aaf39 <- read.csv("E:/Research/swat/Calibration/figures/aaf39.csv", header=TRUE, 
                  sep=",")
aafres <- read.csv("E:/Research/swat/Calibration/figures/aafres.csv", header=TRUE, 
                  sep=",")
allaaf<- read.csv("E:/Research/swat/Calibration/figures/allaaf.csv", header=TRUE, 
               sep=",")
library(ggplot2)

 

png(filename="E:/Research/swat/Calibration/figures/18aannualflow.png",width=10, height=10, units="in",res=250)
ggplot(data=allaaf, aes(x=Year, y=flow, fill=Type)) +
  geom_bar(stat="identity", position=position_dodge(), colour="black")+facet_grid(Station ~. )+
  scale_fill_manual(values=c("gray84", "black"))+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  theme(legend.text=element_text(size=12))+labs(x = "Time", y = "Annual average daily streamflow (m^3/sec) ")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
    theme(legend.text=element_text(size=12))+ theme(legend.title=element_blank())
dev.off()
allaaf$Source_f = factor(allaaf$Station, levels=c('Muscotah','Lake Outlet','Perry'))
ggplot(data=allaaf, aes(x=Year, y=flow, colour=Type,shape=Type)) +
  geom_line(size=1) + 
  geom_point(aes(fill=Type),colour="black",pch=21,size=2)+facet_grid(Source_f~.)+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  theme(legend.text=element_text(size=12))+labs(x = "Time", y = "Annual average daily streamflow (m3s-1 ) ")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
  theme(legend.text=element_text(size=12))+ theme(legend.title=element_blank())