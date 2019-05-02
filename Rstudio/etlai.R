#load data
etlai<- read.csv("E:/Research/swat/Calibration/figures/etlai.csv", header=TRUE, 
               sep=",")

library(ggplot2)
attach(etlai)

p <- ggplot(data=etlai, aes(Days)) +facet_wrap(~Crop)+
  geom_line(aes(y=ET..mm.,colour="ET..mm.")) + 
  #geom_line(aes(y=Biomass..Mg.ha.,colour="Biomass..Mg.ha.")) + 
  geom_line(aes(y=LAI,colour="LAI"))+scale_x_continuous(breaks = seq(0, 130, by=20), limits=c(0,140))+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  theme(legend.text=element_text(size=12))+labs(x = "Days post emergence", y = " Maximum LAI or ET (mm/day)")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
  theme(legend.text=element_text(size=12))+ theme(legend.title=element_blank())
 
p <- p + geom_line(aes(y = Biomass..Mg.ha./5, colour = "Biomass (Mg/ha)"))
p <- p + scale_y_continuous(sec.axis = sec_axis(~.*5, name = "Biomass (Mg/ha)"))+scale_color_manual(values = c("blue", "forestgreen", "black"),
                                                                                                     labels = c("Biomass (Mg/ha)",
                                                                                                                "ET (mm)",
                                                                                                                "LAI"))