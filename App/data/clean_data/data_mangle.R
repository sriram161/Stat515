library('tidyverse')
library('psych')

# Step: 1 Get data into the environments
data <- read_csv("App/data/clean_data/energy_data.csv")
data <- data[-1]

# Step: 2 Check unique values in categorical features.
statecodes <- unique(data$StateCode) # remove X3, X5 and US
statecodes.count <- length(statecodes) #54
MSN <- unique(data$MSN)
MSN.count <- length(MSN) #606
year <- unique(data$Year)
year.count <- length(year) #56

# Step:3 Prepare data for whole country.
data.totals <- data %>% 
  filter(StateCode == 'US') %>%
  filter(complete.cases(.))

data <- data %>% 
  filter(StateCode  != 'X3') %>%
  filter(StateCode != 'X5')  %>%
  filter(StateCode != 'US')

wide.year.data <- data %>% 
  spread(Year,Data) %>%
  filter(complete.cases(.))  #select only rows with not NA.

temp.data <- data %>% spread(MSN,Data)
col.names <- colnames(temp.data)
temp.data[nrow(temp.data)+1,] = col.names

wide.MSN.data <- temp.data %>%
  t() %>%
  as.tibble() %>%
  filter(complete.cases(.)) %>%
  t() %>%
  as.tibble()

colnames(wide.MSN.data) <- wide.MSN.data[nrow(wide.MSN.data),]
wide.MSN.data <- wide.MSN.data[1:nrow(wide.MSN.data)-1,]

rm(temp.data)

data.states <- function() {return(data)}
data.total.USA <- function() {return(data.totals)}
data.year <- function() {return(wide.year.data)}
data.msn <- function() {return(wide.MSN.data)}

# Data extraction for renewable energy.
energy.renew <- data.msn() %>% 
  select(StateCode, Year, RETCB, EMTCB, GETCB, HYTCB, SOTCB, WYTCB, WWTCB) %>%
  mutate_at(vars(matches("Year|TCB")),funs(as.numeric))  

  
#write_csv(energy.renew, path="App/data/clean_data/Energy_renew.csv")

# Data extraction from non renewable energy.

energy.fossil <- data.msn() %>%
  select(StateCode, Year, FFTCB, CLTCB, NNTCB, PMTCB) %>%
  mutate_at(vars(matches("Year|TCB")),funs(as.numeric))

#write_csv(energy.fossil, path="App/data/clean_data/Energy_fossil.csv")

data.energy.renew <- function () {return(energy.renew %>% mutate(Year,decade=case_when(
  Year >= 1960 & Year < 1970 ~ "1960's",
  Year >= 1970 & Year < 1980 ~ "1970's",
  Year >= 1980 & Year < 1990 ~ "1980's",
  Year >= 1990 & Year < 2000 ~ "1990's",
  Year >= 2000 & Year < 2100 ~ "2000's")))}
data.energy.fossil <- function () {return(energy.fossil %>% mutate(Year,decade=case_when(
  Year >= 1960 & Year < 1970 ~ "1960's",
  Year >= 1970 & Year < 1980 ~ "1970's",
  Year >= 1980 & Year < 1990 ~ "1980's",
  Year >= 1990 & Year < 2000 ~ "1990's",
  Year >= 2000 & Year < 2100 ~ "2000's")))}
