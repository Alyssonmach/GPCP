# Chair and table manufacturing problem
# Each chair requires 5 wooden planks and each table requires 20. In total, we have
# 400 planks.
# Each chair requires 10 hours of labor and each table requires 15 hours. We have
# 450 hours of labor available.

# Objective: Maximize profit: the profit per chair is 45 and per table is 80.

# x1 <- chair, x2 <- table

library(lpSolve)

# 45x1 + 80x2
profit <- c(45, 80)

# 5x1 + 20x2 <= 400
# 10x1 + 15x2 <= 450
# x1 <= 0
# x2 <= 0
restrictions <-  matrix(c(5, 20, 10, 15), nrow=2, byrow=TRUE)
right_side <- c(400, 450)
direction <- c("<=", "<=")

result <- lp(direction="max", objective.in=profit, const.mat=restrictions,
             const.dir=direction, const.rhs=right_side)

print(result)
print(result$solution)