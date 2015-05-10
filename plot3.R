data<-read.csv("household_power_consumption.txt",header=T,sep=";",na.strings="?",check.names=F,stringsAsFactors=F,comment.char="",quote='\"')
data$Date<-as.Date(data$Date,format="%d/%m/%Y")
data_sub<-subset(data,subset=(Date>="2007-02-01" & Date<="2007-02-02"))
rm(data)

datetime<-paste(as.Date(data_sub$Date),data_sub$Time)
data_sub$DateTime<-as.POSIXct(datetime)

plot(data_sub$Sub_metering_1~data_sub$DateTime, type="l", ylab="Energy sub metering", xlab="")
lines(data_sub$Sub_metering_2~data_sub$DateTime, col="red")
lines(data_sub$Sub_metering_3~data_sub$DateTime, col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()
