library('tidyverse')
library('ggplot2')
library('micromapST')

# Read data from csv
raw.data <- read_csv("App/data/raw_data/Complete_SEDS.csv")

# Verify data
head(raw.data, n=2)

# Remove duplicates in data
raw.data.unique <- unique(raw.data)
summary(unique(raw.data.unique$MSN))

# Remove NA field rows from data
raw.data.rm.na <- filter_all(raw.data.unique , all_vars(!is.na(.)))
rm(raw.data, raw.data.unique)
write_csv(raw.data.rm.na,path="App/data/clean_data/energy_data.csv")
rm(raw.data.rm.na)
