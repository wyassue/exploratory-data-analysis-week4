library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)

coal_combustion <- (combustion & coal)
SCC_combustion <- SCC[coal_combustion,]$SCC
NEI_combustion <- NEI[NEI$SCC %in% SCC_combustion,]

png("plot4.png",width=480,height=480,units="px")
ggpic <- ggplot(NEI_combustion,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",fill="blue",width=0.5) +
  theme_bw() +  guides(fill=TRUE) +
  labs(x="year", y=expression("Total Emissions, PM"[2.5])) + 
  labs(title=expression("Emissions from Coal Combustion for the US")
)

print(ggpic)

dev.off()