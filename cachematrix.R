## These functions cache the inverse of a matrix. Matrix inversion is
## usually a costly computation and there may be some benefit to caching
## the inverse of the matrix as opposed to computing it repeatedly. 

## The makeCacheMatrix function creates a special "matrix" object that can
## cache its inverse. It is a function that will store a list of functions.
## It will store these functions:
## set_matrix() : set the value of the matrix
## get_matrix() : get the value of the matrix
## set_inverse() : set the value of the inverse of the matrix
## get_inverse() : get the value of the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    matinv <- NULL
    set_matrix <- function(y) {
        x <<- y
        matinv <<- NULL
    }
    get_matrix <- function() {
        x
    }
    set_inverse <- function(solve) {
        matinv <<- solve
    }
    get_inverse <- function() {
        matinv
    }
    list(set_matrix = set_matrix, get_matrix = get_matrix,
         set_inverse = set_inverse, get_inverse = get_inverse)
}


## The cacheSolve function computes the inverse of the special "matrix"
## returned by makeCacheMatrix. If the inverse has already been calculated
## (and the matrix has not changed), the the cachesolve should retrieve
## the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    matinv <- x$get_inverse()
    if(!is.null(matinv)) {
        message ("getting cached data")
        return(matinv)
    }
    data <- x$get_matrix()
    matinv <- solve(data, ...)
    x$set_inverse(matinv)
    matinv
}
