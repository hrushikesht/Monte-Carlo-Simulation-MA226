baseRep<-function(n,b){
	vec<-c()
	i<-1
	while(n!=0){
		vec<-c(vec,n%%b)
		n<-n/b-(n%%b)/b
	}
	return(vec)
}

lcg<-function(a,b,m,seed,n){
	ans<-vector(length=n)
	ans[1]=seed
	for(i in 2:n){
		ans[i]<-((ans[i-1]*a+b)%%m)
	}
	return(ans/m)
}


VanderCorput<-function(n,b){
	rev_base_rep<-baseRep(n,b)
	m<-length(rev_base_rep)

	ans<-0
	expo<-1/b
	for(i in 1:m){
		ans<-ans+rev_base_rep[i]*expo
		expo<-expo/b
	}
	return(ans)
}

base<-2

# Printing First 25 numbers
N<-25
for(i in 1:N){
	cat("i->",i," rep = ",VanderCorput(i,base),"\n")
}

# Overlapping pair plots
N<-1000
X<-c()
for(i in 1:N){
	X<-c(X,VanderCorput(i,base))
}
Y<-X[2:N]
X<-X[1:N-1]
png("que1_overlapping.png")
plot(X,Y)

# Histograms

# VanderCorput
N<-c(100,100000)
for(n in N){

	ans<-c()
	for(i in 1:n){
		ans<-c(ans,VanderCorput(i,base))
	}
	print(n)
	png(paste("que1_histogram",n,".png"))
	par(mfrow=c(1:2))
	hist(ans,breaks=10,col='cyan',main="Histogram for VanDerCorput")
	hist(lcg(16807,0,2^(31)-1,5,n),breaks=10,col='red',main="Histogram of LCG")
}
