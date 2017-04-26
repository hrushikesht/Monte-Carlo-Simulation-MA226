baseRep<-function(n,b){
	vec<-c()
	i<-1
	while(n!=0){
		vec<-c(vec,n%%b)
		n<-n/b-(n%%b)/b
	}
	return(vec)
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

N<-c(100,100000)
for(n in N){

	base_2<-c()
	base_3<-c()

	for(i in 1:n){
		base_2<-c(base_2,VanderCorput(i,2))
		base_3<-c(base_3,VanderCorput(i,3))
	}
	png(paste("que2",n,".png"))
	plot(base_2,base_3)
}