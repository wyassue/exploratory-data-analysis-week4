NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))
png("plot1.png",width=480,height=480,units="px")

plot(
  emissions, 
  type = "b", 
  pch = 16, 
  col = "blue", 
  lty = "dotted", 
  ylab = "Emissions", 
  xlab = "Year", 
  main = "Annual Emissions"
)

dev.off()
