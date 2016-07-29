# define function for ...

# ... increment parameter
increment = function(x) 
  return(10^(-x))

# ... absolute approximation of forward difference quotient
approximation = function(h)
  return(abs((cos(1 + h) - cos(1)) / h))

# ... absolute error of forward difference quotient
error = function(h) 
  return(abs(((cos(1 + h) - cos(1)) / h) + sin(1)))

# create objects
a = 1:16
b = sapply(a, increment)
c = sapply(b, approximation)
d = sapply(b, error)

# generate tabular overview
M = cbind(b, c, d)
colnames(M) = c("increment", "approximation", "error")
rownames(M) = c(1:16)
print(M)

# generate plot
e = c(b[1:8])
f = c(d[1:8])
plot(e, f, type = "b", xlab = "increment", ylab = "error",
     main = "order of error")
