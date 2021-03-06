
# Read the data household_power_consumption.txt.
hpc<-read.table("household_power_consumption.txt", header=T, sep=";", 
            na.strings="?", colClasses=c("character","character",rep("numeric",7)))

# Transform the variable Date in Date format.
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

# Select only the dates 01 e 02 of february 2007.
hpc<-hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02",]

# Transform the variable Time in time format.
hpc$Time<-strptime(paste(hpc$Date,hpc$Time),"%F %H:%M:%S",tz="GMT")

# To put the system date in english.
Sys.setlocale("LC_TIME", "English")

# Save the plot 4 in png format.
png("plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(hpc$Time, hpc$Global_active_power, type="l", xlab="", 
     ylab= "Global Active Power")
plot(hpc$Time, hpc$Voltage, type="l", xlab="datetime", 
     ylab = "Voltage")
plot(hpc$Time, hpc$Sub_metering_1, type="l", xlab="", 
     ylab= "Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2,col = "red")
lines(hpc$Time, hpc$Sub_metering_3,col = "blue")
legend("topright",legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),
       col=c("black","red","blue"),lty=1,bty="n")
plot(hpc$Time, hpc$Global_reactive_power, type="l", xlab="datetime", 
     ylab = "Global reactive power")
dev.off()
