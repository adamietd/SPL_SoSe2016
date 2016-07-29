# define function for ...

# ... increment parameter
increment = function(x) 
  return(10^(-x))

# ... absolute approximation
approximation = function(h)
  return(abs((cos(1 + h) - cos(1)) / h))

# ... absolute error
error = function(h) 
  return(abs(((cos(1 + h) - cos(1)) / h) + sin(1)))

# create objects
a = 1:16
b = sapply(a, increment)
c = sapply(b, approximation)
d = sapply(b, error)

# generate table
M = cbind(b, c, d)
colnames(M) = c("increment", "approximation", "error")
rownames(M) = c(1:16)
print(M)

# create vectors
e = c(b[1:8])
f = c(d[1:8])

# generate graphic
plot(e, f, type = "b", xlab = "increment", ylab = "error",
     main = "order of error")
