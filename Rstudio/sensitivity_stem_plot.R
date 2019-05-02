#load data
sens <- read.csv("E:/Research/swat/Calibration/sensitivity.csv", header=TRUE,sep=",")
attach(sens)
library(ggplot2)


# png(filename="C:/Users/ssinnath/Research/swat/weather/comparsion/sensitivity.png",width=10, height=10, units="in",res=250)
# p <-ggplot(data=sens, mapping=aes(x=t.Stat, y=Parameter.Name))
# p + geom_point(aes(colour = factor(P.value<0.05)),size=4, shape=21)+geom_segment(aes(xend=0,yend=Parameter.Name))+facet_grid(. ~ Source)+ scale_fill_brewer(palette="BrBG")+
#   theme_bw()+
#   theme(strip.background=element_rect(fill="gray"))+geom_vline(aes(xintercept=0))+
#   theme(strip.text=element_text(color="black", size=14))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
#                                                                             axis.text.x  = element_text(angle=90, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
#                                                                                                                                               axis.text.y  = element_text(vjust=0.5, size=12))+theme(legend.text=element_text(size=14))+labs(x = "t-Stat Value", y = "Parameter")
# dev.off()

png(filename="C:/Users/ssinnath/Research/swat/manusresults/sensitivity_afterprism.png",width=10, height=10, units="in",res=250)
sens$Source_f = factor(sens$Source, levels=c('GHCN_D','DAYMET','NLDAS',"GLDAS","PRISM"))
p <-ggplot(data=sens, mapping=aes(x=t.Stat, y=Parameter.Name))
p + geom_point(aes(fill = factor(P.value<0.05)),size=5, shape=21)+scale_colour_manual(values = c("black","red"))+geom_segment(aes(xend=0,yend=Parameter.Name))+facet_grid(. ~ Source_f)+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                  axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+labs(x = "t-Stat Value", y = "Parameters")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
  labs(colour = "P value <0.05") +
  theme(legend.text=element_text(size=12))
dev.off()

# 
# png(filename="C:/Users/ssinnath/Research/swat/weather/comparsion/sensitivity.png",width=10, height=10, units="in",res=250)
# p <-ggplot(data=sens, mapping=aes(x=t.Stat, y=Parameter.Name))
# p + geom_point(aes(colour = factor(P.value<0.05)),size=4, shape=21)+geom_segment(aes(xend=0,yend=Parameter.Name))+facet_grid(. ~ Source)+
#   theme_bw()+
#   theme(strip.background=element_rect(fill="gray"))+geom_vline(aes(xintercept=0))+
#   theme(strip.text=element_text(color="black", size=14))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
#                                                                 axis.text.x  = element_text(angle=90, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
#                                                                                                                                   axis.text.y  = element_text(vjust=0.5, size=12))+theme(legend.text=element_text(size=14))+labs(x = "t-Stat Value", y = "Parameter")
# dev.off()