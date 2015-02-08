plot4 <- function(pwrData) {
        library(dplyr)
        library(lubridate)
        source('plot2.R')
        source('plot3.R')
        
        plot1yaxis <- "voltage"
        plot1xaxis <- "datetime"
        plot2yaxis <- "Global_reactive_power"
        plot2xaxis <- "datetime"   
        
        par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
        
        plot2(pwrData)
        
        # This is the plot building for new plot 1
        voltage <- sapply(select(pwrData, Voltage), as.numeric)
        dateTime <- strptime(paste(pwrData$Date, pwrData$Time), "%d/%m/%Y %H:%M:%S")
        plot(dateTime, voltage, type = "l", ylab = plot1yaxis, xlab = plot1xaxis)
        
        plot3(pwrData)
        
        # This is the plot building for new plot 2
        reactive <- sapply(select(pwrData, Global_reactive_power), as.numeric)
        plot(dateTime, reactive, type = "l", ylab = plot2yaxis, xlab = plot2xaxis)
        
        dev.copy(png, 'plot4.png')
        dev.off()
}