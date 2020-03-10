library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/gabriel.chirinos.REDSLI/Desktop/R Gabriel/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/gabriel.chirinos.REDSLI/Desktop/R Gabriel/exdata_data_NEI_data/Source_Classification_Code.rds")

#We Can Use Any Packege
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

emisiones = (NEI 
             %>% select(year,Emissions)
             %>% group_by(year)
             %>% summarise(Emissions = sum(Emissions))
             %>% arrange(Emissions)
             %>% ggplot(aes(x = factor(year),y=Emissions/1000,fill=year,label = round(Emissions/1000,2))) + geom_bar(stat = "identity") +
             geom_label(aes(fill = year),colour = "white", fontface = "bold") +
               labs(y="Total PM25 emission in kilotons",x="Years",title = "Total PM25 emission in kilotons") +
              theme_bw() + theme(plot.title = element_text(hjust = 0.5)))
emisiones 
