/// @file numerical_integration.cpp
/// @author Tina Eghdam Zamiri
/// @date Aug 23, 2022
/// @brief Module for numerical integration.


#include <iostream>
#include <time.h>
#include <iomanip>
#include <omp.h>
#include "ticktock.h"

using namespace std;


double func(double x){
	return 4/(1 + (x*x));
}


double riemann_sum(int partition){
	
	double h = 1 / double(partition);
	double sum = 0;
	#pragma omp parallel for default(none) shared(h, partition) reduction(+:sum)
	for ( int i = 0 ; i < partition; i++ ){
		double x_i = i*h;
		sum += func(x_i);
	}
	return sum / partition;
}


int main(int argc, char *argv[]){
	long long partition = strtol( argv[1], NULL, 10 );
	cout << "number of partitions is: " << partition << endl;
	TickTock tt;
	tt.tick();
	cout << "the riemann sum value is: " << riemann_sum( partition ) << endl;
	tt.tock("Took");
	//cout << "Time taken to do the calculation using parallelization: " << std::fixed 
         //<< time << std::setprecision(5) << endl;
}











