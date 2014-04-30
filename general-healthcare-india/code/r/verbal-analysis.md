Shortfall in Health Infrastructure vs Government Funding
========================================================

This is a document showing some results we found by doing EDA(Explorartory Data Analysis) on healthcare datasets from data.gov.in. 

The analysis.R script does some data wrangling and create a table with shortfall, government effort and surplus or shortfall between the two.

```r
require(ggplot2)
```

```
## Loading required package: ggplot2
```

```r
require(dplyr)
```

```
## Loading required package: dplyr
## 
## Attaching package: 'dplyr'
## 
## The following objects are masked from 'package:stats':
## 
##     filter, lag
## 
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
require(reshape2)
```

```
## Loading required package: reshape2
```

```r
source("analysis.R")
```

```
## Loading required package: rattle
## Rattle: A free graphical interface for data mining with R.
## Version 3.0.2 r169 Copyright (c) 2006-2013 Togaware Pty Ltd.
## Type 'rattle()' to shake, rattle, and roll your data.
## Loading required package: xlsx
## Loading required package: rJava
## Loading required package: xlsxjars
## Loading required package: stringr
```


You can also embed plots, for example:


```r
histogram_Data <- melt(analysis_data, id = c("state_and_ut"))
noTotalsData <- filter(histogram_Data, state_and_ut != c("All India Total"))
qplot(x = value, data = noTotalsData, binwidth = 100) + facet_wrap(~variable)
```

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


This shows us that in the sub centre infrastrucure. Two states are the real outliers. The main problematics states are ..


```r
analysis_data %.% filter(state_and_ut != c("All India Total"), sc_shortfall > 
    2000) %.% arrange(desc(sc_shortfall)) %.% select(state_and_ut, sc_shortfall)
```

```
##     state_and_ut sc_shortfall
## 1  Uttar Pradesh        10516
## 2          Bihar         8837
## 3 Madhya Pradesh         3445
## 4    Maharashtra         2830
## 5    West Bengal         2680
## 6      Jharkhand         2085
```



When we add the amount of effort government is putting to improve the matters

```r
analysis_data %.% filter(state_and_ut != c("All India Total"), sc_shortfall > 
    2000) %.% arrange(desc(sc_shortfall)) %.% select(state_and_ut, sc_shortfall, 
    sc_govt_effort)
```

```
##     state_and_ut sc_shortfall sc_govt_effort
## 1  Uttar Pradesh        10516              0
## 2          Bihar         8837            787
## 3 Madhya Pradesh         3445             35
## 4    Maharashtra         2830            127
## 5    West Bengal         2680              0
## 6      Jharkhand         2085              0
```



