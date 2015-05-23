## Please read README.md for instructions before you use these two fuctions.
## In general, this pair of functions are used to cache the inverse of a matrix

## The first function, makeCacheMatrix creates a special
## "matrix", which is a list containing a function to:
## Set the value of the matrix
## Get the value of the matrix
## Set the value of the inverse matrix
## Get the value of the inverse matrix


makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        setMatrix <- function(y) {
                x <<- y
                m <<- NULL
        }
        getMatrix <- function() x
        cacheInverse <- function(solve) {
                m <<- solve
        }
        getInverse <- function() m
        list(setMatrix = setMatrix, getMatrix = getMatrix,
             cacheInverse = cacheInverse,
             getInverse = getInverse)
}


## The following function calculates the inverse of the 
## special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already
## been calculated. If so, it gets the inverse from the cache
## and skips the computation. Otherwise, it calculates the inverse
## of the data and sets the value of the inverse in the cache via
## the cacheInverse function



cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$getMatrix()
        m <- solve(data, ...)
        x$cacheInverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}