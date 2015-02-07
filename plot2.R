#set working directory
setwd("~/R_Programming/ExData_Plotting1")

#Read the Data in
data = read.delim("household_power_consumption.txt", sep = ";")

#Set the format of Date/Time
data$datetime = strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Format Date
data$Date = as.Date(data$Date, "%d/%m/%Y")

# subset by Date range

subset_Data = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Set Global_active_power to be numeric
subset_Data$Global_active_power = 
  as.numeric(as.character(subset_Data$Global_active_power))


# plot data
plot(Global_active_power ~ as.numeric(subset_Data$datetime), 
     data = subset_Data, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "", xaxt = "n")
axis(1, at = c(min(as.numeric(subset_Data$datetime)), 
               median(as.numeric(subset_Data$datetime)),
               max(as.numeric(subset_Data$datetime))),
               labels = c("Thu", "Fri", "Sat"))

# Copy his to a *.png file called plot2.png
dev.copy(png, file = "plot2.png")
dev.off()