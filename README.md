# date_vec

R function that outputs a character vector of length defined in total_days, each element representing
a date, starting from the day, month and year chosen by the user, with a particular format also 
defined by the user. This function may be useful for time series analyses (e.g. to get the labels of the x axis for plotting).

Input numeric values for day, month, year and total days.
Customize the format of the date: choose between "d", "m", "y", "dm", "mdy" or "dmy".
Choose the character string that will separate the terms (only valid when format is "dm", "mdy" or "dmy").


