#to load data, uncomment
#setwd("D:/Classes/Exploratory Data")
#the_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
#the_data$Date<-as.Date(the_data$Date,format="%d/%m/%Y")

select_date<-c("01-02-2007","02-02-2007")
select_date<-as.Date(select_date,format="%d-%m-%Y")
subset_data<-subset(the_data,Date>=select_date[1])
subset_data<-subset(subset_data,Date<=select_date[2])

time<-as.POSIXct(paste(subset_data$Date, subset_data$Time), 
                 format="%Y-%m-%d %H:%M:%S")

windows()
par(mfrow=c(2,2))

#graph1
global_active_power<-subset_data$Global_active_power
plot(time,global_active_power,type='n',xlab="", ylab="Global Active Power (kilowatts)")
lines(time,global_active_power)

#graph2
plot(time,subset_data$Voltage
     ,type='n', ylab="Voltage", xlab="datetime")
lines(time,subset_data$Voltage)

#graph3
y1<-as.numeric(subset_data$Sub_metering_1)
y2<-as.numeric(subset_data$Sub_metering_2)              
y3<-as.numeric(subset_data$Sub_metering_3)
plot(x,y1,type='n',xlab="", ylab="Energy sub metering")
lines(x,y1)
lines(x,y2, col="red")
lines(x,y3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#graph4
#graph2
plot(time,subset_data$Global_reactive_power
     ,type='n', ylab="Global_reactive_power", xlab="datetime")
lines(time,subset_data$Global_reactive_power)

dev.copy(png, file="assignment1_plot4.png")
dev.off()