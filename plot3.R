NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_24510 <- NEI[NEI$fips == "24510",]
annual_24510 <- aggregate(NEI_24510$Emissions, by=c(list(NEI_24510$year), list(NEI_24510$type)), "sum")
colnames(annual_24510) <- c('year', 'type', 'totalPM')
annual_24510$year <- as.factor(annual_24510$year)

png(filename = "plot3.png", width = 480, height = 480, units = "px")
ggpig <- ggplot(annual_24510, aes(x=year, y=totalPM)) + geom_bar(stat='identity') +facet_grid(.~type) 
ggpig <- ggpig + labs(title = "Total Emissions in U.S. by Type of Pollutant", x = 'Year', y = expression("Total Emissions, PM"[2.5]))
print(ggpig)

dev.off()