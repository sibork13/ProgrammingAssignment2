## This two functions help us to save data in cache, so if you want to return
# more tha 1 time the same function, the function don't will do all the porsses again
# only do one, after that, chec the cache and return the data

# The function creates a matrix to a cache, the input matrix must be the Matrix
# you will use, so we can imagine that this function is an extention of matrix function

makeCacheMatrix <- function(x = matrix()) {
  # Initialize a mtrix to null
  m <- NULL
  #create a matrix object
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  #return the initial matrix used in cacheSolved()
  get <- function() x
  # Set the result of solve(9 function ) and catch into m variable
  setsolve <- function(solve) m<<-solve
  # get the cached matrix
  getsolve <- function() m

  list(set= set, get = get, setsolve=setsolve,getsolve=getsolve)
}


## Function that return the inverse of matrix created in makeCacheMatrix function
# The firs run the function will call makeCacheMatrix, after only will read cache
cacheSolve <- function(x, ...) {
        ## chec if matrix is in the cache
        m <- x$getsolve()
        # if ther is something, it will return it
        if(!is.null(m)){
          message("getting cached data")
          return(m)
        }
        #if not, then compute the solve function 
        data<-x$get()
        m<- solve(data,...)
        x$setsolve(m)
        m
}
