/// @file numerical_integration.cpp
/// @author Tina Eghdam Zamiri
/// @date Aug 19, 2022
/// @brief Module for numerical integration.


#include <iostream>
#include <cmath>
#include <algorithm>


using namespace std;


double func(double x){
	return 4/(1 + (x*x));
}


double riemann_sum(int partition){
	double x_i, h = 1 / double(partition);
	double sum = 0;
	for ( int i = 0 ; i < partition; i++ ){
		x_i = i*h;
		sum += func(x_i);
	}
	return sum / partition;
}


int main(int argc, char *argv[]){
	long partition = strtol( argv[1], NULL, 10 );
	cout << "number of partitions is: " << partition << endl;
	cout << "the riemann sum value is: " << riemann_sum( partition ) << endl;

}











