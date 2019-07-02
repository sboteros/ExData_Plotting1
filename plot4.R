# Week 1 - Course Project - Graph 4
# Exploratory Data Analysis Course
# Data Science Specialization
# Santiago Botero S.
# sboteros@unal.edu.co
# Date: 2019/06/30
# Encoding: UTF-1

# Objective: Reproduce the following graphic "./figue/unnamed-chunk-5.png".

setwd(file.path("C:", "Users", "sbote", "OneDrive", "Documentos", 
                "DataScienceSpecialization", "4 Exploratory data analysis", 
                "Week1", "ExData_Plotting1"))

# 1. Loading packages
  paquetes <- c("dplyr", "lubridate")
  for (i in paquetes) {
    if (!require(i, character.only = TRUE)) {
      install.packages(i)
    }
    library(i, character.only = TRUE)
  }
  rm(list = c("paquetes", "i"))
  
# 2. Downloading and loading data
  if (!dir.exists(file.path(".", "data"))) {dir.create(file.path(".", "data"))}

  if (!file.exists(file.path(".", "data", "consumption.zip"))) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  file.path(".", "data", "consumption.zip"))
    unzip(file.path(".", "data", "consumption.zip"),
          exdir = file.path(".", "data", "consumption"))
  }
  
  consumption <- read.table(file.path(".", "data", "consumption", 
                                      "household_power_consumption.txt"), 
                            header = TRUE, sep = ";", na.strings = "?") %>%
    tbl_df %>%
    mutate(Date_Time = dmy_hms(paste(Date, Time)), Date = dmy(Date), 
           Time = hms(Time)) %>%
    filter(Date %in% c(ymd("2007-02-01"), ymd("2007-02-02"))) %>%
    print
  
# 3. Reproducing plot 4
  png("plot4.png")
  par(mfcol = c(2, 2))
  # Plot (a)
  with(consumption, plot(Date_Time, Global_active_power, type = "l",
                         ylab = "Global Active Power (kilowatts)",
                         xlab = ""))
  # Plot (b)
  with(consumption, plot(Date_Time, Sub_metering_1, type = "l",
                         ylab = "Energy sub metering",
                         xlab = "", col = "gray"))
  with(consumption, lines(Date_Time, Sub_metering_2, col = "red"))
  with(consumption, lines(Date_Time, Sub_metering_3, col = "blue"))
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                "Sub_metering_3"), 
         col = c("gray", "red", "blue"), lty = rep(1, 3))
  # Plot (c)
  with(consumption, plot(Date_Time, Voltage, type = "l",
                         ylab = "Voltage",
                         xlab = "datetime"))
  # Plot (d)
  with(consumption, plot(Date_Time, Global_reactive_power, type = "l",
                         ylab = "Global_reactive_power",
                         xlab = "datetime"))
  dev.off()
  