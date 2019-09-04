# reading data
df_AllData <- read.table("./PA4/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
# extracting data from two days
df_TimeSepData <- df_AllData[(df_AllData$Date=="1/2/2007" | df_AllData$Date=="2/2/2007" ), ]

# create png file device
png("plot1.png", width=480, height=480)
# Plot 1 as histogram
hist(df_TimeSepData$Global_active_power, main="Global Active Power", xlab="Global Active Power [kW]", ylab="Frequency", col="Red", cex.sub=0.8)
# close device
dev.off()
