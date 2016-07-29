# define function for ...

# ... increment parameter
increment = function(x)
  return(10^(-x))

# ... absolute approximation
approximation = function(h) 
  return(abs((cos(1 + h) - cos(1 - h)) / (2 * h)))

# ... absolute error
error = function(h)
  return(abs(-sin(1) - (cos(1 + h) - cos(1 - h)) / (2 * h)))

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
e = c(b[1:5])
f = c(d[1:5])

# generate graphics
plot(e, f, type = "b", xlab = "increment", ylab = "error",
     main = "order of error")
plot(e, f, type = "b", xlim = c(0, 0.015), ylim = c(0, 0.0001),
     xlab = "increment", ylab = "error", main = "order of error")
