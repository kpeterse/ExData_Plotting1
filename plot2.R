plot2 <- function(pwrData) {
        library(dplyr)
        library(lubridate)
        
        yAxis <- "Global Active Power (kilowatts)"
        title <- "Global Active Power"
        
        activePwr <- sapply(select(pwrData, Global_active_power), as.numeric)
        dateTime <- strptime(paste(pwrData$Date, pwrData$Time), "%d/%m/%Y %H:%M:%S")
        # newData <- cbind(select(dateTime, ddtt), activePwr)
        plot(dateTime, activePwr, type = "l", ylab = yAxis, xlab = "")
        dev.copy(png, 'plot2.png')
        dev.off()
}
