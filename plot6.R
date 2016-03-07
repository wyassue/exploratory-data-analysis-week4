library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]

vehicles_baltimore <- vehicles_NEI[vehicles_NEI$fips=="24510",]
vehicles_baltimore$city <- "Baltimore"

vehicles_la <- vehicles_NEI[vehicles_NEI$fips=="06037",]
vehicles_la$city <- "Los Angeles"

both <- rbind(vehicles_baltimore,vehicles_la)

png("plot6.png",width=480,height=480,units="px")
ggp <- ggplot(both, aes(x=factor(year), 
  y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +
  facet_grid(scales="free", space="free", .~city) +
  labs(x="Year", y=expression("Total Emissions, PM"[2.5])) + 
  labs(title=expression("Comparison of Total Emissions by County")
)
print(ggp)

dev.off()