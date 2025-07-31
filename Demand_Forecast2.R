library(forecast)
library(tseries)

set.seed(42)
data_ts <- ts(100 + 5 * (1:72) + sin(2 * pi * (1:72)/4) * 10 + rnorm(72, 0, 5),
              start = c(1999, 1), frequency = 4)

dev.new()
plot(data_ts, main = "Time Series: Quarterly Sales", col = "blue", ylab = "Sales", xlab = "Year")

simple_ma <- ma(data_ts, order = 4)
dev.new()
plot(data_ts, main = "Simple Model: Moving Average", col = "gray", ylab = "Sales", xlab = "Year")
lines(simple_ma, col = "red", lwd = 2)
legend("topleft", legend = c("Original", "Moving Average"), col = c("gray", "red"), lty = 1)

time_index <- time(data_ts)
lm_model <- lm(data_ts ~ time_index)
trend <- ts(fitted(lm_model), start = c(1999, 1), frequency = 4)

dev.new()
plot(data_ts, main = "Linear Trend Model", col = "black", ylab = "Sales", xlab = "Year")
lines(trend, col = "red", lwd = 2)
legend("topleft", legend = c("Original", "Trend"), col = c("black", "red"), lty = 1)

arima_model <- auto.arima(data_ts)
forecast_result <- forecast(arima_model, h = 8)

dev.new()
plot(forecast_result, main = "ARIMA Model - 2 Year Forecast")
