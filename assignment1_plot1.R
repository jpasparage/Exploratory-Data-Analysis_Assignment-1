#to load data, uncomment
#setwd("D:/Classes/Exploratory Data")
#the_data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, as.is=TRUE)
#the_data$Date<-as.Date(the_data$Date,format="%d/%m/%Y")

select_date<-c("01-02-2007","02-02-2007")
select_date<-as.Date(select_date,format="%d-%m-%Y")
subset_data<-subset(the_data,Date>=select_date[1])
subset_data<-subset(subset_data,Date<=select_date[2])
global_active_power<-subset_data$Global_active_power
windows()
hist(as.numeric(global_active_power), main="Global Active Power", 
     col="red", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="assignment1_plot1.png")
dev.off()
