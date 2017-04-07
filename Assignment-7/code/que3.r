n<-50
p<-0.4

invW<-function(u,theta,beta){
	x<--log(1-u)
	y<-x^(1/beta)
	return(y/theta)
}

sample<-vector(length=n)
i<-0
while(i<=n){
	i<-i+1
	
	u1<-runif(1)
	
	if(u1<=p){
		sample[i]<-invW(runif(1),1,2)
	}
	else{
		sample[i]<-invW(runif(1),1,1.5)
	}	
}

cat("Mean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")

png("que3.png")
hist(sample,col='cyan',breaks=10)

