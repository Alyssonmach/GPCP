# Problem description:
# A motor company has three factories located in Rio de Janeiro, São Paulo, and Belo Horizonte.
# The company must deliver its production to three consumer centers: Recife, Salvador, and Manaus.
# Each factory has a limited production capacity, and each consumer center has a fixed demand.
# Transportation costs per motor unit between factories and consumer centers are given in the table.
# 
# Objective:
# Determine how many motor units each factory should send to each consumer center
# in order to satisfy all demands without exceeding capacities,
# while minimizing the total transportation cost.

library(lpSolve)

# Objective function coefficients (to minimize)
# Cost = 25*X1 + 20*X2 + 30*X3 + 30*Y1 + 25*Y2 + 25*Y3 + 20*Z1 + 15*Z2 + 23*Z3
objective_coeffs <- c(25, 20, 30, 30, 25, 25, 20, 15, 23)

# Constraint matrix
# Each row corresponds to a constraint:
# 1. X1 + X2 + X3 <= 2000
# 2. Y1 + Y2 + Y3 <= 3000
# 3. Z1 + Z2 + Z3 <= 1500
# 4. X1 + Y1 + Z1  = 2000
# 5. X2 + Y2 + Z2  = 2000
# 6. X3 + Y3 + Z3  = 1000
constraints <- matrix(c(
  1, 1, 1, 0, 0, 0, 0, 0, 0,
  0, 0, 0, 1, 1, 1, 0, 0, 0,
  0, 0, 0, 0, 0, 0, 1, 1, 1,
  1, 0, 0, 1, 0, 0, 1, 0, 0,
  0, 1, 0, 0, 1, 0, 0, 1, 0,
  0, 0, 1, 0, 0, 1, 0, 0, 1
), nrow = 6, byrow = TRUE)

# Right-hand side of constraints
rhs <- c(2000, 3000, 1500, 2000, 2000, 1000)

# Constraint directions
# "<=" for inequalities, "=" for equalities
directions <- c("<=", "<=", "<=", "=", "=", "=")

# Solve the linear programming problem (minimization)
result <- lp(direction = "min",
             objective.in = objective_coeffs,
             const.mat = constraints,
             const.dir = directions,
             const.rhs = rhs)

# Print optimal cost
cat("Minimum total cost:", result$objval, "\n")

# Print optimal values of decision variables
variable_names <- c("X1", "X2", "X3", "Y1", "Y2", "Y3", "Z1", "Z2", "Z3")
optimal_values <- setNames(result$solution, variable_names)
print(optimal_values)
