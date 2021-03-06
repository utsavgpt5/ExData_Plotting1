#plot1
library(devtools)
library(dplyr)
library(data.table)
library(lubridate)
electricity<-fread("household_power_consumption.txt")
elec<-subset(electricity,Date=="1/2/2007" | Date=="2/2/2007")
elec$Date<-as.Date(elec$Date,format="%d/%m/%Y")
elec$datetime=paste(elec$Date,elec$Time,sep = " ")
elec$datetime=ymd_hms(elec$datetime,tz=Sys.timezone())
elec$Global_active_power<-as.numeric(as.character(elec$Global_active_power))
hist(elec$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",col = "red",main = "Global Active Power")  
dev.copy(png,'plot1.png')
dev.off()

