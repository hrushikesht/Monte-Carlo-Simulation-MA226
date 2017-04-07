n<-1000
dist<-c(0.05,0.25,0.45,0.15,0.1)
cdf<-c(0.05,0.25,0.45,0.15,0.1)
sample<-vector(length=n)

fInv<-function(x)
{
	i<-1
	while(cdf[i]<=x)
	{
		i<-i+1
		print(i)
	}
	return( i)
}

for(i in 2:5)
{
	cdf[i]<-cdf[i]+cdf[i-1]
}

for(i in 1:n)
{
	sample[i]=fInv(runif(1))
}

png("que3_in_R.png")
hist(sample,breaks=50,col="red",plot=TRUE)

print(sample)

cat("\n")
cat("\nMean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")
cat("Max: ",max(sample),"\n")
cat("Min: ",min(sample),"\n")

