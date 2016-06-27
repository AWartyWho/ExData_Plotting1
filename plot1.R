## Reads subsetted dataset (row numbers precalculated)
names <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
           "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
           "Sub_metering_3")
data <- read.table("household_power_consumption.txt", col.names = names,
                   sep=";", nrows=2880, skip=66637)

## Formats Date column
data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))

## Formats and stores Global Active Power column
gap <- as.numeric(as.character(data$Global_active_power))

## Plots a histogram of Global Active Power
png(filename="plot1.png", width=480, height=480)

hist(gap, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()