## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
makeCacheMatrix makes a special matrix, which is really a list containing a function to
1. set the value of the matrix
2. get the value of the matrix
3. set the value of the inverse
4. get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
	r<-NULL
	set<-function(y){
		x<<-y
		r<<-NULL
	}
	get<-function()x
	setinverse<-function(inverse)r <<-inverse
	getinverse<-function()r
	list(set=set,get=get, setinverse=setinverse, getinverse=getinverse)
}


## Write a short comment describing this function
cacheSolve gets the inverse of the matrix in makeCacheMatrix. But it first checks if the inverse has already been calculated,
in which case it gets the value of the inverse

cacheSolve <- function(x, ...) {
        r<-x$getinverse()
        if(!is.null(r)){
        	message("getting cached data")
        	return(r)
        }
        data<-x$get()
        r<-solve(data, ...)
        x$setinverse(r)
        r
}
