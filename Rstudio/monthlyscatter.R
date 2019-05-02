#load data
scaterflow<- read.csv("E:/Research/swat/Calibration/figures/allmonthlyscater.csv", header=TRUE, 
               sep=",")
library(ggplot2)
scaterflow$Source_f = factor(scaterflow$Station, levels=c('Muscotah','Lake Outlet','Perry'))

ggplot(data = scaterflow, aes(x = Observed, y = Simulated)) +
  geom_smooth(method = "lm", se=FALSE, color="black", formula = Simulated ~ Observed) +
  geom_point(size = 2,shape = 21, colour = "black", fill = "white")+facet_grid(Source_f ~Period )+ geom_smooth(method=lm, se=FALSE,color="black")+ theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  labs(x = "Observedflow (m^3/sec)", y = "Simulatedflow (m^3/sec) ")
