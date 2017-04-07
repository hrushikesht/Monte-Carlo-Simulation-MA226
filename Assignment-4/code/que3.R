f<-function(x)
{
	return(20*x*(1-x)*(1-x)*(1-x))
}

n=10000
sample<- vector(length=n)

index<-1
c<-2.5

while (index<n)
{
	u1<-runif(1)
	u2<-runif(1)

	if(c*u2 < f(u1))
	{
		sample[index]=u1
		index<-index+1
	}
}

png("que3_in_R.png")
hist(sample,breaks=50,col="red",plot=TRUE)

cat("Mean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")
cat("Max: ",max(sample),"\n")
cat("Min: ",min(sample),"\n")
