mean<-c(0.06,-0.06)
sigma<-c(0.3,0.4)

interval<-c(0,5)
n<-1000
k<-5000

division<-(interval[2]-interval[1])/k
sqr_division<-division^(1/2)

theoEx<-function(s0,mu,t){
	return(s0*exp(mu*t))
}

theoVar<-function(s0,mu,sd,t){
	return(s0*s0*exp(2*mu*t)*(exp(sd*sd*t)-1))
}

for(mu in mean){
	for(sd in sigma){

		paths<-matrix(nrow=k,ncol=n)

		for(i in 1:n){

			paths[1,i]<-5

			for(j in 2:k){
				paths[j,i]<-paths[j-1,i]*exp( (mu-((sd^2)/2))*division + sd*sqr_division*rnorm(1) )
			}
		}
		cat("For mu=",mu,"and sigma=",sd,"\n")
		cat("Observed Expectation = ",mean(paths[5000,]),"\n")
		cat("Observed Variance = ",var(paths[5000,]),"\n")
		cat("Theoritical Expection = ",theoEx(5,mu,5),"\n")
		cat("Theoritical Variance = ",theoVar(5,mu,sd,5),"\n\n")
	}
}
