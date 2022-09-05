#Reading and subsetting data
data <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subset_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#Calling the Plotting function & Annotating the Plot
subset_data$Date <- as.Date(subset_data$Date, format="%d/%m/%Y")
subset_data$Time <- strptime(subset_data$Time, format="%H:%M:%S")
subset_data[1:1440,"Time"] <- format(subset_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_data[1441:2880,"Time"] <- format(subset_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# calling the plot function and adding the Sub metering lines via lines() function
plot(subset_data$Time,as.numeric(subset_data$Sub_metering_1),type="n",xlab="",ylab="Energy sub metering", col = "black")
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))

#Adding the legend via the legend() function
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# Saving the plot to a PNG file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()