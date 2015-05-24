## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a special matrix object that can cache its inverse
makeCacheMatrix <- function(a = matrix()) {
## Initialize the inverse property
     i <- NULL
 
     ## Method to set the matrix
     set <- function( matrix ) {
             a <<- matrix
             i <<- NULL
     }
 
     ## Method the get the matrix
     get <- function() {
    	## Returns the matrix
   	a
     }
 
     ## This method is used to set the inverse of the matrix
     setInverse <- function(inverse) {
         i <<- inverse
     }
 
     ## This method is used to get the inverse of the matrix
     getInverse <- function() {
         ## Returns the inverse property
         i
     }
 
     ## Return a list of the methods
     list(set = set, get = get,
          setInverse = setInverse,
         getInverse = getInverse)
 
}


## This function is used to compute the inverse of the special matrix returned by "makeCacheMatrix" above. If the inverse has
## already been calculated (and the matrix remains unchanged), then the "cachesolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        a <- x$getInverse()
        ## Returns the inverse if already set
        if( !is.null(a) ) {
        message("getting cached data")
        return(a)
}

## This function is used to get the matrix from the object
data <- x$get()

## This function calculates the inverse of the matrix using matrix multiplication
a <- solve(data) %*% data

## Set the inverse of the matrix to the object
x$setInverse(a)

## Returns the matrix
 a
}
