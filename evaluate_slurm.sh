#!/bin/bash
# NOTE: before running this do `conda activate vista`.
# NOTE: Run from vista_eval directory
# Example: 'sbatch evaluate_slurm.sh --model ./models/pilotnet.onnx --traces trace_forward --traces-root ./traces/ --save-video'

# Job Details
#SBATCH --partition=gpu
#SBATCH -J vista
#SBATCH --output=./vista_slurm/%j-slurm-run.txt 
#SBATCH --error=./vista_slurm/%j-slurm-run.err

# Resources
#SBATCH -t 23:59:00
#SBATCH --gres=gpu:tesla:1
#SBATCH --exclude=falcon2

# Actual job command(s)
module load ffmpeg
srun python -u evaluate.py "$@"
