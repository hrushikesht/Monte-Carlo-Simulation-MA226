/*
	MA226 Monte-Carlo Assignment Code
*/

#include <iostream>
#include <cmath>

#define e  2.71828182845904523536
#define DEBUG(x) cout << '>' << #x << ':' << x << endl;
using namespace std;

//Given function: 3x^2-e^x


double f(double x) //Function to return value of 3x^2-e^x
{
	return 3.0*pow(x,2) - 1.0*pow(e,x);
}

double f_dash(double x)  //Funtion which returns value of the derivative of given function
{
	return 6.0*(x)-1.0*pow(e,x);
}

int main()
{
	//seting the tolerance value
	double epsilon= 1e-5;

	double initial_guess;

	//Taking Initial Guess as an input
	cout<<"Enter Initial Guess: ";
	cin>>initial_guess;

	double x_i,x_j;
	x_j=initial_guess;

	//The Newton Raphson Algorithm
	do
	{
		x_i=x_j;
		x_j = x_j- (f(x_j)/f_dash(x_j));
	}
	while(abs(x_j-x_i)>epsilon);

	cout<<"Value of f at found solution -> "<<f(x_j)<<endl;
	cout<<"Found solution -> "<<x_j<<endl;
}
