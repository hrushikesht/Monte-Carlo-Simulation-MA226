n<-100

string<-"ten-thou"


#Box-Muller
u1<-runif(n)
u2<-runif(n)

z1<-sqrt(-2*log(u1))*cos(2*pi*u2)
z2<-sqrt(-2*log(u1))*sin(2*pi*u2)

sample1<-c(z1,z2)

samplex<-sqrt(5)*sample1
sampley<-sqrt(5)*sample1+5


png("que2_one.png")
plot(ecdf(samplex),col="red")
par(new=TRUE)
samplex<-sort(samplex)
plot(pnorm(samplex,mean=0,sd=sqrt(5)),col="cyan")


png("que2_two.png")
plot(ecdf(sampley),col="red")
par(new=TRUE)
sampley<-sort(sampley)
plot(pnorm(sampley,mean=5,sd=sqrt(5)),col="cyan")
