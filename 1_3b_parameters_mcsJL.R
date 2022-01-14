##LABELS
code_version<-paste("v1.JL_",Sys.Date(), sep="")



# 2.2.2 set up the labels for the sex
if(Sex == 0 || Sex ==1){
  SexLabel<-dplyr:: recode(Sex,'0'='girls', '1'="boys") #Create Lables
} else {
  SexLabel<-"combined"
}

# if(Age ==1){
#   AgeLabel <- "Included"
# }else {
#   AgeLabel <- "NotIncluded"
# }

# 2.2.3 set up the labels for marker of item inclusion
if(Items==0) {
  ItemsLabel<-"NoItems"
} else if (Items==1){
  ItemsLabel<-"Items"
}

# 2.2.4 set up labels for indicator of scale adjustments
if(Scales==0) {
  ScalesLabel<-"NoNewScls"
  if (SelfHarm==1){ #add selfharm indicator
    ScalesLabel<-paste(ScalesLabel,"W_Slf-hrm",sep="")
  }
} else if (Scales==1){
  ScalesLabel<-"Scales"

  if (SelfHarm==1){ #add selfharm indicator
    ScalesLabel<-paste(ScalesLabel,"W_Slf-hrm",sep="")
  }
}



###########################################
### 2.3 Modify the analysis for SCA Run ###
###########################################

### 2.3.0
if (Mod==1) {

  ### 2.3.0.1 Label constant features of this SCA configurtion
  AnlsVers<-"Orben_Model"
  print(Mod)
  SexLabel<-"Combined"

} else {

  if (Mod==2) {
    ###select the subset to be used
    AnlsVers<-"SexSpecific"
    print(Mod)

  } else {
    if (Mod==3) {
      ###select the subset to be used
      AnlsVers<-"SocialMediaInvestigation_SexSpec"
      SexLabel

      print(Mod)

    }
  }
}



#### Label the Limited IV set
if (IVtype == 0) { # limit to just social media
  IVtypeLabel <- "Config3:SocMedia"
}
if (IVtype == 1) { # limit to just social media
  IVtypeLabel <- "Config3:WeekdayTV"
}

if (IVtype == 2) { # limit to just social media
  IVtypeLabel <- "Config3:eGames"
}

if (IVtype == 4) { # limit to just social media
  IVtypeLabel <- "Config3:Internet"
}
if (Mod<3) {
  IVtypeLabel <- "AllExposures"
}

###

# 2.3.1 Set what adjustments will be made
if (LimitedControls==1){ #was the parameter set to limit the controls?
  ControlLabel<-"Demo's Controls" # mark the analysis as limited to the demographic controls
}
if (LimitedControls==0){ #was the parameter set to limit the controls?
  ControlLabel<-"Orben Controls" # mark the analysis as using the original controls of Orben
}

source("2_3_sca_mcsJL.R")
source("3_3_sca_analyse_mcsJL.R")
