#set working directory
setwd("~/R_Programming/ExData_Plotting1")

#Read the Data in
data = read.delim("household_power_consumption.txt", sep = ";")

#Adjust the date field to correct format
data$Date = as.Date(data$Date, "%d/%m/%Y")

# subset by Date range
subset_Data = subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#Set Global_active_power to numeric
subset_Data$Global_active_power = 
  as.numeric(as.character(subset_Data$Global_active_power))

#Draw Hist of Global_active_power, and set color to Red
hist(subset_Data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Copy his to a *.png file called Plot1.png
dev.copy(png, file = "plot1.png")
dev.off()