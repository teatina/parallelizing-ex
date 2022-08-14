#!/bin/bash
#SBATCH --ntasks=16
#SBATCH --time=00:20:00
#SBATCH --output=sweep_bondbreak_output.txt
#SBATCH --job-name=parallel-bond

# This is the sweep_bondbreak.sh script

module load python # bondbreak needs python

module load gnu-parallel

# Run multiple cases with different random seeds
X=1.2      # initial bond extension
T=2.2      # temperature
DT=0.0003  # timestep
MT=400.0   # max.time to simulate
ODT=1.0    # interval at which write data
NREPS=96   # how many repeats


#for ((S=1; S<=NREPS; S++)) ; do
# echo "Repetition $S/$NREPS"
# DFN=out/output-$T-$S.data
# LFN=out/output-$T-$S.log
# time ./bondbreak $X $T $DT $MT $S $DFN $ODT $LFN
#done

## have to figure out DFN and LFN 
##parallel --joblog slurm-$SLURM_JOBID.log "./bondbreak $X $T $DT $MT $S $DFN $ODT $LFN"

## or this way to include DFN and LFN

parallel --joblog slurm-$SLURM_JOBID.log "./bondbreak $X $T $DT $MT $S out/output-$T-{}.data $ODT out/output-$T-{}.log" ::: {01..NREPS}

# Extract the breakage times from the logs
awk '/BREAKAGE DETECTED/{print $8}' out/*.log
