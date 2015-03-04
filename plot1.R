#Update for exdata-012

plot1 <- function(){
  #import the file
  power <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
  
  #change the format of the Date column to Date class
  power$Date <- as.Date(power$Date, "%d/%m/%Y")
  
  #create a subset of the data for a 2 day period in Febrary 2007
  power_subset <- subset(power, (Date == as.Date("2007-02-01")) | (Date == as.Date("2007-02-02")))
  
  #plot1.png
  # Histogram for 
  #   Global Active Power
  #     X = Global Active Power (Kilowats)
  #     Y = Frequency
  
  hist(power_subset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png",width = 480, height = 480, units = "px")
  dev.off()
}