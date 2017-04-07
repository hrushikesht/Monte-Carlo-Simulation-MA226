#include <iostream>
#include <cmath>
#include <fstream>
#include <iomanip>

using namespace std;

int seed[6]={1,9999,6879,443};
int arr[100010];
int count[6][100010];

void genRan(int a, int b, int m,int length,int k)
{
	double div=1.0/k;
	for(int j=1;j<=5;++j)
	{
		arr[0]=seed[j];

		for(int i=1;i<=length;++i)
		{
			arr[i]=(a*arr[i-1]+b)%m;
		}
		for(int i=1;i<=length;++i )
		{
			int a=floor((arr[i]*1.0/m)/div);
			count[j][a+1]++;
		}
	}
}


int main()
{
	int k=20;
	int a,b,m,length=100000;
	m=244944;
	a=51749;
	// a=1597
	b=0;

	// ofstream f;
	// f.open("lab2_que2_data.csv");

	genRan(a,b,m,length,k);

	// cout<<setprecision()

	for(int i=1;i<=5;i++)
	{
		// f<<seed[i]<<",";
	}
	// f<<"\n";

	cout<<"count        "<<seed[1]<<"  "<<seed[2]<<"  "<<seed[3]<<endl; 
	for(int i=1;i<=k;++i)
	{
		cout<<setprecision(2)<<fixed;
		cout<<1.0*(i-1)/k<<"-"<<1.0*i/k<<"    ";
		for(int j=1;j<=3;++j)
		{
			// f<<count[j][i]<<",";
			cout<<count[j][i]<<" ";
		}
		// f<<"\n";
		cout<<endl;
	}

}