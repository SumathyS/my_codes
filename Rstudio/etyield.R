#load data
ety<- read.csv("E:/Research/swat/Calibration/figures/etyield.csv", header=TRUE, 
               sep=",")

library(ggplot2)
attach(ety)


  ggplot(data = ety, aes(x =ET, y = Yield,fill= Crop)) +
  geom_point(size = 3,shape = 21)+facet_grid(.~Crop )+ geom_smooth(method=lm,linetype = "dashed", se=FALSE,color="Black")+ theme_bw()+
  scale_x_continuous(breaks = seq(500, 800, by=100), limits=c(500,800))+
    theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  labs(x = "ET (mm)", y = "Grain yield (Mg/ha)")+ theme(legend.position="none")

p2 <-ggplot(data = soy, aes(x = Nass.Reported, y = SWAT.Predicted,fill= County)) +
  geom_point(size = 3,shape = 21)+facet_grid(.~County )+ geom_smooth(method=lm,linetype = "dashed", se=FALSE,color="black")+ theme_bw()+
  scale_y_continuous(breaks = seq(1, 3, by=1), limits=c(1,3))+
  +
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  labs(x = "Nass reported grain yield (Mg/ha)", y = "SWAT predicted grain yield (Mg/ha) ")+ theme(legend.position="none")

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
multiplot(p1, p2)
