#Preprocessing script. This needs improvement 
#because of the hard coded elements which feel inefficient.


#DALYs table cleaning.. This is a fragile HARD CODED part.
india.chd.data.DALYs$na <- NULL
india.chd.data.DALYs <- india.chd.data.DALYs[-1,]
india.chd.data.DALYs <- india.chd.data.DALYs[1:27,]
dalys_population <- india.chd.data.DALYs[1,5]
india.chd.data.DALYs <- india.chd.data.DALYs[-1,]

#Years.Lost table cleaning.. This is a fragile HARD CODED part.
india.chd.data.Years.Lost <- india.chd.data.Years.Lost[1:14,]
india_years_lost <- india.chd.data.Years.Lost[1:5,]
india.chd.data.Years.Lost <- india.chd.data.Years.Lost[6:14,]

#Prevelance table cleaning.. This is a fragile HARD CODED part.
india.chd.data.Prevalence <- india.chd.data.Prevalence[1:25,]
india.chd.data.Prevalence.Rate <- india.chd.data.Prevalence[1:10,]
india.chd.data.Prevalence.Number <- india.chd.data.Prevalence[11:25,]

#Deaths table cleaning.. This is a fragile HARD CODED part.
india.chd.data.Deaths <- india.chd.data.Deaths[1:28,]
names(india.chd.data.Deaths) <- c ("gbd code", "category number", " gbd cause", 
                                   "gbd sub case", 
                                   "person 0 14", "person 15 59", "person 60 above", 
                                   "males 0 14", "males 15 59" , "males 60 above", 
                                   "females 0 14", "females 15 59", "females 60 above")
india.chd.data.Deaths <- india.chd.data.Deaths[-c(1,2),]



#setting the names right
names(india.chd.data.DALYs) <- normVarNames(names(india.chd.data.DALYs))
names(india.chd.data.Deaths) <- normVarNames(names(india.chd.data.Deaths))
names(india.chd.data.Prevalence) <- normVarNames(names(india.chd.data.Prevalence))
names(india.chd.data.Years.Lost) <- normVarNames(names(india.chd.data.Years.Lost))

india.chd.data.Deaths$category_number <- as.character(india.chd.data.Deaths$category_number)
india.chd.data.Deaths$gbd_cause <- as.character(india.chd.data.Deaths$gbd_cause)
india.chd.data.Deaths$gbd_sub_case <- as.character(india.chd.data.Deaths$gbd_sub_case)

number <- c("don't know")
for (i in 1:length(india.chd.data.Deaths$category_number)) {
  

  if (is.na(india.chd.data.Deaths$category_number[i])) {
    india.chd.data.Deaths$category_number[i] <- number
  } 
  else {
    number <- india.chd.data.Deaths$category_number[i]
  }
  if (!is.na(india.chd.data.Deaths$gbd_sub_case[i])) {
    india.chd.data.Deaths$gbd_cause[i] <- india.chd.data.Deaths$gbd_sub_case[i]
  }
}
india.chd.data.Deaths <- melt(india.chd.data.Deaths, id.vars=c("gbd_code", "category_number", "gbd_cause", 
                                               "gbd_sub_case"))
india.chd.data.Deaths$variable <- as.character(india.chd.data.Deaths$variable)

india.chd.data.Deaths$gender <- lapply(india.chd.data.Deaths$variable, function(x) str_split(x, "_", n=2)[[1]][1])
india.chd.data.Deaths$age <- lapply(india.chd.data.Deaths$variable, function(x) str_split(x, "_", n=2)[[1]][2])

india.chd.data.Deaths$gender <- unlist(india.chd.data.Deaths$gender)
india.chd.data.Deaths$age <- unlist(india.chd.data.Deaths$age)
india.chd.data.Deaths$gender <- as.factor(india.chd.data.Deaths$gender)
india.chd.data.Deaths$age <- as.factor(india.chd.data.Deaths$age)
india.chd.data.Deaths$value <- as.numeric(india.chd.data.Deaths$value)




