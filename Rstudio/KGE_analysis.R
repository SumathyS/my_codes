##Installpackage hydroGOF
#install.packages("hydroGOF")
##Loading the hydroGOF library, which contains data and functions used in this analysis
library(hydroGOF)
cal_sim <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/annual_afterpar_cal_flow.csv", header=TRUE, 
                   sep=",")
attach(cal_sim)
#calculate Kling-Gupta Efficiency (KGE) for station 18
KGE(NCDC18corr,Obs18)
KGE(Daymet18,Obs18)
KGE(NLDAS18,Obs18)
KGE(GLDAS18,Obs18)
#calculate Kling-Gupta Efficiency (KGE) for station 39
KGE(NCDC39,Obs39)
KGE(Daymet39,Obs39)
KGE(NLDAS39,Obs39)
KGE(GLDAS39,Obs39)
#calculate Kling-Gupta Efficiency (KGE) for reservoir
KGE(NCDCres,Obsres)
KGE(Daymetres,Obsres)
KGE(NLDASres,Obsres)
KGE(GLDASres,Obsres)

val_sim <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/annual_afterpar_val_flow.csv", header=TRUE, 
                      sep=",")
attach(val_sim)
#calculate Kling-Gupta Efficiency (KGE) for station 18 for validation period
KGE(vNCDC18,vObs18)
KGE(vDaymet18,vObs18)
KGE(vNLDAS18,vObs18)
KGE(vGLDAS18,vObs18)
#calculate Kling-Gupta Efficiency (KGE) for station 39 for validation period
KGE(vNCDC39,vObs39)
KGE(vDaymet39,vObs39)
KGE(vNLDAS39,vObs39)
KGE(vGLDAS39,vObs39)
#calculate Kling-Gupta Efficiency (KGE) for reservoir for validation period
KGE(vNCDCres,vObsres)
KGE(vDaymetres,vObsres)
KGE(vNLDASres,vObsres)
KGE(vGLDASres,vObsres)

#Plotting the graphical comparison of 'obs' against 'sim', along with the
#numeric goodness-of-fit measures for the daily and monthly time series
sim <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/annual_afterpar_flow.csv", header=TRUE, 
                      sep=",")
sim_m <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/monthly_afterpar_flow.csv", header=TRUE, 
                  sep=",")
sim_m_d <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/monthly_afterpar_flow_diffcal.csv", header=TRUE, 
                    sep=",")
attach(sim_m_d)


ggof(vNCDC18corr,vObs18)
ggof(NCDC18corr,Obs18)
ggof(vDaymet18,vObs18)
ggof(Daymet18,Obs18)
ggof(vNLDAS18,vObs18)
ggof(NLDAS18,Obs18)
ggof(GLDAS18,Obs18)
ggof(vPRISM18,vObs18)
ggof(PRISM18,Obs18)
ggof(vNCDC18,vObs18)
ggof(NCDC18,Obs18)

ggof(vNCDC39corr,vObs39)
ggof(NCDC39corr,Obs39)
ggof(vDaymet39,vObs39)
ggof(Daymet39,Obs39)
ggof(vNLDAS39,vObs39)
ggof(NLDAS39,Obs39)
ggof(vGLDAS39,vObs39)
ggof(GLDAS39,Obs39)
ggof(vPRISM39,vObs39)
ggof(PRISM39,Obs39)
ggof(vNCDC39,vObs39)
ggof(NCDC39,Obs39)

ggof(vNCDCrescorr,vObsres)
ggof(NCDCrescorr,Obsres)
ggof(vDaymetres,vObsres)
ggof(Daymetres,Obsres)
ggof(vNLDASres,vObsres)
ggof(NLDASres,Obsres)
ggof(vGLDASres,vObsres)
ggof(GLDASres,Obsres)
ggof(vPRISMres,vObsres)
ggof(PRISMres,Obsres)
ggof(vNCDCres,vObsres)
ggof(NCDCres,Obsres)
#line graph for calibration site1
cal_sim1 <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/cal_flow_chart.csv", header=TRUE, 
                      sep=",")
attach(cal_sim1)
library(ggplot2)#import library
library(scales) # to access breaks/formatting functions


cal_sim1$Month <- as.Date(cal_sim1$Month, "%m/%d/%Y")
ggplot(cal_sim1, aes(x=Month, y=Flow, colour=Precipitation.Source, group=Precipitation.Source)) +
  geom_line(size=1) + facet_wrap(~Site, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('2001-01-01','2013-01-01')))+
  labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="black", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
                                                                    axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                      axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
  theme(legend.title=element_blank())+
  theme(legend.text=element_text(size=12))

# cal_sim1$Site_f = factor(cal_sim1$Site, levels=c('Delaware River near Muscotah','Delaware River at Perry Lake','Reservoir'))
# 
# ggplot(cal_sim1, aes(x=Month, y=Flow, colour=Precipitation.Source, group=Precipitation.Source)) +
#   geom_line(size=1) + facet_wrap(~Site_f, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('2001-01-01','2013-01-01')))+
#   labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
#   theme_bw()+
#   theme(strip.background=element_rect(fill="grey"))+
#   theme(strip.text=element_text(color="black", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
#                                                                             axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
#                                                                                                                                                axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
#   theme(legend.title=element_blank())+
#   theme(legend.text=element_text(size=12))

val_sim1 <- read.table("C:/Users/ssinnath/Research/swat/manusresults/Calibration/val_flow_chart.csv", header=TRUE, 
                       sep=",")
attach(val_sim1)
library(ggplot2)#import library
library(scales) # to access breaks/formatting functions


val_sim1$Month <- as.Date(val_sim1$Month, "%m/%d/%Y")
ggplot(val_sim1, aes(x=Month, y=Flow, colour=Precipitation.Source, group=Precipitation.Source)) +
  geom_line(size=1) + facet_wrap(~Site, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('1988-01-01','2000-01-01')))+
  labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="black", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                               axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
  theme(legend.title=element_blank())+
  theme(legend.text=element_text(size=12))
# 
# val_sim1$Site_f = factor(val_sim1$Site, levels=c('Delaware River near Muscotah','Delaware River at Perry Lake','Reservoir'))
# ggplot(val_sim1, aes(x=Month, y=Flow, colour=Precipitation.Source, group=Precipitation.Source)) +
#   geom_line(size=1) + facet_wrap(~Site_f, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('1988-01-01','2000-01-01')))+
#   labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
#   theme_bw()+
#   theme(strip.background=element_rect(fill="grey"))+
#   theme(strip.text=element_text(color="black", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
#                                                                             axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
#                                                                                                                                                axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
#   theme(legend.title=element_blank())+
#   theme(legend.text=element_text(size=12))
###geom_ribbon################################################################################################
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
val_sim1$Month <- as.Date(val_sim1$Month, "%m/%d/%Y")
p1<-ggplot(val_sim1, aes(x=Month, y=Flow, fill=Precipitation.Source, group=Precipitation.Source)) +
  geom_ribbon(aes(ymax=Flow,ymin=0),alpha=0.6) + facet_wrap(~Site, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('1988-01-01','2000-01-01')))+
  labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+
  theme(strip.text=element_text(color="white", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                               axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
  theme(legend.title=element_blank())+
  theme(legend.text=element_text(size=12))

cal_sim1$Month <- as.Date(cal_sim1$Month, "%m/%d/%Y")
p2<-ggplot(cal_sim1, aes(x=Month, y=Flow, fill=Precipitation.Source, group=Precipitation.Source)) +
  geom_ribbon(aes(ymax=Flow,ymin=0),alpha=0.5) + facet_wrap(~Site, nrow = 3)+ scale_x_date(date_breaks = "24 month", labels = date_format("%m/%Y"),limits = as.Date(c('2001-01-01','2013-01-01')))+
  labs(x = "Month", y = "Discharge (cms)",color="Precipitation.Source")+
  theme_bw()+
  theme(strip.background=element_rect(fill="black"))+
  theme(strip.text=element_text(color="white", face="bold",size=12))+ theme(axis.title.x = element_text(face="bold", colour="black", size=12),
                                                                            axis.text.x  = element_text(angle=360, vjust=0.5, size=12))+ theme(axis.title.y = element_text(face="bold", colour="black", size=12),
                                                                                                                                               axis.text.y  = element_text(vjust=0.5, size=12))+ theme(legend.position="bottom")+
  theme(legend.title=element_blank())+
  theme(legend.text=element_text(size=12))
multiplot(p2, p1,cols=2)
