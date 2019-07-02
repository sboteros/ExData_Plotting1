# Week 1 - Course Project - Graph 1
# Exploratory Data Analysis Course
# Data Science Specialization
# Santiago Botero S.
# sboteros@unal.edu.co
# Date: 2019/06/30
# Encoding: UTF-1

# Objective: Reproduce the following graphic "./figue/unnamed-chunk-2.png".

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
  
# 3. Reproducing plot 1
  png("plot1.png")
  with(consumption, hist(Global_active_power, col = "red", 
                         main = "Global Active Power", 
                         xlab = "Global Active Power (kilowatts)",
                         axes = TRUE, freq = TRUE))
  axis(1, at = c(0, 2, 4, 6))
  axis(2, at = seq(0, 1200, by = 200))
  dev.off()
  