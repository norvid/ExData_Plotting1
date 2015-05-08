#  filename : plot4.R
#  create by: norvid, 2015-05-08
#  memo     : exdata week 1 homework

df<- read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactor=FALSE)
# get sub dataset that Date in 01/02/2007 ~ 02/02/2007.
sds <- df[which(df$Date == '1/2/2007' | df$Date == '2/2/2007'), ]
remove(df)

# clean data
sds$Global_active_power[sds$Global_active_power == '?'] <- NA
sds$Global_reactive_power[sds$Global_reactive_power == '?'] <- NA
sds$Voltage[sds$Voltage == '?'] <- NA
sds$Global_intensity[sds$Global_intensity == '?'] <- NA
sds$Sub_metering_1[sds$Sub_metering_1 == '?'] <- NA
sds$Sub_metering_2[sds$Sub_metering_2 == '?'] <- NA
sds$Sub_metering_3[sds$Sub_metering_3 == '?'] <- NA

sds$DateTime              <- as.POSIXct(paste(sds$Date, sds$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
sds$Global_active_power   <- as.numeric(sds$Global_active_power)
sds$Global_reactive_power <- as.numeric(sds$Global_reactive_power)
sds$Voltage               <- as.numeric(sds$Voltage)
sds$Global_intensity      <- as.numeric(sds$Global_intensity)
sds$Sub_metering_1        <- as.numeric(sds$Sub_metering_1)
sds$Sub_metering_2        <- as.numeric(sds$Sub_metering_2)
sds$Sub_metering_3        <- as.numeric(sds$Sub_metering_3)

# Plot4: four plot
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
# 1st 
plot(sds$DateTime, sds$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
# 2nd
plot(sds$DateTime, sds$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd
plot(sds$DateTime, sds$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sds$DateTime, sds$Sub_metering_2, col = "red")
lines(sds$DateTime, sds$Sub_metering_3, col = "blue")
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
# 4rd
plot(sds$DateTime, sds$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
