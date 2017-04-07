radius<-function(u){
	return (-2*log(u))
}
arg<-function(u){
	return (2*pi*u)
}
n<-10000
stime<-Sys.time();
sample1<-c()
sample2<-c()
for(i in 1:n/2){
	u1<-runif(1)
	u2<-runif(1)
	sample1[i]<-sqrt(radius(u1))*cos(arg(u2))
	sample2[i]<-sqrt(radius(u1))*sin(arg(u2))
}


sample<-c(sample1,sample2)
etime<-Sys.time();
cat("Computation Time of Box-Muller Method: ",etime-stime,"\n");
