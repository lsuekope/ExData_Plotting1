data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
project_data<- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

dt<- paste(project_data$Date, project_data$Time)
project_data$Time <- strptime(dt, format = "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
#plot 1
plot(project_data$Time, as.numeric(project_data$Global_active_power), type = "line", ylab = "Global Active Power (kilowatts)", xlab = "")

#plot 2
plot(project_data$Time, as.numeric(project_data$Voltage), type = "line", ylab = "Voltage", xlab = "datetime")

#plot 3
plot(project_data$Time, as.numeric(project_data$Sub_metering_1), type = "line", ylab = "Energy sub metering", xlab = "")
lines(project_data$Time, as.numeric(project_data$Sub_metering_2), col = "red")
lines(project_data$Time, as.numeric(project_data$Sub_metering_3), col = "blue")
legend("topright", lty = c(1,1),bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot 4
plot(project_data$Time, as.numeric(project_data$Global_reactive_power), type = "line", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()