#include <bits/stdc++.h>
#include <iomanip>

using namespace std;
#define ll long long int

ll arr[100010];
int counter[4][100010]={0};

ll big = 2147483647;

ll a_arr[4]={0,16807,40692,40014};
ll m_arr[4]={0,big , 2147483399, 2147483563 };


void genRan(ll seed ,ll length,ll k)
{
	int index=1;
	arr[0]=seed;
	double div=1.0/k;


	for(int j=1;j<=3;++j)
	{
		ll a=a_arr[j];
		ll m=m_arr[j];

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
			counter[j][a+1]++;
		}
	}
}



int main()
{
	cout<<"Enter the length";

	long long int length; cin>>length;

	int seed=7;
	int k=20;

	genRan(seed,length,20);	
	
	//Prints Frequency
	for(int j=1;j<=20;++j)
	{

		cout<<std::setprecision(2)<<fixed;
		cout<<1.0*(j-1)/k<<"-"<<1.0*j/k<<" ";
		for(int i=1;i<=3;i++)
		{
			cout<<counter[i][j]<<" ";
		}
		cout<<endl;
	}
}
