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
summary(pwr2$Global_active_power)
quantile(pwr2$Global_active_power,na.rm=TRUE)
#
# plot line chart with following settings:
# color = "black",
# y label = "Global Active Power (kilowatts)"
# xaxis values Thu,Fri,Sat
# create plot2.png
#
plot.new()
plot(pwr2$Global_active_power, type ="l", yaxt="n", xaxt="n", col="black", ylab="Global Active Power (kilowatts)",ylim=c(0,8),xlab=" ")
axis(1,c(1,1441,2880),c("Thu","Fri","Sat"))
axis(2,c(0,2,4,6),c(0,2,4,6))
dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()
dev.off()
