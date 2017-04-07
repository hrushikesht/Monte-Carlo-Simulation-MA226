library(MASS)

n<-10000
a_arr<-c(-0.25,0,0.25)
mu<-matrix(c(5,8),nrow=2,ncol=1)

for(a in 1:length(a_arr)){

	cat("Calculation for c = ",a_arr[a],"\n")

	sigma<-matrix(c(1,2*a_arr[a],2*a_arr[a],4),nrow=2,ncol=2)

	sigma_root<-matrix(c(sqrt(sigma[1,1]),0,
			a_arr[a]*sqrt(sigma[2,2]),
			sqrt(sigma[2,2]*(1-a_arr[a]*a_arr[a]))),
			nrow=2,ncol=2,byrow=TRUE)

	sample1<-vector(length=n)
	sample2<-vector(length=n)

	for(i in 1:n){
		normal_mat<-matrix(c(rnorm(1),rnorm(1)),nrow=2,ncol=1,byrow=TRUE)

		mat<-mu+sigma_root %*% normal_mat

		sample1[i]<-mat[1,1]
		sample2[i]<-mat[2,1]
	}

	mean1<-mean(sample1)
	mean2<-mean(sample2)
	var1<-var(sample1)
	var2<-var(sample2)
	cov_final<-cov(sample1,sample2)
	cor_final<-cor(sample1,sample2)

	cat("Mean vector : [",mean1," , ",mean2,"]\n")
	cat("Cov Matrix : [",var1," , ",cov_final,"]\n")
	cat("             [",cov_final," , ",var2,"]\n")
	cat("Correlation : ",cor_final,"\n")

	png(paste("cdf_sample1_",toString(a),".png"))
	plot(ecdf(rnorm(n,mean=mu[1,1],sd=sqrt(sigma[1,1]))),col='cyan')
	par(new=TRUE)
	plot(ecdf(sample1),col='red')

	png(paste("cdf_sample2_",toString(a),".png"))
	plot(ecdf(rnorm(n,mean=mu[2,1],sd=sqrt(sigma[2,2]))),col='cyan')
	par(new=TRUE)
	plot(ecdf(sample2),col='red')

	z<-kde2d(sample1,sample2)
	png(paste("contour_plot_",toString(a),".png"))
	contour(z)
	dev.off()
}
