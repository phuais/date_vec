# Input numeric values for day, month, year and total days.
# Customize the format of the date. Choose between "d", "m", "y", "dm", "mdy" or "dmy"
# Choose the character string that will separate the terms (only valid when format is "dm", "mdy" or "dmy")
#
# The function outputs a character vector of length defined in total_days, each element representing
# a date, starting from the day, month and year chosen by the user, with a particular format also 
# defined by the user.
date_vec <- function(day = 1, month = 1, year = 2020, total_days = 40, format = "dmy", sep = "/")
{
  # Outputs TRUE if x is a leap year, otherwise outputs FALSE
  isleap <- function(x)
  {
    out <- FALSE
    if(x %% 4 == 0)
    {
      if(x %% 100 == 0)
      {
        if(x %% 400 == 0) out <- TRUE
      }
      else
      {
        out <- TRUE
      }
    }
    out
  }
  
  vec <- rep("", length = total_days)
  tmp_year <- year
  tmp_month <- month
  tmp_day <- day
  for(i in 1:total_days)
  {
    if(tmp_day / 10 < 1) zero <- "0" else zero <- ""
    if(tmp_month / 10 < 1) zero2 <- "0" else zero2 <- ""
    if(format == "d")
    {
      vec[i] <- paste(zero, tmp_day, sep = "")
    }
    else if(format == "m")
    {
      vec[i] <- paste(zero2, tmp_month, sep = "")
    }
    else if(format == "y")
    {
      vec[i] <- tmp_year
    }
    else if(format == "dm")
    {
      vec[i] <- paste(zero, tmp_day, sep, zero2, tmp_month, sep = "")
    }
    else if(format == "mdy")
    {
      vec[i] <- paste(zero, tmp_month, sep, zero, tmp_day, sep, tmp_year, sep = "")
    }
    else
    {
      vec[i] <- paste(zero, tmp_day, sep, zero2, tmp_month, sep, tmp_year, sep = "")
    }
    
    if(tmp_month %in% c(1, 3, 5, 7, 8, 10, 12))
    {
      if(tmp_day == 31)
      {
        if(tmp_month == 12)
        {
          tmp_month <- 1
          tmp_year  <- tmp_year + 1 
        }
        else
        {
          tmp_month <- tmp_month + 1
        }
        tmp_day <- 1
      }
      else
      {
        tmp_day <- tmp_day + 1
      }
    }
    else
    {
      if(tmp_month %in% c(4, 6, 9, 11))
      {
        if(tmp_day == 30)
        {
          tmp_month <- tmp_month + 1
          tmp_day <- 1
        }
        else
        {
          tmp_day <- tmp_day + 1
        }
      }
      else
      {
        if(tmp_month == 2)
        {
          if(isleap(tmp_year)) d <- 29 else d <- 28
          if(tmp_day == d)
          {
            tmp_month <- tmp_month + 1
            tmp_day <- 1
          }
          else
          {
            tmp_day <- tmp_day + 1
          }
        }
      }
    }
  }
  return(vec)
}
   
