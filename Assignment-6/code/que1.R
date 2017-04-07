n<-100

string<-"hund"

#Box-Muller
u1<-runif(n)
u2<-runif(n)

z1<-sqrt(-2*log(u1))*cos(2*pi*u2)
z2<-sqrt(-2*log(u1))*sin(2*pi*u2)

sample1<-c(z1,z2)

png(paste("que1_",string,"1.png"))
hist(sample1,breaks=50,col="cyan",plot=TRUE)


#Masaglia-Bray
i<-1

r1<-vector(length=n)
r2<-vector(length=n)

while(i<=n){
	u1<-runif(1)
	u2<-runif(1)
	
	u1<-2*u1-1
	u2<-2*u2-1
	
	x<-u1*u1+u2*u2
	if(x < 1){
		temp<-sqrt(-2*log(x)/x)
		r1[i]<-u1*temp
		r2[i]<-u2*temp
		i<-i+1
	}
}

sample2<-c(r1,r2)

png(paste("que1_",string,"2.png"))
hist(sample2,breaks=50,col="cyan",plot=TRUE)

