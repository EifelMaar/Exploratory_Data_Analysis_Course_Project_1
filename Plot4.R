# reading data
df_AllData <- read.table("./PA4/household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
# extracting data from two days
df_TimeSepData <- df_AllData[(df_AllData$Date=="1/2/2007" | df_AllData$Date=="2/2/2007" ), ]

# format date and time
df_TimeSepData$Date <- as.Date(df_TimeSepData$Date, format="%d/%m/%Y")
ch_dateTime <- paste(df_TimeSepData$Date, df_TimeSepData$Time)
df_TimeSepData$DateTime <- as.POSIXct(ch_dateTime)

# create png file device
png("plot4.png", width=480, height=480)
#plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df_TimeSepData, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power [kW]", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage [V]", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Energy sub metering", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Reactive Power [kW]",xlab="", cex=0.8)
})
# close device
dev.off()