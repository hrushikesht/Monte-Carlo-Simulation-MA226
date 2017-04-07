n<-50
p<-0.5
q<-1-p

u<-runif(n)

sample<-as.integer((log(u)/log(q)))+1

cat("Mean: ",mean(sample),"\n")
cat("Variance: ",var(sample),"\n")

png("que1.png")
hist(sample,col="red",plot=TRUE)

