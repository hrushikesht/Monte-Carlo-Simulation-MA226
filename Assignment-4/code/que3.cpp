#include <bits/stdc++.h>
#define ll long long int

using namespace std;

int arr[100010];
double uniform[1000010];
double sample[1000010];

void genUni(ll length,ll seed=7)
{
	arr[0]=seed;

	ll a=40692;
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
		uniform[i]=x*1.0/m;
	}
}

double f(double x)
{
	return 20*x*(1-x)*(1-x)*(1-x);
}

void acceptReject(ll n)
{
	int i=0,index=1;
	while(index<=n)
	{
		double u1=uniform[i];
		double u2=uniform[i+50000];

		double c=2.5;

		if(c*u2 < f(u1))
		{
			sample[index++]=u1;
		}
		i++;
	}
}

double getMax(int length)
{
	double maxito=0;
	for(int i=1;i<=length;++i)
	{
		maxito=max(maxito,sample[i]);
	}
	return maxito;
}


double getMin(int length)
{
	double minito=0;
	for(int i=1;i<=length;++i)
	{
		minito=min(minito,sample[i]);
	}
	return minito;
}

double calVar(double mean,int length)
{
	double total=0;
	for(int i=0;i<=length;++i)
	{
		total+= (sample[i]-mean)*(sample[i]-mean);
	}
	return total/length;
}

double calMean(int length)
{
	double total=0;
	for(int i=1;i<=length;++i)
	{
		total+=sample[i];
	}
	return total*1.0/length;
}


int main()
{
	ll n=5000;
	genUni(n*200);
	acceptReject(n);

	double mean=calMean(n);
	double var=calVar(mean,n);

	cout<<"Mean: "<<mean<<endl;
	cout<<"Var: "<<var<<endl;

	cout<<"Max: "<<getMax(n)<<endl;
	cout<<"Minimum: "<<getMin(n)<<endl;
}