#load data
monthlyflow<- read.csv("E:/Research/swat/Calibration/figures/allmonthly.csv", header=TRUE, 
               sep=",")
library(ggplot2)
# install.packages('xts')
# library(xts)
my_date_format <- function()
{
  function(x)
  {
    m <- format(x,"%b")
    y <- format(x,"%Y")
    ifelse(duplicated(y),m,paste(m,y))
  }
}
monthlyflow$Time<-as.Date(monthlyflow$Time, format="%m/%d/%Y")
png(filename="E:/Research/swat/Calibration/figures/monthly.png",width=10, height=10, units="in",res=250)

monthlyflow$Source_f = factor(monthlyflow$Station, levels=c('Muscotah','Lake Outlet','Perry'))
ggplot(data=monthlyflow, aes(x=Time, y=flow, colour=Type,group=Type)) +
  geom_line()+ scale_x_date(date_breaks = "24 month", date_minor_breaks = "1 month", date_labels = "%Y") +
  facet_grid(Source_f ~. )+
  theme_bw()+
  theme(strip.background=element_rect(fill="grey"))+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  theme(legend.text=element_text(size=12))+labs(x = "Time", y = "Annual average daily streamflow (m^3/sec) ")+theme(legend.title =element_text(size=14))+theme(legend.position='bottom')+
  theme(legend.text=element_text(size=12))+ theme(legend.title=element_blank())
#plot(as.xts(PCP), major.format = "%Y-%m")
dev.off()