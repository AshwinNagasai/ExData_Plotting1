#Reading and subsetting data
data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Calling the Plotting function & Annotating the Plot
hist(as.numeric(as.character(subset_data$Global_active_power)), main = "Global Active Power", col = "red", xlab = "Global Active power (kilowatts)" , ylab = "Frequency")

# Saving the plot to a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()