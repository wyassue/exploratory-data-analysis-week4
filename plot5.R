NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
aggregate_emissions <- aggregate(Emissions ~ year, data=emissions, FUN=sum)

png("plot5.png",width=480,height=480,units="px")
ggpic <- ggplot(aggregate_emissions, aes(x=factor(year), y=Emissions)) + geom_bar(stat="identity") +
  xlab("Year") + ylab(expression("Total Emissions, PM"[2.5])) +
  ggtitle("Total Emissions from Motor Vehicle Sources in Baltimore City")

print(ggpic)
dev.off()
