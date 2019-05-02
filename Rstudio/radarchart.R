#install.packages("fmsb")
install.packages("ggradar")
# Library
library(fmsb)
dyy <- read.csv("C:/Users/ssinnath/Research/swat/manusresults/Calibration/dyy.csv", header=TRUE, 
                  sep=",")
#dy=rbind(rep(9,0) ,rep(0,1), dyy)
colnames(dyy)<-c("1988","1989","1990","1991","1994","1997","2000","2002","2003","2004","2005","2006","2011","2012")
colors_border=c("deepskyblue", "black","red","blue","green","darkgoldenrod")
#colors_in=c( "red", "blue","green","aquamarine","cadetblue","burlywood")

radarchart(dyy  , axistype=1 , 
           pcol=colors_border,plwd=2 , plty=1,
           cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8, 
           caxislabels=c(5, 30, 55, 80,105),
           vlcex=0.8,
           na.itp=FALSE)


legend(-1.5,1,
       legend=c("Observed","GHCN_D","DAYMET","NLDAS","GLDAS","PRISM"),
       pch=c(16,16),
       col=c("deepskyblue", "black","red","blue","green","darkgoldenrod"),
       lty=c(1,1))

wy <- read.csv("C:/Users/ssinnath/Research/swat/manusresults/Calibration/wyy.csv", header=TRUE, 
               sep=",")

colnames(wy)<-c("1992","1993","1995","1996","1998","1999","2001","2007","2008","2009","2010")
colors_border=c("deepskyblue", "black","red","blue","green","darkgoldenrod")
radarchart(wy  , axistype=1 , 
           pcol=colors_border,plwd=2 , plty=1,
           cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8, 
           caxislabels=c(55, 110, 165, 220,275),
           vlcex=0.8,
           na.itp=FALSE)