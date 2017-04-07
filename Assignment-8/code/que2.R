e<-c(2,3,4,5)
for(x in e){
	cat("\nSample Size: ",x,"\n")
	M<-10^x

	u1<-runif(M)
	u2<-runif(M)

	sample<-(exp(u1^(1/2))+exp(u1^(1/2)))/2

	cat("Mean without-antithetic : ",mean(sample),"\n")
	cat("Variance without-antithetic : ",var(sample),"\n")

	var_original<-var(sample)


	u1<-runif(M)
	u2<-1-u1

	sample1<-exp(u1^(1/2))
	sample2<-exp(u2^(1/2))
	sample<-(sample1+sample2)/2

	mean_sample<-mean(sample)
	var_sample<-var(sample)

	cat("Mean of Y : ",mean(sample),"\n")
	cat("Variance of Y : ",var(sample),"\n")

	cat("Percentage reduction in Variance: ",
		(var_original-var(sample))/(var_original)*100," %\n")
	alpha<-0.05
	x<-mean_sample-qnorm(1-alpha/2)*var_sample/sqrt(M)
	y<-mean_sample+qnorm(1-alpha/2)*var_sample/sqrt(M)
	cat("Confidence Interval: (",x," , ",y,")","\n")
}
