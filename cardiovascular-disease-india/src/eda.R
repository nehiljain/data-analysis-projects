
library('ProjectTemplate')
load.project()

#EDA in Deaths

print(summary(india.chd.data.Deaths$value))
print(summary(log10(india.chd.data.Deaths$value)))

qplot(x = value, data=filter(india.chd.data.Deaths, gbd_sub_case != "NA", gender != "person"), binwidth=10) +
  facet_wrap(~gender) +
  scale_x_continuous(breaks = seq(1,500,20), limits=c(0, 500)) + 
  scale_y_continuous(breaks = seq(1,40,2))
qplot(x = value, data=filter(india.chd.data.Deaths, gbd_sub_case != "NA", gender != "person"), binwidth=20) +
  facet_wrap(~gender) +
  scale_x_continuous(limits=c(500, 1000))

ggplot(aes(x=value), data=filter(india.chd.data.Deaths, gbd_sub_case != "NA", gender != "person")) +
  geom_freqpoly(aes(color=gender)) +
  scale_x_continuous(breaks = seq(1,500,20), limits=c(0, 500)) 
