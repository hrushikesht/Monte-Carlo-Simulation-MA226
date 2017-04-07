#include <bits/stdc++.h>
#define ll long long int

using namespace std;

int arr[100010];
double uniform[100010];
double exponential[100010];

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

double fInv(double x)
{
	return (-5*log(1-x));
}

void genExpo(int length)
{
	for(int i=1;i<=length;i++)
	{
		exponential[i]=fInv(uniform[i]);
	}
}

double calMean(int length)
{
	double total=0;
	for(int i=1;i<=length;++i)
	{
		total+=exponential[i];
	}
	return total*1.0/length;
}

double getMax(int length)
{
	double maxito=0;
	for(int i=1;i<=length;++i)
	{
		maxito=max(maxito,exponential[i]);
	}
	return maxito;
}


double getMin(int length)
{
	double minito=0;
	for(int i=1;i<=length;++i)
	{
		minito=min(minito,exponential[i]);
	}
	return minito;
}

double calVar(double mean,int length)
{
	double total=0;
	for(int i=0;i<=length;++i)
	{
		total+= (exponential[i]-mean)*(exponential[i]-mean);
	}
	return total/length;
}

int main()
{
	ll n=5000;
	genUni(n);
	genExpo(n);

	double mean=calMean(n);
	double var=calVar(mean,n);

	cout<<"Mean: "<<mean<<endl;
	cout<<"Var: "<<var<<endl;

	cout<<"Max: "<<getMax(n)<<endl;
	cout<<"Minimum: "<<getMin(n)<<endl;
}
