# reading data
df_AllData <- read.table("./PA4/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
# extracting data from two days
df_TimeSepData <- df_AllData[(df_AllData$Date=="1/2/2007" | df_AllData$Date=="2/2/2007" ), ]

# format date and time
df_TimeSepData$Date <- as.Date(df_TimeSepData$Date, format="%d/%m/%Y")
ch_dateTime <- paste(df_TimeSepData$Date, df_TimeSepData$Time)
df_TimeSepData$DateTime <- as.POSIXct(ch_dateTime)

# create png file device
png("plot2.png", width=480, height=480)
# plot2
plot(df_TimeSepData$Global_active_power~df_TimeSepData$DateTime, type="l", ylab="Global Active Power [kW]", xlab="")
# close device
dev.off()
