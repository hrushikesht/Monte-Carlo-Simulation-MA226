g<-function(x)
{
	return((1/2)*exp(-abs(x)))
}

gInv<-function(x)
{
	if(x<1/2)
	{
		return(log(2*x,base=exp(1)))
	}
	else
	{
		return(-log(2*(1-x),base=exp(1)))
	}
}

f<-function(x)
{
	return((1/sqrt(2*pi))*exp(-x*x/2))
}

n=5000
sample<-vector(length=n)
c<-sqrt(2*exp(1)/pi)
acc_count<-0
total_count<-0

i<-1

while(i<=n)
{
	x<-gInv(runif(1))
	
	if(c*g(x)*runif(1)<f(x))
	{
		sample[i]=x
		i<-i+1
		acc_count<-acc_count+1
	}
	total_count<-total_count+1
}

png("que1_in_R.png")
ran<-5
hist(sample,breaks=50,col="red",plot=TRUE,xlim=c(-ran, ran),)

cat("\n")
cat("\nMean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")
cat("Max: ",max(sample),"\n")
cat("Min: ",min(sample),"\n")
cat("Simulated Acccepted Probability: ",acc_count/total_count,"\n")
cat("Theoritical Acccepted Probability: ",1/c,"\n")


