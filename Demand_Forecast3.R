set.seed(123)
x <- 1:50
y <- 2 * x + rnorm(50, mean = 0, sd = 5)

simple_model <- lm(y ~ x)
new_x <- data.frame(x = c(51, 52, 53))
predictions <- predict(simple_model, newdata = new_x)

set.seed(456)
n <- 100
x1 <- rnorm(n, mean = 10, sd = 3)
x2 <- rnorm(n, mean = 5, sd = 1)
y_multi <- 3 + 1.5 * x1 - 2 * x2 + rnorm(n, sd = 2)
multi_data <- data.frame(y = y_multi, x1 = x1, x2 = x2)
multiple_model <- lm(y ~ x1 + x2, data = multi_data)
new_data <- data.frame(x1 = c(12, 14), x2 = c(4, 6))
multi_predictions <- predict(multiple_model, newdata = new_data)

par(mfrow = c(1, 2))

plot(x, y, main = "Scatterplot of X and Y", xlab = "X", ylab = "Y", pch = 19)
abline(simple_model, col = "red", lwd = 2)

library(scatterplot3d)
scatterplot3d(multi_data$x1, multi_data$x2, multi_data$y,
              main = "Multiple Linear Regression",
              xlab = "x1", ylab = "x2", zlab = "y")

par(mfrow = c(1,1))
