#
# Read the household power data file (2.075 million rows)
# load the data into the power table
# set the header option to TRUE, set the seperator option to ";"
# set the string for NA to "?"
#
power <- read.table("C://Users/jgras/OneDrive/Documents/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#
# convert the power$Date and power$Time fields in the power table to a datetime using as.POSIXct 
#
power$Date <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
#
# eliminate all records except for 2007-02-01 and 2007-02-02
# put results in pwr2
#
pwr<-subset(power,Date >= "2007-02-01 00:00:00")
pwr2<-subset(pwr,Date <= "2007-02-02 23:59:00")
#
# list some info about the pwr2 table and variable Global_active_power
#
head(pwr2)
dim(pwr2)
summary(pwr2$Sub_metering_1)
quantile(pwr2$Sub_metering_1,na.rm=TRUE)
summary(pwr2$Sub_metering_2)
quantile(pwr2$Sub_metering_2,na.rm=TRUE)
summary(pwr2$Sub_metering_3)
quantile(pwr2$Sub_metering_3,na.rm=TRUE)
#
# plot line chart with following settings:
# color = "black",
# y label = "Global Active Power (kilowatts)"
# xaxis values Thu,Fri,Sat
#
plot.new()
#
# set multiplot rows / cols, set margins to smaller size
#
par(mfrow=c(2,2),mar=c(4,4,2,1),cex=.6)
#
# plot one upper left
#
plot(pwr2$Global_active_power, type ="l", yaxt="n", xaxt="n", col="black", ylab="Global Active Power (kilowatts)",ylim=c(0,6))
axis(1,c(1,1441,2880),c("Thu","Fri","Sat"))
axis(2,c(0,2,4,6),c(0,2,4,6))
#
# plot two upper right
#
plot(pwr2$Voltage, type ="l", yaxt="n", xaxt="n", col="black", xlab="datetime", ylab="Voltage",ylim=c(234,246))
axis(1,c(1,1441,2880),c("Thu","Fri","Sat"))
axis(2,c(234,238,242,246),c(234,238,242,246))
#
# plot three lower left
#
plot(pwr2$Sub_metering_1, type ="l", yaxt="n", xaxt="n", col="black", ylab="Energy sub metering",ylim=c(0,40))
lines(pwr2$Sub_metering_2, col="red")
lines(pwr2$Sub_metering_3, col="blue")
axis(1,c(1,1441,2880),c("Thu","Fri","Sat"))
axis(2,c(0,10,20,30),c(0,10,20,30))
legend("topright",bty="n",lty=1,col=c("black","red","blue"),legend=c("Sub metering 1","Sub metering 2","Sub metering 3"))
#
# plot four lower right
#
plot(pwr2$Global_reactive_power, type ="l", yaxt="n", xaxt="n", col="black", ylab="Global_reactive_power,",ylim=c(0.0,0.5))
axis(1,c(1,1441,2880),c("Thu","Fri","Sat"))
axis(2,c(0.0,0.1,0.2,0.3,0.4,0.5),c(0.0,0.1,0.2,0.3,0.4,0.5))
dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()
dev.off()