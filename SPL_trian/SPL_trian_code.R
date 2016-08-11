input=function(){  
  
# interactive part - user enter coordinates of points A, B and C
pointAx = readline("Key in the first x coordinate and press enter : "); 
pointAy = readline("Key in the first y coordinate and press enter : "); 
pointA  = as.integer(c(pointAx, pointAy)); 
pointBx = readline("Key in the second x coordinate and press enter: "); 
pointBy = readline("Key in the second y coordinate and press enter: "); 
pointB  = as.integer(c(pointBx, pointBy)); 
pointCx = readline("Key in the third x coordinate and press enter : "); 
pointCy = readline("Key in the third y coordinate and press enter : "); 
pointC  = as.integer(c(pointCx, pointCy));
  
# output - information about coordinates, which have been saved
print("-------------------------------------------")  # visible line
print("The first point includes the coordinates : "); print(pointA)
print("The second point includes the coordinates: "); print(pointB)
print("The third point includes the coordinates : "); print(pointC)
  
# define vectors (based on points A, B and C
vector1 = c(pointB - pointA)
vector2 = c(pointC - pointA) 

# define matrix (based on vectors)
matrix  = rbind(vector1, vector2)
  
# output if points (do not) form a triangle:
if (det(matrix) == 0){
  print("These points do not generate a triangle")  
} else {
  matrix2 = rbind(pointA, pointB, pointC);
  plot(matrix2, type = "p", xlab = "x coordinate", ylab = "y coordinate"); 
  font = 3; cex = 1; lwd = 6    # formatting the graphic
}
print("-------------------------------------------")  # visible line
return("end of program" )
} 
print(input())
