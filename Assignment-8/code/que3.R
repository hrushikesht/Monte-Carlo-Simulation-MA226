#control variate

e<-c(2,3,4,5)
for(x in e){
	cat("\nSample Size: ",x,"\n")

	M<-10^x
	#simulation to estimate correlation
	u1<-sqrt(runif(M))
	u2<-exp(u1)
	c<-(cov(u1,u2))/var(u1)

	#variance reduction
	#sam<-exp(sqrt(u1))
	w<-u2 + c*(0.66 - u1)

	cat("Mean of sample : ",mean(w),"\n")
	cat("Variance of sample : ",var(w),"\n")

	cat("Percentage reduction in Variance: ",
		(var(u2)-var(w))/(var(u2))*100," %\n")

	mean_sample<-mean(w)
	var_sample<-var(w)
	alpha<-0.05
	x<-mean_sample-qnorm(1-alpha/2)*var_sample/sqrt(M)
	y<-mean_sample+qnorm(1-alpha/2)*var_sample/sqrt(M)
	cat("Confidence Interval: (",x," , ",y,")","\n")
}
