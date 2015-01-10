plot4 <- function(){
  #import the file
  power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  #change the format of the Date column to Date class
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  #create a subset of the data for a 2 day period in Febrary 2007
  power_subset <- subset(power, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
  
  #Add a new column with the date and time together
  DateTime <-  as.POSIXct(paste(power_subset$Date, power_subset$Time))
  power_subset$DateTime <- DateTime
  
  #plot4.png
  # Multiple graphs
  
  par(mar=c(4,3,3,1)+0.1, mfrow =c(2,2),cex=0.7)
  
  #graph1
  plot(power_subset$DateTime,power_subset$Global_active_power, type="n",xlab="", ylab="Global Active Power")
  lines(power_subset$DateTime, power_subset$Global_active_power, col="black")
  
  #graph2
  plot(power_subset$DateTime,power_subset$Voltage, type="n",xlab="datetime", ylab="Voltage")
  lines(power_subset$DateTime, power_subset$Voltage, col="black")
  
  #graph3
  plot(power_subset$DateTime,power_subset$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
  lines(power_subset$DateTime, power_subset$Sub_metering_1, col="black")
  lines(power_subset$DateTime, power_subset$Sub_metering_2, col="red")
  lines(power_subset$DateTime, power_subset$Sub_metering_3, col="blue")
  legend("topright", lwd = 1, cex=0.7, bty="n", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #graph4
  plot(power_subset$DateTime,power_subset$Global_reactive_power, type="n",xlab="datetime", ylab="Global_reactive_power")
  lines(power_subset$DateTime, power_subset$Global_reactive_power, col="black")
  
  dev.copy(png, file="plot4.png",width = 480, height = 480, units = "px")
  dev.off()
}