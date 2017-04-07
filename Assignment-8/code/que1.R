e<-c(2,3,4,5)
for(x in e){
	cat("\nSample Size: ",x,"\n")
	M<-10^x
	alpha<-0.05

	u<-runif(M)
	sample<-exp(u^(1/2))

	var_sample<-var(sample)
	mean_sample<-mean(sample)

	x<-mean_sample-qnorm(1-alpha/2)*var_sample/sqrt(M)
	y<-mean_sample+qnorm(1-alpha/2)*var_sample/sqrt(M)

	cat("Mean: ",mean_sample,"\n")
	cat("Variance: ",var_sample,"\n")
	cat("Confidence Interval: (",x," , ",y,")","\n")
}
