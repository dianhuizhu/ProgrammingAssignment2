## Matrix inversion is usually a costly computation and their
## may be some benefit to caching the inverse of a matrix rather
## than compute it repeatedly. This program has two functions 
## that cache the inverse of a matrix.

#  1. makeCacheMatrix: This function creates a special 
#      "matrix" object that can cache its inverse.
#  2.  cacheSolve: This function computes the inverse of
#      the special "matrix" returned by makeCacheMatrix above. 
#      If the inverse has already been calculated (and the 
#      matrix has not changed),then the cachesolve should 
#      retrieve the inverse from the cache.


## This function creates a special "matrix" object that 
## can cache its inverse.
makeCacheMatrix <- function (x=matrix()){

      # inverse matrix (im) is initialized as NULL
      im <- NULL

      #initialize all variables
      set <- function(y) {
                x <<- y
                im <<- NULL
      }

       #return the original matrix       
       get <- function() x

       #set inverse matrix (im) as cache
       set_inverse <- function(iv_m) im <<- iv_m

       #return the cached inverse 
       get_inverse <- function() im

       #A list containing a funtion to
       # 1. set the value of the matrix
       # 2. get the value of the matrix
       # 3. set the value of the inverse matrix
       # 4. get the value of the inverse matrix
       list(set = set, get = get,
             set_inverse = set_inverse,
             get_inverse = get_inverse)

}

## This function it retrieves the inverse from the cache
## if available. Otherwise, it compute the inverse and
## set the inverse cache 
cacheSolve<- function(x, ...) {
	# get the inverse matrix from the special Matrix 
        im <- x$get_inverse()

	#If the inverse matrix is cached, just return it
        if(!is.null(im)) {
                message("getting cached data")
                return(im)
        }
	
	#If no cache available, get the original matrix
        data <- x$get()

	#calculate inverse matrix
        im <- solve(data, ...)

	#cache the inverse matrix
        x$set_inverse(im)

	#return the inverse
        im
}
