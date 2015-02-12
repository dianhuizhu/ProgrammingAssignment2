# a simple drive function to test makeCacheMatrix 
# and cacheSolve

#Source the two functions first
source("cachematrix.R")

# Build a 2x2 matrix
c=rbind(c(1, -1/4), c(-1/4, 1)) 

#Create the special "matrix" for caching
cm <- makeCacheMatrix(c)

# not cache the first time running it
cacheSolve(cm)

#Uses cache after the first run
cacheSolve(cm)
