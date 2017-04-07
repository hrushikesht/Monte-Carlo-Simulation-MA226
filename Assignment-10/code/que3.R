interval<-c(0,5)
n<-10
paths<-matrix(nrow=5000,ncol=10)
k<-5000

division<-(interval[2]-interval[1])/5000


mu<-function(x){
	return(0.0325 - 0.05*x)
}

sig<-function(x){
	return(0.012+0.0138*x+0.00125*(x^2))
}

for(i in 1:n){

	paths[1,i]=5

	for(j in 1:(k-1)){
		paths[j+1,i]<-paths[j,i]+ mu((j-1)*division)*division +
			 sig((j-1)*division)*sqrt(division)*rnorm(1)
	}
}

cat("Expected Value of w(2) : ",mean(paths[2000,]),"\n")
cat("Expected Value of w(5) : ",mean(paths[5000,]),"\n")

png("que3.png")
matplot(paths,col=1:10,type='l')
