library(mlogit)
library(AER)

data("TravelMode", package = "AER")

TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", alt.var = "mode")
