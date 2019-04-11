library(openintro)
source("countyMap.R")

myPDF("countyPovertyMap.pdf", 7.8, 4.5)
val <- county$poverty
val[val > 25] <- 25
countyMap(val, county_complete$FIPS, "red", gtlt=">",
    label = "Poverty")
dev.off()

myPDF("countyPopChangeMap.pdf", 7.8, 4.5)
val <- county$pop_change
val[val > 18] <- 18
countyMap(val, county_complete$FIPS, "ye", gtlt=">",
    label = "Population Change")
dev.off()

myPDF("countyUnemploymentRateMap.pdf", 7.8, 4.5)
val <- county$unemployment_rate
val[val > 7] <- 7
countyMap(val, county_complete$FIPS, "ye", gtlt=">",
    label = "Unemployment Rate")
dev.off()

myPDF("countyHomeownershipMap.pdf", 7.8, 4.5)
val <- county$homeownership
val[val < 55] <- 55
countyMap(val, county_complete$FIPS, "bg", gtlt="<",
    label = "Homeownership Rate")
dev.off()

myPDF("countyMedIncomeMap.pdf", 7.8, 4.5)
val <- county$median_hh_income / 1000
val[val > 75] <- 75
countyMap(val, county_complete$FIPS, "green", gtlt=">",
    label = "Median Household Income", unit = "dollars")
dev.off()
