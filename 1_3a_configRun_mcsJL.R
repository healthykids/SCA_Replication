setwd("/Volumes/GoogleDrive/My\ Drive/Twenge/OrbenXS/TeensTech/")
rm(list = ls(all = TRUE))


# CONFIG 2: Orben Cont
Mod<-3
Scales<-1
Items<-0
LimitedControls<- 0
SelfHarm<-0
IVtype <- 0
combineSDQ <- 1
PrintGraphs<-0
Scripted<-1
Sex<-0
RunNum<-1
ModLabel <- "Config2"
source("1_3b_parameters_mcsJL.R")
Sex <- 1
source("1_3b_parameters_mcsJL.R")


#CONFIG 3: Demo controls
rm(list = ls(all = TRUE))
Mod<-3
Scales<-1
Items<-0
LimitedControls<- 1 #demo controls
SelfHarm<-0
IVtype <- 0
combineSDQ <-1
PrintGraphs<-0
#Scripted<-1
Sex<-0
RunNum<-1
ModLabel <- "Config3"
source("1_3b_parameters_mcsJL.R")
Sex <- 1
source("1_3b_parameters_mcsJL.R")


