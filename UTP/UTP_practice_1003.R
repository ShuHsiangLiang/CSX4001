library(readxl)

trip.data <- read_xlsx("Trip Generation.xlsx")

head(trip.data)

LR <- lm(TP ~ Pop + Inc, data = trip.data)
LR
summary(LR)
