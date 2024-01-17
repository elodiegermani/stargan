#!/bin/bash
#SBATCH --job-name=test-stargan-4class # nom du job
#SBATCH --ntasks=1                   # number of MP tasks
#SBATCH --ntasks-per-node=1          # number of MPI tasks per node
#SBATCH --gres=gpu:1                 # number of GPUs per node
#SBATCH --cpus-per-task=16           # number of cores per tasks
#SBATCH --hint=nomultithread         # we get physical cores not logical
#SBATCH --distribution=block:block   # we pin the tasks on contiguous cores
#SBATCH --time=4:00:00              # maximum execution time (HH:MM:SS)
#SBATCH --output=stargan-4class-test%j.out # output file name
#SBATCH --error=stargan-4class-test%j.err  # error file name

source /gpfswork/rech/gft/umh25bv/miniconda3/bin/activate /gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv

# /gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv/bin/python3 -u preprocessing.py

/gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv/bin/python3 -u /gpfswork/rech/gft/umh25bv/stargan/src/main.py \
--mode test --dataset dataset_rh_4class-jeanzay --labels pipelines --image_size 56 \
--c_dim 4 --batch_size 1 --data_dir data \
--sample_dir samples-4class --log_dir logs \
--model_save_dir models-4class --test_iters 100000 