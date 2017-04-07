n<-10
dist<-c(0.05,0.25,0.45,0.15,0.1)
cdf<-c(0.05,0.25,0.45,0.15,0.1)
sample<-vector(length=n)

for(i in 2:5)
{
	cdf[i]<-cdf[i]+cdf[i-1]
}

i<-1
c<-0.45
lim<-5
while(i<=n)
{
	x<-lim*runif(1)
	x<-floor(x)+1
	px<-dist[x]

	if(c*runif(1)<px)
	{
		sample[i]=x
		i<-i+1
	}
}

# genDiscrete()
png("que3b_in_R.png")
hist(sample,breaks=50,col="red",plot=TRUE)

print(sample)

cat("\n")
cat("\nMean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")
cat("Max: ",max(sample),"\n")
cat("Min: ",min(sample),"\n")