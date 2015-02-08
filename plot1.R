plot1 <- function(pwrData) {
        
        xAxis <- "Global Active Power (kilowatts)"
        title <- "Global Active Power"
        
        activePwr <- pwrData["Global_active_power"]
        activePwrNum <- sapply(activePwr, as.numeric)
        hist(activePwrNum, col = "red", xlab = xAxis, main = title)
        dev.copy(png, 'plot1.png')
        dev.off()

}
        