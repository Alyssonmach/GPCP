library(datasets)

data("AirPassengers")
ts_data <- AirPassengers

print(head(ts_data))

plot(ts_data, main="Série Original: AirPassengers", col="blue")

decomp <- decompose(ts_data, type = "additive")

plot(decomp)

trend <- decomp$trend    
seasonal <- decomp$seasonal 
random <- decomp$random  

summary(trend)
summary(seasonal)
summary(random)
