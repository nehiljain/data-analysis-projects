require(rattle)
require(xlsx)
require(dplyr)
require(plyr)
require(stringr)
#assumes it is called from 
# setwd("~/coderepo/data-analysis-projects/general-healthcare-india/");

columnClasses <- c("numeric", "character","numeric","numeric","numeric","numeric","numeric","numeric")
no_of_sc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=1, colClasses=columnClasses)
no_of_phc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=2, colClasses=columnClasses)
no_of_chc_raw_data <- read.xlsx2("data/raw-data/Number_Of_SCs_PHCs_CHCs_During_Five_Year_Plans-1.xls", sheetIndex=3, colClasses=columnClasses)

names(no_of_chc_raw_data) <- normVarNames(names(no_of_chc_raw_data))
names(no_of_phc_raw_data) <- normVarNames(names(no_of_phc_raw_data))
names(no_of_sc_raw_data) <- normVarNames(names(no_of_sc_raw_data))

shortfall_data <- read.csv("data/raw-data/Shortfall_In_Health_Infra_As_Per_2011_Population_Prov_In_India_2.csv")
names(shortfall_data) <- normVarNames(names(shortfall_data))


save.image(file="inputRawData.RData")


# setwd("~/coderepo/data-analysis-projects/general-healthcare-india/");
