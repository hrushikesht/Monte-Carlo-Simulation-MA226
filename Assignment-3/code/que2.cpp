#include <bits/stdc++.h>

using namespace std;
#define ll long long int

ll arr[100010];
double normalised[100010];
int counter[100010]={0};

ll mod=2147483648;

void genRan(ll seed ,ll length,ll k)
{
	int index=1;
	arr[0]=seed;
	double div=1.0/k;

	ll a=4062;
	ll m=2147483399;

	ll q=m/a;
	ll r=m%a;

	for(int i=1;i<=length;i++)
	{
		ll x = a*(arr[i-1])%m - (arr[i-1]/q)*r;
		if(x<0)
		{
			x=x+m;
		}
		arr[i]= x;
	}
	for(int i=0;i<=length;++i)
	{
		ll a=floor((arr[i]*1.0/m)/div);
		counter[a+1]++;
	}
}

void genFib(int length,int k)
{
	genRan(7,17,20);
	double div=1.0/k;

	for(int i=18;i<=length;i++)
	{
		arr[i]=(arr[i-17]+arr[i-5])%mod;
	}
	for(int i=0;i<=length;++i)
	{
		ll a=floor((arr[i]*1.0/mod)/div);
		counter[a+1]++;
	}
}

double calMean(int length)
{
	double total=0;
	for(int i=1;i<=length;++i)
	{
		total+=normalised[i];
	}
	return total*1.0/length;
}

double calVar(double mean,int length)
{
	double total=0;
	for(int i=0;i<=length;++i)
	{
		total+= (normalised[i]-mean)*(normalised[i]-mean);
	}
	return total/length;
}

void normalise(int length)
{
	for(int i=1;i<=length;++i)
	{
		normalised[i]=arr[i]*1.0/mod;
	}
}

double calACLag(double mean,double var,int l,int length)
{
	double denom = var*length;
	double num=0;
	for(int i=l;i<=length;++i)
	{
		num+=(normalised[i]-mean)*(normalised[i-l]-mean);
	}
	return num/denom;
}

int main()
{
	int length=1000;
	genFib(length,20);
	normalise(length);

	double mean = calMean(length);
	double var = calVar(mean,length);

	cout<<"Mean: "<<mean<<endl;
	cout<<"Variance: "<<var<<endl;

	cout<<"lag 1: "<<calACLag(mean,var,1,length)<<endl;
	cout<<"lag 2: "<<calACLag(mean,var,2,length)<<endl;
	cout<<"lag 3: "<<calACLag(mean,var,3,length)<<endl;
	cout<<"lag 4: "<<calACLag(mean,var,4,length)<<endl;
	cout<<"lag 5: "<<calACLag(mean,var,5,length)<<endl;

	cout<<endl;
}