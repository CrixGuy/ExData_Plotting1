plot2 <- function(){
  #import the file
  power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  #change the format of the Date column to Date class
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  #create a subset of the data for a 2 day period in Febrary 2007
  power_subset <- subset(power, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
  
  #Add a new column with the date and time together
  DateTime <-  as.POSIXct(paste(power_subset$Date, power_subset$Time))
  power_subset$DateTime <- DateTime
  
  #plot2.png
  #   X = Thurs, Fri, Sat
  #   Y = Global Active Power (kilowatts)
  
  plot(power_subset$DateTime, power_subset$Global_active_power,type="n",xlab="", ylab="Global Active Power (kilowatts)")

  lines(power_subset$DateTime, power_subset$Global_active_power)
  
  dev.copy(png, file="plot2.png",width = 480, height = 480, units = "px")
  dev.off()
}