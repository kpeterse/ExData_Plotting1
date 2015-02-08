readData2 <- function() {
        # Create a myData class to convert the chr date to a "date" type
        # http://stackoverflow.com/questions/13022299/specify-date-format-for-colclasses-argument-in-read-table-read-csv/13022441#13022441
        library(dplyr)
        
        # setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
        colTypes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
        pwrData <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colTypes, na.strings = c("?"))
        pwrData <- filter(pwrData, Date == "1/2/2007" | Date == "2/2/2007")
        detach("package:dplyr")
        return(pwrData)  
}
