# Labels for plots
labels.fossil <- paste(c('Coal', 'Natural Gas', 'Petroleum','Fossil Total'),
                       "consumption thousands (BTU)")
labels.renew <- paste(c('Ethonal', 'Geo Therm', 'Hydro', 'Solar', 'Wind', 'Wood', 'Renew Total'),
                  "consumption thousands (BTU)")

#page1 labels
codes.fossil <- c('Coal'='CLTCB', 'Natural Gas'='NNTCB', 'Petroleum'='PMTCB', 'Fossil Fuel'='FFTCB')
codes.renew <- c('Ethonal'='EMTCB', 'Geo Thermal'='GETCB', 'Hydro'='HYTCB', 'Solar'='SOTCB', 'Wind'='WYTCB', 'Wood Waste'='WWTCB', 'Renewable'='RETCB')
codes.all <- c(codes.fossil, codes.renew)

# page2 labes
codes.energy.source <- c('Fossil Fuel'='FFTCB', 'Renewable'='RETCB')
codes.decades <-c("1960's", "1970's", "1980's", "1990's", "2000's")
codes.componet.fuel <- c('Renew', 'Fossil')

buildLabels <- function(encoding, description){
  df <- data.frame(encoding, description, dtype=character)
  row.names(df) <- df[,1]
  return(df)
}

