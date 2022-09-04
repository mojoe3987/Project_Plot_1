install.packages("lubridate")
library(lubridate)

#Loading and subsetting the data
df <- read.table("C:/Users/joerling/Dropbox/Sonstiges/Learning_Data_Science/Exploratory data analysis/Week 1/Project/ExData_Plotting1/exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
colnames(df) <- df[1,]
df <- df[-c(1),]

df$T <- paste(df$Date,df$Time)
df$T <- dmy_hms(df$T)
df <- df[,c(10,3:9,1,2)]
df <- df[which(df$Date == "1/2/2007" | df$Date == "2/2/2007"),]
str(df)

#Plot 4
png(file="C:/Users/joerling/Dropbox/Sonstiges/Learning_Data_Science/Exploratory data analysis/Week 1/Project/ExData_Plotting1/plot4.png")
par(mfrow = c(2,2))
plot(df$T,df$Global_active_power, type = "S",ylab = "Global Active Power (kilowatts)",xlab = "")
plot(df$T,df$Voltage, type = "S",ylab = "Voltage",xlab = "datetime")
plot(df$Sub_metering_1~df$T,data=df[df$Sub_metering_1,],type="s",xlab="",ylab="Energy sub metering") +
  lines(df$Sub_metering_2~df$T,data=df[df$Sub_metering_2,],type="s",col=2) +
  lines(df$Sub_metering_3~df$T,data=df[df$Sub_metering_3,],type="s",col=4) +
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)
plot(df$T,df$Global_reactive_power, type = "S",ylab = "Global_reactive_power",xlab = "datetime")
dev.off()
