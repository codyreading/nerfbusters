#!/bin/bash
#SBATCH -J nerfbusters     # Name that will show up in squeue
#SBATCH --gres=gpu:1         # Request 1 GPU "generic resource"
#SBATCH --time=0-03:00       # Max job time is 3 hours
#SBATCH --mem=16G            # Max memory (CPU) 16GB
#SBATCH --output=%N-%j.out   # Terminal output to file named (hostname)-(jobid).out
#SBATCH --partition=debug    # Debug partition (allows up to 4 hours runtime)

# The SBATCH directives above set options similarly to command line arguments to srun
# Run this script with: sbatch my_experiment.sh
# The job will appear on squeue and output will be written to the current directory
# You can do tail -f <output_filename> to track the job.
# You can kill the job using scancel <job_id> where you can find the <job_id> from squeue

# Your experiment setup logic here
source ~/miniconda3/etc/profile.d/conda.sh
conda activate nerfbusters


# Note the actual command is run through srun
srun bash scripts/run_baseline.sh

