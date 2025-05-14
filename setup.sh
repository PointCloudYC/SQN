# SQ is the conda env name
# conda create -n sqn3 python=3.6 -y
# conda activate sqn3

# install tensorflow-gpu 1.11.0, NOTE: other versions are not suitable, including 1.13.1, 1.14.0, 1.15.2, see yc.md
# conda install tensorflow-gpu==1.13.1
conda install tensorflow-gpu==1.11.0

# install other dependencies
pip install -r helper_requirements.txt

# compile the sub-sampling and knn op
# to avoid the error: _ZTIN10tensorflow8OpKernelE, open tf_{sampling,grouping,interpolation}_compile.sh and comment the -D_GLIBCXX_USE_CXX11_ABI=0, recompile the scripts, see https://github.com/PointCloudYC/SQN_tensorflow/tree/main/tf_ops
sh compile_op.sh

