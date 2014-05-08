require(rattle)
require(xlsx)
require(dplyr)
require(plyr)
require(stringr)
#assumes it is called from 
setwd("~/coderepo/data-analysis-projects/general-healthcare-india/");

columnClasses <- c("numeric", "character","numeric","numeric","numeric","numeric","numeric","numeric")
no_of_sc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=1, colClasses=columnClasses)
no_of_phc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=2, colClasses=columnClasses)
no_of_chc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=3, colClasses=columnClasses)
pop_density <- read.csv("data/raw-data/pop_density_2011 - Sheet1.csv")
names(no_of_chc_raw_data) <- normVarNames(names(no_of_chc_raw_data))
names(no_of_phc_raw_data) <- normVarNames(names(no_of_phc_raw_data))
names(no_of_sc_raw_data) <- normVarNames(names(no_of_sc_raw_data))
names(pop_density) <- normVarNames(names(pop_density))
pop_density$state_and_ut <- llply(pop_density$state_and_ut, function(x) str_trim(str_split(x, "#")[[1]][1], side="both"))
pop_density$state_and_ut[25] <- c("Delhi")
pop_density$state_and_ut[26] <- c("Odisha")
pop_density$pop_density <- str_replace_all(pop_density$pop_density, "[[:punct:]]", "")
shortfall_data <- read.csv("data/raw-data/Shortfall_In_Health_Infra_As_Per_2011_Population_Prov_In_India_2.csv")
names(shortfall_data) <- normVarNames(names(shortfall_data))
setwd("~/coderepo/data-analysis-projects/general-healthcare-india/");
