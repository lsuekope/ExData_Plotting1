data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
project_data<- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

dt<- paste(project_data$Date, project_data$Time)
project_data$Time <- strptime(dt, format = "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles")

png(filename = "plot3.png", width = 480, height = 480)
plot(project_data$Time, as.numeric(project_data$Sub_metering_1), type = "line", ylab = "Energy sub metering", xlab = "")
lines(project_data$Time, as.numeric(project_data$Sub_metering_2), col = "red")
lines(project_data$Time, as.numeric(project_data$Sub_metering_3), col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()