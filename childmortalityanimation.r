library(ggplot2)
library(gganimate)

#Data source: United Nations, Department of Economic and Social Affairs, Population Division (2019). World Population

mydata=read.csv("C:/Users/GAPE/Downloads/fertility-vs-child-mortality.csv",header=T)

mydata=mydata[!is.na(mydata$Year)&!is.na(mydata$Country)&!is.na(mydata$Mortality)&!is.na(mydata$Population)&!is.na(mydata$Fertility),]

p = ggplot(mydata[mydata$Year>=1980,], aes(Fertility, Mortality, size = Population, colour = Country)) +
  theme_minimal()+
  geom_point(alpha = 0.8) +
  scale_size(range = c(2, 12)) +
  theme(legend.position = 'none') +
  labs(title = 'Global change in child mortality by fertility. Year: {frame_time}',subtitle='Points for countries proportional to population', x = 'Fertility (Live births per woman)', y = 'Child mortality (< 5 years, %)') +
  transition_time(Year) +
  ease_aes('linear')

animate(p, 100, 10)