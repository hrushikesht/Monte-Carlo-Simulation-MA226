mean<-c(0.06,-0.06)
sigma<-c(0.3,0.4)

interval<-c(0,5)
n<-10
k<-5000

division<-(interval[2]-interval[1])/k
sqr_division<-division^(1/2)

for(mu in mean){
	for(sd in sigma){

		paths<-matrix(nrow=k,ncol=n)

		for(i in 1:n){

			paths[1,i]<-5

			for(j in 2:k){
				paths[j,i]<-paths[j-1,i]*
				exp((mu-(sd^2)/2)*division+
					sd*sqr_division*rnorm(1) )
			}
		}

		filename<-paste("que1_",mu,"_",sd,".png")
		png(filename)
		matplot(paths,col=1:10,type='l')
	}
}
