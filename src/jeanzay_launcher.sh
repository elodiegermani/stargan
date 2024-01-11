#!/bin/bash
#SBATCH --job-name=stargan-2class-30grp # nom du job
#SBATCH --ntasks=1                   # number of MP tasks
#SBATCH --ntasks-per-node=1          # number of MPI tasks per node
#SBATCH --gres=gpu:1                 # number of GPUs per node
#SBATCH --cpus-per-task=16           # number of cores per tasks
#SBATCH --hint=nomultithread         # we get physical cores not logical
#SBATCH --distribution=block:block   # we pin the tasks on contiguous cores
#SBATCH --time=12:00:00              # maximum execution time (HH:MM:SS)
#SBATCH --output=stargan-2class-30grp%j.out # output file name
#SBATCH --error=stargan-2class-30grp%j.err  # error file name
#SBATCH --qos=qos_gpu-t4

source /gpfswork/rech/gft/umh25bv/miniconda3/bin/activate /gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv

# /gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv/bin/python3 -u preprocessing.py

/gpfswork/rech/gft/umh25bv/miniconda3/envs/workEnv/bin/python3 -u /gpfswork/rech/gft/umh25bv/stargan/src/main.py \
--mode test --dataset dataset_rh_2class_spm-jeanzay --labels pipelines --image_size 56 \
--c_dim 2 --batch_size 1 --data_dir data \
--sample_dir samples-2class-spm --log_dir logs \
--model_save_dir models-2class-spm --test_iters 50000 