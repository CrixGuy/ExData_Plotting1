plot3 <- function(){
  #import the file
  power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  #change the format of the Date column to Date class
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  #create a subset of the data for a 2 day period in Febrary 2007
  power_subset <- subset(power, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
  
  #Add a new column with the date and time together
  DateTime <-  as.POSIXct(paste(power_subset$Date, power_subset$Time))
  power_subset$DateTime <- DateTime
  
  #plot3.png
  #   X = Thurs, Fri, Sat
  #   Y = Energy sub meeting
  
  plot(power_subset$DateTime,power_subset$Sub_metering_1, type="n",xlab="", ylab="Energy sub metering")
  
  lines(power_subset$DateTime, power_subset$Sub_metering_1, col="black")
  lines(power_subset$DateTime, power_subset$Sub_metering_2, col="red")
  lines(power_subset$DateTime, power_subset$Sub_metering_3, col="blue")
  
  
  legend("topright", lwd = 1, cex=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  dev.copy(png, file="plot3.png",width = 480, height = 480, units = "px")
  dev.off()
}