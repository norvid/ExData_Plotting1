#  filename : plot2.R
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

# Plot2: Global Active Power(kilowatts)
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(sds$DateTime, sds$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.off()
