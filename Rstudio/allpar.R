cn<- read.table("C:/Users/ssinnath/Research/swat/manusresults/mike_analysis/cn.csv", header=TRUE, 
                 sep=",")
library(reshape)
cnm  <- melt(cn,id.var=1)
attach(cnm)
library(ggplot2)
ggplot(data=cnm, aes(x=CN2.mgt, y=value, shape=variable,color=variable)) +
  geom_point(alpha = 0.2)+stat_smooth()+
  theme_bw()

all<- read.table("C:/Users/ssinnath/Research/swat/manusresults/mike_analysis/all.csv", header=TRUE, 
                    sep=",")
library(ggplot2)
attach(all)
ggplot(data=all, aes(x=Range, y=NSE, shape=Precip, color=Precip)) +geom_point(alpha = 0.2)+stat_smooth()+ 
  facet_wrap( ~ Parameter, scales = "free",ncol=7)+theme_bw()+theme(legend.position="bottom")
  #scale_y_continuous(breaks = seq(0.4,0.7, by=.1), limits=c(0.4,.7))
#
tiff(filename="C:/Users/ssinnath/Research/swat/manusresults/Figure7.tiff",width=10, height=10, units="in",res=300)
ggplot(data=all, aes(x=Range, y=NSE, color=Precip)) +geom_point(alpha = 0.1)+stat_smooth(se=FALSE)+ scale_color_brewer(palette="Set1")+
  facet_wrap( ~ Parameter, scales = "free",ncol=7)+theme_bw()+theme(legend.position="bottom")#,size=2
dev.off()
#scale_y_continuous(breaks = seq(0.4,0.7, by=.1), limits=c(0.4,.7))
#


ggplot(data=all, aes(x=Range, y=NSE, shape=Precip, color=Precip))+
  geom_point(alpha = 0.1)+stat_smooth(se=FALSE)+
  facet_wrap( ~ Parameter, scales = "free",ncol=7)+theme_bw()+theme(legend.position="bottom")+scale_y_continuous(breaks = seq(0.4,0.7, by=.1), limits=c(0.4,.7))
#stat_smooth(method = "glm", formula = y~x, family = gaussian(link = 'log'))
statnse<- read.table("C:/Users/ssinnath/Research/swat/manusresults/mike_analysis/nse.csv", header=TRUE, 
                       sep=",")
attach(statnse)
# Find the mean of each group
library(plyr)
library(ggplot2)
cdat <- ddply(statnse, ~Source , summarise, rating.mean=median(NSE))
cdat
t.test(GHCN_D$NSE,NLDAS$NSE)
#plot pdfs
ggplot(statnse, aes(NSE, fill = Source)) + geom_density(alpha = 0.2,adjust=6)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=14))+
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "NSE", y = "Density")+
  theme(legend.title=element_blank())+ theme(legend.text=element_text(size=14))+
  geom_vline(data=cdat, aes(xintercept=rating.mean,  colour=Source),
             linetype="dashed", size=1)

ggplot(statnse, aes(NSE, fill = Source)) + geom_density(alpha = 0.2)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=14))+
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "NSE", y = "Density")+
  theme(legend.title=element_blank())+ theme(legend.text=element_text(size=14))+
  geom_vline(data=cdat, aes(xintercept=rating.mean,  colour=Source),
             linetype="dashed", size=1)
#plot histogram
ggplot(statnse, aes(NSE, fill = Source)) + geom_histogram(alpha = 0.5, aes(y = ..density..), position = 'identity',col=I("black"))+theme_bw()+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  labs(x = "NSE", y = "Density")+
  theme(legend.title=element_blank())+
  geom_vline(data=cdat, aes(xintercept=rating.mean,  colour=Source),
             linetype="dashed", size=1)
ggplot(statnse, aes(NSE, fill = Source)) + geom_histogram(alpha = 0.5,position = 'identity',col=I("black"))+theme_bw()+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=12),axis.text.x  = element_text(angle=360, vjust=0.5, size=12,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=12),axis.text.y  = element_text(vjust=0.5, size=12,colour="black"))+
  labs(x = "NSE", y = "Frequency")+
  theme(legend.title=element_blank())
number_ticks <- function(n) {function(limits) pretty(limits, n)}
statnse$Source_f = factor(statnse$Source, levels=c('GHCN-D','DAYMET','NLDAS',"GLDAS","PRISM"))
ggplot(statnse, aes(x=Source_f,y=NSE, fill = Source)) + geom_boxplot()+ scale_y_continuous(breaks = number_ticks(n = 10))+
  guides(fill=FALSE) + facet_grid( Period ~., scales = "free_y")+theme_bw()+theme(legend.position="bottom")+
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "Precipitation Sources", y = "NSE")+
  theme(legend.title=element_blank())
res.aov <- aov(NSE ~ Source, data = statnse)
summary(res.aov)
TukeyHSD(res.aov)
h <- hist(s, breaks = 10, density = 10,
          col = "lightgray", xlab = "Accuracy", main = "Overall") 
xfit <- seq(min(statnse), max(statnse), length = 40) 
yfit <- dnorm(xfit, mean = mean(statnse), sd = sd(g)) 
yfit <- yfit * diff(h$mids[1:2]) * length(g) 

lines(xfit, yfit, col = "black", lwd = 2)


#########################Validation####################################################
allval<- read.table("C:/Users/ssinnath/Research/swat/manusresults/mike_analysis/all_val.csv", header=TRUE, 
                 sep=",")
library(ggplot2)
attach(all)

ggplot(data=allval, aes(x=Range, y=NSE, shape=Precip, color=Precip)) +
  geom_point(alpha = 0.3)+stat_smooth(se=FALSE)+
  facet_wrap( ~ Parameter, scales = "free",ncol=7)+theme_bw()+ theme(legend.position="bottom")+
  scale_y_continuous(breaks = seq(-2.0,2, by=1), limits=c(-2.0,2))
#stat_smooth(method = "glm", formula = y~x, family = gaussian(link = 'log'))

ggplot(statnse, aes(x=Source,y=NSE, fill = Source)) + geom_boxplot()+ 
  guides(fill=FALSE) + 
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "Precipitation Sources", y = "NSE")+
  theme(legend.title=element_blank())

nse<- read.table("C:/Users/ssinnath/Research/swat/manusresults/mike_analysis/nse.csv", header=TRUE, 
                     sep=",")
attach(valstatnse)
# Find the mean of each group
library(plyr)
library(ggplot2)
cdat <- ddply(valstatnse, ~Source , summarise, rating.mean=median(NSE))
res.aov <- aov(NSE ~ Source, data = valstatnse)
summary(res.aov)
TukeyHSD(res.aov)
#plot pdfs
ggplot(valstatnse, aes(NSE, fill = Source)) + geom_density(alpha = 0.2,adjust=6)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=14))+
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "NSE", y = "Density")+
  theme(legend.title=element_blank())+ theme(legend.text=element_text(size=14))+
  geom_vline(data=cdat, aes(xintercept=rating.mean,  colour=Source),
             linetype="dashed", size=1)


tiff(filename="C:/Users/ssinnath/Research/swat/weather/comparsion_new/fig.tiff",width=10, height=6, units="in",res=300)

ggplot(nse, aes(x=Source,y=NSE, fill = Source)) + geom_boxplot()+ facet_wrap(~ Period, scales="free")+
  guides(fill=FALSE) + 
  stat_summary(fun.y=mean, geom="point", shape=5, size=4)+theme_bw()+
  theme(strip.text=element_text(color="Black", size=12))+ 
  theme(axis.title.x = element_text(colour="black", size=14),axis.text.x  = element_text(angle=360, vjust=0.5, size=14,colour="black"))+
  theme(axis.title.y = element_text(colour="black", size=14),axis.text.y  = element_text(vjust=0.5, size=14,colour="black"))+
  labs(x = "Precipitation Sources", y = "NSE")+
  theme(legend.title=element_blank())

dev.off()
ggsave(fig1.tiff, dpi = 300)
Arguments
