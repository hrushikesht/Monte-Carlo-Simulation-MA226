#include <iostream>
using namespace std;

int arr[100];
double arr2[100];

void genRan(int a, int b, int m,int seed ,int length)
{
	int index=1;
	arr[0]=seed;

	for(int i=1;i<=length;i++)
	{
		arr[i]= (a*arr[i-1]+b)%m;
	}
	for(int i=0;i<=length;++i)
	{
		arr2[i]=arr[i]*1.0/m;
	}


}

int main()
{
	int a,b,m,seed=5,length=50;
	
	a=6;
	b=0;
	m=11;
	for(int i=0;i<=10;i++)
	{ 
		seed=i;
		genRan(a,b,m,seed,length);
		cout<<"Numbers generated for seed = "<<seed<<" : "<<endl;
		for(int i=0;i<=length;i++)
		{
			cout<<arr2[i]<<" ";
		}
		cout<<endl;
	}

	a=3;
	b=0;
	m=11;
	for(int i=0;i<=10;i++)
	{
		seed=i; 
		genRan(a,b,m,seed,length);
		
		cout<<"Numbers generated for seed = "<<seed<<" : "<<endl;
		for(int i=0;i<=length;i++)
		{
			cout<<arr2[i]<<" ";
		}
		cout<<endl;
	}
}