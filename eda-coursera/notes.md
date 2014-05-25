This the notes file for [https://class.coursera.org/exdata-002](https://class.coursera.org/exdata-002) 

All the functions are in R and plots in ggplot2.


Principles of Analytics Graphics

* Rule 1 : Show Comparisons
* Rule 2 : Show Causality, Mechanism
* Rule 3 : Show Multivariate data
* Rule 4 : Integration of as many evidences as possible
* Rule 5 : Describe and document the evidence with appropriate labels, scales and sources
* Rule 6 : Content is the king


# Exploratory graphs

Try and create vague questions. 


## Purpose

* To suggest strategies for modelling
* Explore basic questions and hypotheses



## Properties

* Many are made
* Made quickly

## One Dim Summaries

* Five Number Summary 
	* summary() 
* Boxplots
	* qplot(var1, var2, data, geom="boxplot")
* Histograms
	* qplot(var1, binwidth)
* Density plots
	* qplot(var1, geom = "density")
* Barplot
	* qplot(var, data, geom="bar")


## Two Dim Summaries

* Multiple/Overlayed 1-D Plots
* Scatter plots
* smooth scatterplots 


## More than 2 Dim Summaries

* Multiple/Overlayed 2-D plots
* use other visual attributes to add dimesions
* spinning plots



## Plotting Systems in R ( My version)

- Base :- Useless, Very Verbose.
- Lattice :- good for Conditioning plots, many plots in one window. Can be complicated beccause entire plot in one function call.
- Ggplot2 :- Best of both worlds, can easily make panel plots, has lots of defaults but can be customised

### My Choice only GGPLOT2


## Graphic devices in R

- window/screen device - there is always 1
- pdf
- png/jpeg
- svg


There are two formats

- Vector Graphics
	- Good for line graphics
	- Not good for large number of points
- Bitmapped Graphics
	- good for lots of different points, colors, lossless compression
	- do not resize well 
### qplot() will default screen device
### 





To DO
========




Simpsons Paradox

* More details required

