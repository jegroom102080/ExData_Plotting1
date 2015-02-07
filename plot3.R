#set working directory
setwd("~/R_Programming/ExData_Plotting1")

#Read the Data in
data = read.delim("household_power_consumption.txt", sep = ";")

#Set the format of Date/Time
data$datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Adjust the date field to correct format
data$Date = as.Date(data$Date, "%d/%m/%Y")

# subset by Date range
subset_Data = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

##Set Global_active_power to be numeric
subset_Data$Global_active_power = as.numeric(as.character(subset_Data$Global_active_power))

#Set Sub_metering_1 and sub_metering_2 to be numeric
subset_Data$Sub_metering_1 = as.numeric(as.character(subset_Data$Sub_metering_1))
subset_Data$Sub_metering_2 = as.numeric(as.character(subset_Data$Sub_metering_2))
subset_Data$Sub_metering_3 = as.numeric(as.character(subset_Data$Sub_metering_3))

# plot data
plot(Sub_metering_1 ~ as.numeric(subset_Data$datetime), data = subset_Data, type = "l",
     ylab = "Energy sub metering", xlab = "", xaxt = "n", cex.lab = 0.7, cex.axis = 0.8)
lines(subset_Data$Sub_metering_2 ~ as.numeric(subset_Data$datetime), col = "red")
lines(subset_Data$Sub_metering_3 ~ as.numeric(subset_Data$datetime), col = "blue")
axis(1, at = c(min(as.numeric(subset_Data$datetime)), median(as.numeric(subset_Data$datetime)),
               max(as.numeric(subset_Data$datetime))),
     labels = c("Thu", "Fri", "Sat"), cex.axis = 0.8)
legend("topright", lty = 1, cex = 0.75, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# Copy his to a *.png file called plot3.png
dev.copy(png, file = "plot3.png")
dev.off()