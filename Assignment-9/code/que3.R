n<-10000
a<-c(-0.25,0,0.25)
sigma1<-1
sigma2<-2
mu1<-5
mu2<-8

for(i in 1:length(a)){

	cat("Calculatiog for a = ",a[i],"\n")

	u1<-rnorm(n)
	u2<-rnorm(n)

	x1<-mu1+sigma1*u1
	x2<-mu2+ a[i]*sigma2*(x1-mu1)/sigma1 +
		sqrt((1-a[i]*a[i])*sigma2*sigma2)*u2

	mean1<-mean(x1)
	mean2<-mean(x2)

	var1<-var(x1)
	var2<-var(x2)
	cor_final<-cor(x1,x2)
	cov_final<-cov(x1,x2)

	cat("Mean vector : [",mean1," , ",mean2,"]\n")
	cat("Cov Matrix : [",var1," , ",cov_final,"]\n")
	cat("             [",cov_final," , ",var2,"]\n")
	cat("Correlation : ",cor_final,"\n")

}
