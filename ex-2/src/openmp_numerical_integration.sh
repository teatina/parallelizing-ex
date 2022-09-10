#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --time=00:20:00
#SBATCH --output=output.txt
#SBATCH --job-name=parallel-bond


#module load gcc

module load gnu-parallel

#for i in 1 2 4 8 16 ; do
 #export OMP_NUM_THREADS=$i
 #echo number of threads
 #echo $i
 #export power=$((10**${i}))
 #parallel --joblog slurm-$SLURM_JOBID.log ./para `expr 10**{}` ::: $(seq 1 12) >> "output{}.txt" ::: $(seq 1 56)
 #parallel --joblog slurm-$SLURM_JOBID.log ./para `"echo 10^{} | bc" {1 .. 11}` >> "output{}.txt" ::: $(seq 1 56)
 #parallel --joblog slurm-$SLURM_JOBID.log ./para "`$((10**$EXPVALUE))` $EXPVALUE={}" ::: {1 .. 11} >> "output{}.txt" ::: {1 .. 56}
 #parallel --joblog slurm-$SLURM_JOBID.log ./para "`expr 10**{}`" ::: {1 .. 12} >> "output{}.txt" ::: $(seq 1 56)
#done


#for i in {1..11}; do
# power=$((10**$i))
 #echo number of threads
# ./para $power >> youtput.txt
# export OMP_NUM_THREADS=8
# parallel --joblog slurm-$SLURM_JOBID.log export OMP_NUM_THREADS=8 ./para `10**$i` >> xoutput.txt 
# echo $OMP_NUM_THREADS
# echo $power
#done


##### Strong Scaling:
for i in 1 2 4 8 16; do
 power=$((10**8))
 power=$((10**10))
 echo number of threads
 echo $i
 echo number of threads >> output-ss.txt
 echo $i >> output-ss.txt
 export OMP_NUM_THREADS=$i
 echo ${OMP_NUM_THREADS}
 time ./para $power >> output-ss.txt
done

#### Weak Scaling:
for i in 1 2 4 8 16; do
 power=$((10*$i))
 echo number of threads
 echo $i
 echo number of threads >> output-ws.txt
 echo $i >> output-ws.txt
 export OMP_NUM_THREADS=$i
 echo ${OMP_NUM_THREADS}
 time ./para $power >> output-ws.txt
done


wait










