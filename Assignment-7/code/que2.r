n<-50
param<-2

sample<-vector(length=n)
i<-0


while(i<=n){
	i<-i+1
	u<-runif(1)
		
	p<-exp(-param)
	f<-p
	
	j<-0
	while(1){
		if(u<f){
			sample[i]<-j
			break
		}
		p<-p*param/(j+1)
		f<-f+p
		j<-j+1
	}
}

cat("Mean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")


png("que2.png")
hist(sample,col="cyan",plot=TRUE)

cdf<-ecdf(sample)
png("que2_cdf.png")
plot(cdf)

