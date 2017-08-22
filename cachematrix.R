## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix is a function that returns a list of functions that stores a martix and a cached value of the inverse of the matrix

makeCacheMatrix <- function(x = numeric()) 
  {
      cache <- NULL
      setMatrix <- function(newValue) 
      {
        x <<- newValue
        cache <<- NULL
      }
    # returns the stored matrix
      getMatrix <- function() 
        {
          x
        }
    # cache the given argument 
      cacheInverse <- function(solve) 
        {
          cache <<- solve
        }
    # get the cached value
      getInverse <- function() 
        {
          cache
      }
      
    # return a list
      
  list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
  
}

#calculates the inverse of a "special" matrix created with makeCacheMatrix

cacheSolve <- function(y, ...) 
{
  inverse <- y$getInverse()
    if(!is.null(inverse)) 
      {
        message("getting cached data")
        return(inverse)
      }
  data <- y$getMatrix()
  inverse <- solve(data)
  y$cacheInverse(inverse)
  
  # return the inverse
  inverse
}
