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

#Plot 2
png(file="C:/Users/joerling/Dropbox/Sonstiges/Learning_Data_Science/Exploratory data analysis/Week 1/Project/ExData_Plotting1/plot2.png")
plot(df$T,df$Global_active_power, type = "S",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.off()