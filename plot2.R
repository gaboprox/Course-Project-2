library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/gabriel.chirinos.REDSLI/Desktop/R Gabriel/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/gabriel.chirinos.REDSLI/Desktop/R Gabriel/exdata_data_NEI_data/Source_Classification_Code.rds")

emisiones2 = (NEI 
             %>% select(year,Emissions,fips)
             %>% filter(fips == "24510")
             %>% group_by(year)
             %>% summarise(Emissions = sum(Emissions))
             %>% arrange(Emissions)
             %>% ggplot(aes(x = factor(year),y=Emissions/1000,fill=year,label = round(Emissions/1000,2))) + geom_bar(stat = "identity") +
               geom_label(aes(fill = year),colour = "white", fontface = "bold") +
               labs(y="Total PM25 emission in kilotons",x="Years",title = "Total PM25 emission in Baltimore City in kilotons") +
               theme_bw() + theme(plot.title = element_text(hjust = 0.5)))
emisiones2 