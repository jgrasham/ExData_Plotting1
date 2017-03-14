#
# Read the household power data file (2.075 million rows)
# load the data into the power table
# set the header option to TRUE, set the seperator option to ";"
# set the string for NA to "?"
#
power <- read.table("C://Users/jgras/OneDrive/Documents/household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
#
# convert the power$Date field in the power table to a date using as.Date 
#
power$Date <- as.Date(power$Date,format="%d/%m/%Y")
#
# eliminate all records except for 2007-02-01 and 2007-02-02
# put results in pwr2
#
pwr<-subset(power,Date >= "2007-02-01")
pwr2<-subset(pwr,Date <= "2007-02-02")
#
# list some info about the pwr2 table and variable Global_active_power
#
head(pwr2)
dim(pwr2)
summary(pwr2$Global_active_power)
quantile(pwr2$Global_active_power,na.rm=TRUE)
#
# plot histogram with following settings:
# color = "red", title = "Global Active Power"
# x label = "Global Active Power (kilowatts)"
# xaxis limit 0 and 6 ,yaxis limits 0 and 1200
#
plot.new()
hist(pwr2$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",xlim=c(0,6),ylim=c(0,1200))
dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()
dev.off()