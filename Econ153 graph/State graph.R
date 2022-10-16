library(ggplot2)
library(tidyverse)
library(lubridate)

Affinity_state$date <- with(Affinity_state, mdy(sprintf('%02d%02d%04d', year, month, day)))
Affinity_state$date
result <- filter(Affinity_state, statefips == 6)
new_df <- select(date,spend_all)
ggplot(Affinity_state, aes(x=date, y=spend_all)) +
  geom_line()


