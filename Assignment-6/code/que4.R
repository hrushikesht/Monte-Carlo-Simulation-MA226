square<-function(u1,u2){
	return (u1**2+u2**2)
}
temp<-function(x){
	return (sqrt(-2*log(x)/x))
}

rejected<-0
n<-10000
ct<-n
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
		rejected<-rejected+1
		next
	}
	y<-temp(x)
	sample1[i]<-u1*y
	sample2[i]<-u2*y
	i<-i+1
	n<-n-2
}

cat("Rejection Percentage: ",rejected/(rejected+(ct/2)),"\n")
