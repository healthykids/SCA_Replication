##########################################################################################
# Specification Curve Analysis and Digital Technology Use
# R-Script 3.3: MCS Analyse Specification Curves
# Version 1.JL
##########################################################################################
library(tidyverse)
#################################################
# Bind Both
#################################################
load("2_3_sca_mcs_results_cm.rda")
load("2_3_sca_mcs_results_pr.rda")

results_mcs_sca_cm$respondent <-
  rep("Cohort Member", nrow(results_mcs_sca_cm))
results_mcs_sca_pr$respondent <-
  rep("Parent", nrow(results_mcs_sca_pr))

results_mcs_sca_total <- rbind(results_mcs_sca_cm, results_mcs_sca_pr)
save(results_mcs_sca_total, file = "2_3_sca_mcs_results.rda")
load("2_3_sca_mcs_results.rda")

####################################################################################
# Number of specifications
####################################################################################
nrow(results_mcs_sca_total)

####################################################################################
# Median effects table 2
# total, separate x variables, controls/no controls (calls eta-squared "effect size" and stad slop "effect")
# %>% pipes in anad makes nesting run. makes code more transparent? it is in dyplr
####################################################################################
results_mcs_sca_total %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE)) # are the stats pulled from same row?

results_mcs_sca_total %>% filter(respondent == "Parent") %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE))
results_mcs_sca_total %>% filter(respondent == "Cohort Member") %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE))

a <-results_mcs_sca_total %>% filter(controls == "Controls") %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE))
b <-results_mcs_sca_total %>% filter(controls == "No Controls") %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE))
c<-results_mcs_sca_total %>% filter(x_variable == "fcsome00r") %>% summarise(median_effect = median(effect, na.rm = TRUE), median_effectsize = median(rsqrd, na.rm = TRUE))
labels <- c("Controls",
            "No Controls"
            )
labels <- unlist(labels)
socmed <- rbind(a,b)
socmed$x_varname <- labels
rm(a,b)

####################################################################################
### Table 2 Components (return to get the med for even number of obs)
####################################################################################
table2<-socmed #init table 2  v2


#table2 <- socmed
table2$run<-RunNum
table2$CodeVersion<-code_version
table2$IV<-IVtypeLabel #only used for model 3
table2$ItemsLabel<-ItemsLabel
table2$ScalesLabel<-ScalesLabel
table2$cont<-ControlLabel
table2$sex <- SexLabel
table2$model <- ModLabel
table2$JeanSDQ <- "SDQ is Total Score"
table2$age_control <- "age_in_control"
table2$AnlsVers<-AnlsVers
table2 <- table2 %>%
  rename(
    median_slope = median_effect,
    median_n2 = median_effectsize
  )

table2 <- table2[c("sex","AnlsVers","IV","median_slope","median_n2","x_varname","cont",  "model","run","CodeVersion","ItemsLabel","ScalesLabel", "age_control")]

write.table(table2, "mcs.comparison_vars.csv", sep = ",", col.names = !file.exists("table2.csv"), append = T)

print("End 3_3_sca_analyse_mcs")