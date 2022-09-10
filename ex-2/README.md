## Numerical Integration Exercise that calculates the value of Pi using left Riemann sum

This code implements a left Riemann sum that calculates the value of Pi. It is done by using a loop that calculates different number of partitions. The purpose of this exercise is to use OpenMP to see the difference between serial vs. parallelized code. This difference can be seen using two different scaling analysis, Weak scaling otherwise known as Gustafson's law and Strong scaling otherwise known as Amdahl's law. To see how the program behaves depending on the number of threads, the following .txt files is provided:

  - output-ws.txt : File that shows Weak Scaling which is using different number of threads and different problem size.
  
  - output-ss.txt : File that shows Strong Scaling which is using different number of threads while keeping the problem size fixed



To Run (On Teach Cluster):

make build

sbatch openmp_numerical_integration.sh

