square<-function(u1,u2){
	return (u1**2+u2**2)
}
temp<-function(x){
	return (sqrt(-2*log(x)/x))
}

n<-10000
stime<-Sys.time();
sample1<-c()
sample2<-c()
i<-1
while(n>=0){
	u1<-runif(1)
	u2<-runif(1)
	u1<-2*u1-1
	u2<-2*u2-1
	x<-square(u1,u2)
	if(x>1){
		next
	}
	y<-temp(x)
	sample1[i]<-u1*y
	sample2[i]<-u2*y
	i<-i+1
	n<-n-2
}
sample<-c(sample1,sample2)
etime<-Sys.time();
cat("Computation Time of Marsaglia-Bray Method: ",etime-stime,"\n");
