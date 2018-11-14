## question 1

library(readxl)
library(ggplot2)
library(NLP)

trip_production <- read_xlsx("Trip Generation.xlsx", 1)
trip_attraction <- read_xlsx("Trip Generation.xlsx", 2)

ggplot(trip.data, aes(x = TP, y = Pop + Inc + HH + Car +Employ + Bus)) + geom_point(shape = 10, size = 5) + geom_smooth(method = lm) + labs(x = "Trip Production", y = "All")
LR.Trip_produciton <- lm(TP ~ Pop + Inc + HH + Car +Employ + Bus, data = trip.data)

summary(LR.Trip_produciton)

# (Pop, HH, Bus) -> P-value > 0.02 -> reject 

ggplot(trip_production, aes(x = TP, y = Inc + Car + Employ)) + geom_point(shape = 10, size = 5) + geom_smooth(method = lm) + labs(x = "Trip Production fixed", y = "Inc + Car + Employ")
LR.Trip_production_fixed <- lm(TP ~ Inc + Car + Employ, data = trip.data)
summary(LR.Trip_production_fixed)

LR.Trip_attraction <- lm(TA ~ Com + Area + Area_for_commercial_use + Pop + Bank_branch + School + Bus, data = trip_attraction)
summary(LR.Trip_attraction)

# (Area, Area_for_commercial_use, Bank_branch, Bus_routes ) -> P-value > 0.05 -> reject

ggplot(trip_attraction, aes(x = TA, y = Com + Pop + School)) + geom_point(shape = 10, size = 5) + geom_smooth(method = lm) + labs(x = "Trip Attraction fixed", y = "Com + Pop + School")
LR.Trip_attraction_fixed <- lm(TA ~ Com + Pop + School, data = trip_attraction)
summary(LR.Trip_attraction_fixed)
print(LR.Trip_attraction_fixed)

## question_2

new <- data.frame(6,6, 6 , 6)
q2 <- read_xlsx("q2.xlsx")
TP <- predict(LR.Trip_production_fixed, q2) 
TA <- predict(LR.Trip_attraction_fixed, q2)

Data <- data.frame()


