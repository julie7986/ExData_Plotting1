## change home directory
setwd('C:/Users/jlin/Desktop/Homework')

## loading the data
hpc_temp <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE,stringsAsFactors=FALSE)

## subset to 2 days
hpc <- subset(hpc_temp, Date=='1/2/2007' | Date=='2/2/2007' )

str(hpc) # table structure
head(hpc)
hpc$Time<- strptime(paste(hpc$Date, hpc$Time, sep = ""),format="%d/%m/%Y %H:%M:%S", tz="")
hpc$Date<- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power<- as.numeric(hpc$Global_active_power)
hpc$Global_reactive_power<- as.numeric(hpc$Global_reactive_power)
hpc$Voltage<- as.numeric(hpc$Voltage)
hpc$Global_intensity<- as.numeric(hpc$Global_intensity)
hpc$Sub_metering_1<- as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<- as.numeric(hpc$Sub_metering_2)
#png("plot2.png",  width = 480, height = 480, units = "px")

# get the range for the x and y axis
xrange <- range(hpc$Time)
yrange <- range(hpc$Sub_metering_1)

# set up the plot
png("plot3.png",  width = 480, height = 480, units = "px")
plot(xrange, yrange, type="n", xlab="",    ylab='Energy sub Metering' )
lines(hpc$Time, hpc$Sub_metering_1, lwd=1.5, col='black')
lines(hpc$Time, hpc$Sub_metering_2, lwd=1.5, col='red')
lines(hpc$Time, hpc$Sub_metering_3, lwd=1.5, col='blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  col=c("black", "red", "blue"),  lty=1:1.5)
dev.off()

