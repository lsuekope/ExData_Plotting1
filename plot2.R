data<- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
project_data<- subset(data, Date == "2007-02-01"| Date == "2007-02-02")

dt<- paste(project_data$Date, project_data$Time)
project_data$Time <- strptime(dt, format = "%Y-%m-%d %H:%M:%S", tz = "America/Los_Angeles")

png(filename = "plot2.png", width = 480, height = 480)
plot(project_data$Time, as.numeric(project_data$Global_active_power), type = "line", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()