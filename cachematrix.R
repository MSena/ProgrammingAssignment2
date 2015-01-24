## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## The following function(invM) caches a inverse of a matrix
## inside an environment
## to avoid delayed computations further ahead


makeCacheMatrix <- function(x = matrix()) {
inverse <- NULL   ## creates a object in makeCaheMatrix's environment
print(environment())
evn <- environment()
print(parent.env(evn))
set <- function(y) {    
      x <<- y                    ##this is used, eventually, change the matrix x for y, with ...$set(y)
      inverse <<- NULL           ##this resets the inverse.
}
get <- function() x              ##writes matrix x to memory
setsolve <- function(solve) inverse <<- solve
getsolve <- function() inverse
getevn <- function() environment()
list(set = set,get = get,
     setsolve = setsolve,
     getsolve = getsolve,
     getevn = getevn) ##this command creates a named list of 4 functions, holding the functions with the same name
}


## Write a short comment describing this function

## cashSolve(invM) calls the inverse of that matrix from memory 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
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
