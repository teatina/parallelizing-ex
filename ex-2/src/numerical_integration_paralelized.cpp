/// @file numerical_integration.cpp
/// @author Tina Eghdam Zamiri
/// @date Aug 23, 2022
/// @brief Module for numerical integration.


#include <iostream>
#include <cmath>
#include <algorithm>
#include <time.h>
#include <iomanip>
#include <omp.h>

using namespace std;


double func(double x){
	return 4/(1 + (x*x));
}


double riemann_sum(int partition){
	double x_i, h = 1 / double(partition);
        double sum = 0;
        #pragma omp parallel for default(none) shared(x_i, h, partition) schedule(dynamic) reduction(+:sum)
        for ( int i = 0 ; i < partition; i++ ){
                x_i = i*h;
                sum += func(x_i);
        }
        return sum / partition;	
}

int main(int argc, char *argv[]){
	long partition = strtol( argv[1], NULL, 10 );
	clock_t start, end;
	double time;
	cout << "number of partitions is: " << partition << endl;
	start = clock();
	cout << "the riemann sum value is: " << riemann_sum( partition ) << endl;
	end = clock();
	time = double(end - start) / double(CLOCKS_PER_SEC);
	cout << "Time taken to do the calculation using parallelization: " << std::fixed 
         << time << std::setprecision(5) << endl;
}











