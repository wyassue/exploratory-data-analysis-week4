SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
NEI_24510 <- NEI[which(NEI$fips == "24510"),]

info.emissions.baltimore <- with(NEI_24510, aggregate(Emissions, by = list(year), sum))
colnames(info.emissions.baltimore) <- c("Year", "Emissions")

png("plot2.png",width=480,height=480,units="px")
plot(
  info.emissions.baltimore$Year, 
  info.emissions.baltimore$Emissions, 
  type = "b", 
  pch = 16, 
  col = "blue", 
  lty = "dotted", 
  ylab = "Emissions", 
  xlab = "Year", 
  main = "Baltimore Emissions"
)

dev.off()