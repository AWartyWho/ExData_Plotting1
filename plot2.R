## Reads subsetted dataset (row numbers precalculated)
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
           "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = names,
                   sep=";", nrows=2880, skip=66637)

## Creates combined timestamp variable
data$Timestamp <- strptime(with(data, paste(Date, Time)),
                                      format="%d/%m/%Y %H:%M:%S")

## Formats Global Active Power column
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

## Plots a line graph of Timestamp vs Global Active Power
png(filename="plot2.png", width=480, height=480)

with(data, plot(Timestamp, Global_active_power, type="l", xlab="",
                ylab="Global Active Power (kilowatts)"))
dev.off()