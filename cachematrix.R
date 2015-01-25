

## The following f(invM) caches a inverse of a matrix M
## inside an environment
## to avoid time consuming computations further ahead


makeCacheMatrix <- function(x = matrix()) {

      inverse <- NULL   

set <- function(y) {    
      x <<- y                   
      inverse <<- NULL          
}
get <- function() x              
setsolve <- function(solve) inverse <<- solve
getsolve <- function() inverse
getevn <- function() environment()
list(set = set,get = get,
     setsolve = setsolve,
     getsolve = getsolve,
     getevn = getevn) 
}


## cashSolve(invM) calls the inverse of matrix M from memory 
## invM is not computed, it's retrieved 

cacheSolve <- function(x, ...) {
       
      inverse <- x$getsolve()
      if(!is.null(inverse)) {
            message("getting cached data")
            return(inverse)
      }
      data <- x$get()
      inverse <- source(data, ...)
      x$setsolve(inverse)
      inverse
}
