# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL  # Initialize the cache for the inverse matrix
    
    set <- function(y) {
        x <<- y  # Assign the matrix to the global environment
        m <<- NULL  # Reset the cached inverse matrix when the matrix is changed
    }
    
    get <- function() x
    setinverse <- function(inverse) m <<- inverse
    getinverse <- function() m
    
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
cacheSolve <- function(x, ...) {
    m <- x$getinverse()  # Check if the inverse is already cached
    
    # If the inverse is already cached, return it
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # If the inverse is not cached, compute it
    data <- x$get()  # Get the matrix
    m <- solve(data, ...)  # Compute the inverse of the matrix
    x$setinverse(m)  # Cache the computed inverse
    m  # Return the computed inverse
}
## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
