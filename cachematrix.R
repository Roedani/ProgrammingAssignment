## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
        inver <- NULL 
    set <- function(y) {  
        x <<- y # here will create an object in the global environment
        inver <<- NULL
    }
    get_matrix <- function() x
    set_inver <- function(solmatrix) inver <<- solmatrix
    get_inver <- function() inver
    list(set = set, get_matrix = get_matrix,
         set_inver = set_inver,
         get_inver = get_inver)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) { # this function will use the makeCacheMatrix as output
        inver <- x$get_inver()
if(!is.null(inver)) {
        message("getting cached data")
        return(inver)
}
        ## Return a matrix that is the inverse of 'x'
        data <- x$get_matrix()
        inver <- solve(data)
        x$set_inver(inver)
        inver
        
}

m1 <- matrix(c(1/2, -1/4, -1, 3/4), nrow = 2, ncol = 2)
myMatrix_object <- makeCacheMatrix(m1)

n1 <- matrix(c(6,2,8,4), nrow = 2, ncol = 2)
myMatrix_object <- makeCacheMatrix(n1)

cacheSolve(myMatrix_object)
