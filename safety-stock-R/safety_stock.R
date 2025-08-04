# Problem description:
# A planner wants to define the safety stock (SS) for product
# XYZ based on past forecasted and actual demand data.
# The goal is to calculate the safety stock required
# to achieve a 90% service level. The safety stock is
# calculated as: SS = Z * standard deviation of forecast errors
# For a 90% service level, the Z-score is 1.28.

forecast_demand <- c(4546, 4494, 5837, 5630, 5062, 4442, 5785, 5940, 5217, 5889)

actual_demand <- c(4850, 4712, 5430, 5784, 4794, 4107, 5572, 6280, 5573, 5545)

forecast_errors <- actual_demand - forecast_demand

std_dev_errors <- sd(forecast_errors)

z_score <- 1.28

safety_stock <- z_score * std_dev_errors

cat("Safety Stock needed for 90% service level:", round(safety_stock), "units\n")
