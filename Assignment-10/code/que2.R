interval<-c(0,5)
n<-10
paths<-matrix(nrow=5000,ncol=10)
k<-5000

division<-(interval[2]-interval[1])/5000
mean<-0.06
sigma<-0.3

for(i in 1:n){
	path<-vector(length=k)

	paths[1,i]=5

	for(j in 2:k){
		paths[j,i]=paths[j-1,i]+ mean*division +sigma*sqrt(division)*rnorm(1)
	}
}

cat("Expected Value of w(2) : ",mean(paths[2000,]),"\n")
cat("Expected Value of w(5) : ",mean(paths[5000,]),"\n")

png("que2.png")
matplot(paths,col=1:10,type='l')