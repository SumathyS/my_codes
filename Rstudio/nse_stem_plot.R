#load data
wrinse<- read.csv("E:/Research/swat/Calibration/figures/wrinse.csv", header=TRUE, 
                sep=",")
monthlynse<- read.csv("E:/Research/swat/Calibration/figures/monthlynse.csv", header=TRUE, 
               sep=",")
magduranse<- read.csv("E:/Research/swat/Calibration/figures/magduranse.csv", header=TRUE, 
                   sep=",")

timense<- read.csv("E:/Research/swat/Calibration/figures/timense.csv", header=TRUE, 
               sep=",")

rateandfrense<- read.csv("E:/Research/swat/Calibration/figures/rateandfrense.csv", header=TRUE, 
                sep=",")

library(ggplot2)


#png(filename="C:/Users/ssinnath/Research/swat/manusresults/sensitivity_afterprism.png",width=10, height=10, units="in",res=250)
#cor$Indicator_f = factor(cor$Indicator,levels=c("Annual Volume","Center of Timing","Winter","Spring","Summer","Autumn","October","November","December","January","February","March","April","May","June","July","August","September","1-day min","3-day min","7-day min","30-day min","90-day min","1-day max","3-day max","7-day max","30-day max","90-day max","Base flow", "Zero days", "Date min", "Date max", "Lo pulse#", "Lo pulse L", "Hi pulse#", "Hi pulse L", "Rise rate", "Fall rate", "Reversals"))
#lablabel<-c("Annual Volume", "Center of Timing", "Winter", "Spring", "Summer", "Autumn", "October", "November", "December", "January", "February", "March"," April", "May", "June", "July","August", "September", "1-day min", "3-day min", "7-day min", "30-day min", "90-day min", "1-day max", "3-day max", "7-day max", "30-day max", "90-day max", "Base flow", "Zero days", "Date min", "Date max", "Lo pulse #", "Lo pulse L", "Hi pulse #", "Hi pulse L", "Rise rate", "Fall rate", "Reversals")
p1 <-ggplot(data=wrinse, mapping=aes(x=NSE,y=Indicator))
p1a<-p1 + geom_point(aes(fill = factor(NSE>=0.5)),size=5, shape=21)+ggtitle("a.WRI")+
geom_segment(aes(xend=0,yend=Indicator))+facet_grid(. ~Site)+
  theme_bw()+scale_x_continuous(breaks = seq(-2.5,1, by=0.5), limits=c(-2.5,1))+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                                             axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+theme(legend.title =element_text(size=14))+theme(legend.position='none')+
  theme(legend.text=element_text(size=12))

p2 <-ggplot(data=monthlynse, mapping=aes(x=NSE, y=Indicator))
p2a<-p2 + geom_point(aes(fill = factor(NSE>0.5)),size=5, shape=21)+ggtitle("b.Monthly magnitude")+
geom_segment(aes(xend=0,yend=Indicator))+facet_grid(. ~Site)+
  theme_bw()+scale_x_continuous(breaks = seq(-2.5,1, by=0.5), limits=c(-2.5,1))+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                                             axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+theme(legend.title =element_text(size=14))+theme(legend.position='none')+
  theme(legend.text=element_text(size=12))

p3 <-ggplot(data=magduranse, mapping=aes(x=NSE, y=Indicator))
p3a<-p3 + geom_point(aes(fill = factor(NSE>0.5)),size=5, shape=21)+ggtitle("c.Magnitude and duration of extreme water condition")+
geom_segment(aes(xend=0,yend=Indicator))+facet_grid(. ~Site)+
  theme_bw()+scale_x_continuous(breaks = seq(-2.5,1, by=0.5), limits=c(-2.5,1))+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                                             axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+theme(legend.title =element_text(size=14))+theme(legend.position='none')+
  labs(colour = "P value <0.05") +
  theme(legend.text=element_text(size=12))

p4 <-ggplot(data=timense, mapping=aes(x=NSE, y=Indicator))
p4a<-p4 + geom_point(aes(fill = factor(NSE>0.5)),size=5, shape=21)+ggtitle("d.Time")+
  geom_segment(aes(xend=0,yend=Indicator))+facet_grid(. ~Site)+
  theme_bw()+scale_x_continuous(breaks = seq(-2.5,1, by=0.5), limits=c(-2.5,1))+
  theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
  theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                  axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+theme(legend.title =element_text(size=14))+theme(legend.position='none')+
  labs(colour = "P value <0.05") +
  theme(legend.text=element_text(size=12))
  
  p5 <-ggplot(data=rateandfrense, mapping=aes(x=NSE, y=Indicator))
  p5a<- p5 + geom_point(aes(fill = factor(NSE>0.5)),size=5, shape=21)+ggtitle("e.Rate and Frequency of hydrograph changes")+
  geom_segment(aes(xend=0,yend=Indicator))+facet_grid(. ~Site)+
    theme_bw()+scale_x_continuous(breaks = seq(-2.5,1, by=0.5), limits=c(-2.5,1))+
    theme(strip.background=element_rect(fill="black"))+geom_vline(aes(xintercept=0))+
    theme(strip.text=element_text(color="white", size=14,face="bold"))+ theme(axis.title.x = element_text( colour="black", size=12),
                                                                              axis.text.x  = element_text(angle=90, vjust=0.5, size=12,colour="black"))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                                               axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+theme(legend.text=element_text(size=12))+labs(x = "Correlation coefficient", y = "Indicator")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
    labs(colour = "P value <0.05") +
    theme(legend.text=element_text(size=12))  
#dev.off()

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
  
  
  # Multiple plot function
  #
  # ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
  # - cols:   Number of columns in layout
  # - layout: A matrix specifying the layout. If present, 'cols' is ignored.
  #
  # If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
  # then plot 1 will go in the upper left, 2 will go in the upper right, and
  # 3 will go all the way across the bottom.
  #
  multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
    library(grid)
    
    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)
    
    numPlots = length(plots)
    
    # If layout is NULL, then use 'cols' to determine layout
    if (is.null(layout)) {
      # Make the panel
      # ncol: Number of columns of plots
      # nrow: Number of rows needed, calculated from # of cols
      layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                       ncol = cols, nrow = ceiling(numPlots/cols))
    }
    
    if (numPlots==1) {
      print(plots[[1]])
      
    } else {
      # Set up the page
      grid.newpage()
      pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
      
      # Make each plot, in the correct location
      for (i in 1:numPlots) {
        # Get the i,j matrix positions of the regions that contain this subplot
        matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
        
        print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                        layout.pos.col = matchidx$col))
      }
    }
  }
  
  library(gridExtra)
  arrangeGrob(f1.1, f1.2, f1.3)
  
  gA <- ggplotGrob(p1a)
  gB <- ggplotGrob(p2a)
  maxWidth = grid::unit.pmax(gA$widths[2:5], gB$widths[2:5])
  gA$widths[2:5] <- as.list(maxWidth)
  gB$widths[2:5] <- as.list(maxWidth)
  grid.arrange(gA, gB, ncol=1)
  
  gB <- ggplotGrob(p2a)
  gC <- ggplotGrob(p3a)
  gD <- ggplotGrob(p4a)
  maxWidth = grid::unit.pmax(gC$widths[2:5], gD$widths[2:5])
  gC$widths[2:5] <- as.list(maxWidth)
  gD$widths[2:5] <- as.list(maxWidth)
  grid.arrange(gC, gD, ncol=1)
  
  gC <- ggplotGrob(p3a)
  gE <- ggplotGrob(p5a)
  maxWidth = grid::unit.pmax(gC$widths[2:5], gE$widths[2:5])
  gC$widths[2:5] <- as.list(maxWidth)
  gE$widths[2:5] <- as.list(maxWidth)
  grid.arrange(gC, gE, ncol=1)
  
  
  
  
  
  
  
  
  
  
  
  multiplot(p1a, p2a)
  multiplot(p3a, p4a)
  p5a