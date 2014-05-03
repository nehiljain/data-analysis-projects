require(rattle)
require(xlsx)

setwd("~/coderepo/data-analysis-projects/general-healthcare-india/code/r/");
no_of_chc_raw_data$govt_effort <- no_of_chc_raw_data$eleventh_plan_as_on_march_2011_2007_2012 - no_of_chc_raw_data$tenth_plan_2002_2007
no_of_phc_raw_data$govt_effort <- no_of_phc_raw_data$eleventh_plan_as_on_march_2011_2007_2012 - no_of_phc_raw_data$tenth_plan_2002_2007
no_of_sc_raw_data$govt_effort <- no_of_sc_raw_data$eleventh_plan_as_on_march_2011_2007_2012 - no_of_sc_raw_data$tenth_plan_2002_2007

shortfall_data$sub_centres_shortfall <- shortfall_data$sub_centres_required - shortfall_data$sub_centres_in_position
shortfall_data$primary_health_centres_phcs_shortfall <- shortfall_data$primary_health_centres_phcs_required - shortfall_data$primary_health_centres_phcs_in_position
shortfall_data$community_health_centres_chcs_shortfall <- shortfall_data$community_health_centres_chcs_required - shortfall_data$community_health_centres_chcs_in_position


analysis_data <- cbind( shortfall_data$sub_centres_shortfall, 
                        no_of_sc_raw_data$govt_effort, 
                        shortfall_data$primary_health_centres_phcs_shortfall, 
                        no_of_phc_raw_data$govt_effort,
                        shortfall_data$community_health_centres_chcs_shortfall, 
                        no_of_chc_raw_data$govt_effort)

analysis_data <- as.data.frame(analysis_data)
names(analysis_data) <- c("sc_shortfall", "sc_govt_effort", 
                          "phc_shortfall", "phc_govt_effort",
                          "chc_shortfall", "chc_govt_effort")

analysis_data$state_and_ut <- shortfall_data$state_ut

# Removing all india
analysis_data <- analysis_data %.%
  filter(state_and_ut != c("All India Total"))

#Merge the pop density
analysis_data <- merge(analysis_data, pop_density, by="state_and_ut")
analysis_data$pop_density <- as.numeric(analysis_data$pop_density)
analysis_data$sc_govt_effect <-  (analysis_data$sc_govt_effort - analysis_data$sc_shortfall)/analysis_data$pop_density
analysis_data$phc_govt_effect <-  (analysis_data$phc_govt_effort - analysis_data$phc_shortfall)/analysis_data$pop_density
analysis_data$chc_govt_effect <-  (analysis_data$chc_govt_effort - analysis_data$chc_shortfall)/analysis_data$pop_density


write.csv(analysis_data,file="../../data/final-data/statewise_healthcare_infrastructure_analysis.csv")
save(analysis_data, file="../../data/final-data/statewise_healthcare_infrastructure_analysis.Rda")
setwd("~/coderepo/data-analysis-projects/general-healthcare-india/");
