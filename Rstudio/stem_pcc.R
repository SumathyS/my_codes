pcc <- read.table("C:/Users/ssinnath/Desktop/test/pcc.csv", header=TRUE, 
                   sep=",")
attach(sens)
library(ggplot2)

p <-ggplot(data=pcc, mapping=aes(x=PCC, y=Parameter))
p + geom_point(size=4, shape=21)+geom_segment(aes(xend=0,yend=Parameter))+facet_grid(. ~ Medium)+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text(face="bold", colour="black", size=14),
                                                                            axis.text.x  = element_text(angle=90, vjust=0.5, size=14,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                                             axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+labs(x = "PCC", y = "Parameter")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
  labs(colour = "P value <0.05") +
  theme(legend.text=element_text(size=12))
dev.off()
