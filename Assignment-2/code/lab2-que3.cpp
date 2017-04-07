#include <iostream>
#include <cmath>
#include <fstream>
using namespace std;

int main()
{
	int a,b,m,length=100000;
	ofstream f;
	f.open("lab2_que3_data.csv");
	a=1229;
	b=1;
	m=2048;

	int seed=7;

	f<<seed<<",";

	for(int i=0;i<=length;i++)
	{
		seed=(a*seed+b)%m;
		f<<seed<<"\n";
		f<<seed<<",";
	}
	f<<(a*seed+b)%m<<"\n";
}
