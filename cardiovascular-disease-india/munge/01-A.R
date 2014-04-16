#Preprocessing script.

#setting the names right
names(india.chd.data.DALYs) <- normVarNames(names(india.chd.data.DALYs))
names(india.chd.data.Deaths) <- normVarNames(names(india.chd.data.Deaths))
names(india.chd.data.Prevalence) <- normVarNames(names(india.chd.data.Prevalence))
names(india.chd.data.Years.Lost) <- normVarNames(names(india.chd.data.Years.Lost))

#DALYs table cleaning.. This is a fragile HARD CODED part.
india.chd.data.DALYs$na <- NULL
india.chd.data.DALYs <- india.chd.data.DALYs[-1,]
india.chd.data.DALYs <- india.chd.data.DALYs[1:27,]
dalys_population <- india.chd.data.DALYs[1,5]
india.chd.data.DALYs <- india.chd.data.DALYs[-1,]
