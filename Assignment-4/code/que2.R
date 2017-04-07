
fInv<- function(x)
{
	return(-(1/5.0)*log(1-x))
}

n=5000
sample<-vector(length=n)

cat("Sample vales are:")
for (i in 1:5000)
{
	u<-runif(5,0,1)
	sample[i]=sum(fInv(u))
	cat(i," -> ",sample[i],"\n")
}

png("que2_in_R.png")
hist(sample,breaks=50,col="red",plot=TRUE)

cat("\n")
cat("\nMean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")
cat("Max: ",max(sample),"\n")
cat("Min: ",min(sample),"\n")
