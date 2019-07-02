# Original data source

This dataset is based on the "Individual household electric power consumption
data set", taken from the
[UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/), which
contains measurements of electric power consumption in one household with a
one-minute sampling rate over a period of almost 4 years.

# Variables

The code generates a dataset called `consumption`, with the following
variables:

+ `Date` (YYYY-MM-DD): Date of measurment.
+ `Time` (XXH XXM XXS, XX is an integer): Time of measurment.
+ `Global_active_power` (real number): household global minute-averaged active
power (in kilowatt).
+ `Global_reactive_power` (real number):  household global minute-averaged
reactive power (in kilowatt).
+ `Voltage` (real number): minute-averaged voltage (in volt).
+ `Global_intensity` (real number): household global minute-averaged current
intensity (in ampere).
+ `Sub_metering_1` (real number): energy sub-metering No. 1 (in watt-hour of
active energy). It corresponds to the kitchen, containing mainly a dishwasher,
an oven and a microwave (hot plates are not electric but gas powered).
+ `Sub_metering_2` (real number): nergy sub-metering No. 2 (in watt-hour of
active energy). It corresponds to the laundry room, containing a
washing-machine, a tumble-drier, a refrigerator and a light.
+ `Sub_metering_3` (real number): energy sub-metering No. 3 (in watt-hour of
active energy). It corresponds to an electric water-heater and an
air-conditioner.
+ `Date_Time` (YYYY-MM-DD HH:MM:SS): Date and time of measurment.
