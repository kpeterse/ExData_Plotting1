plot3 <- function(pwrData) {
        library(dplyr)
        library(lubridate)
        
        yAxis <- "Energy sub metering"
        subs <- c("sub_metering_1", "sub_metering_2", "sub_metering_3")
        colors <- c("black", "red", "blue")

        sub1 <- sapply(select(pwrData, Sub_metering_1), as.numeric)
        sub2 <- sapply(select(pwrData, Sub_metering_2), as.numeric)
        sub3 <- sapply(select(pwrData, Sub_metering_3), as.numeric)
        dateTime <- strptime(paste(pwrData$Date, pwrData$Time), "%d/%m/%Y %H:%M:%S")
        plot(dateTime, sub1, type = "l", ylab = yAxis, xlab = "")
        lines(dateTime, sub2, type = "l", col = "red")
        lines(dateTime, sub3, type = "l", col = "blue")
        legend("topright", legend = subs, lty = c(1, 1), lwd = c(2.5, 2.5), col = colors)
        dev.copy(png, 'plot3.png')
        dev.off()
}
