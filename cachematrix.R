## Put comments here that give an overall description of what your
## functions do
# first function should return a list carrying functions to create
# and manipulate matrix data, the second function, retrieves, if possible
# the cached inverse of the matrix, otherwise it calculates it & stores
# it inside the matrix list object

## Write a short comment describing this function
# function that creates a list with functions for creating, setting and getting
# a matrix, as well as setting and getting its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() {
                x
        }
        setinverse <- function(inverse) {
                inv <<- inverse
        }
        getinverse <- function() {
                inv
        }
        list(
                set = set, get = get, setinverse = setinverse,
                getinverse = getinverse
        )
}


## Write a short comment describing this function
# function that retrieves, if possible, the inverse of a given matrix x,
# otherwise, it calculates the inverse, and caches (stores) it inside the
# matrix object

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if (!is.null(inv)) {
                return(inv)
        }
        data <- solve(x$get(), ...)
        x$setinverse(data)
        data
}