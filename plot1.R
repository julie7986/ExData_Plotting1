## change home directory
setwd('C:/Users/jlin/Desktop/Homework')

## loading the data
hpc_temp <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors=FALSE)

## subset to 2 days
hpc <- subset(hpc_temp, Date=='1/2/2007' | Date=='2/2/2007')

str(hpc) # table structure
head(hpc)
hpc$Date<- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Time<- strptime(hpc$Time,format="%H:%M:%S", tz="")
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power<- as.numeric(hpc$Global_reactive_power)
hpc$Voltage<- as.numeric(hpc$Voltage)
hpc$Global_intensity<- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1<- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<- as.numeric(hpc$Sub_metering_2)
png("plot1.png",  width = 480, height = 480, units = "px")
hist(hpc$Global_active_power,  col = "red", main='Global Active Power',
     xlab='Global Active power (in kilowatt)',ylab='Frequency')
dev.off()

