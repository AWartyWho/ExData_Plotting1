## Reads subsetted dataset (row numbers precalculated)
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
           "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = names,
                   sep=";", nrows=2880, skip=66637)

## Creates combined timestamp variable
data$Timestamp <- strptime(with(data, paste(Date, Time)),
                           format="%d/%m/%Y %H:%M:%S")

## Opens blank plot and plots the Sub_metering variables (with legend)
png(filename="plot3.png", width=480, height=480)

with(data, plot(Timestamp, Sub_metering_1, type="n", xlab="",
     ylab="Energy sub metering"))

with(data, points(Timestamp, Sub_metering_1, type="l", col="black"))
with(data, points(Timestamp, Sub_metering_2, type="l", col="red"))
with(data, points(Timestamp, Sub_metering_3, type="l", col="blue"))

legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()