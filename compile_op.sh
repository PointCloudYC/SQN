cd utils/nearest_neighbors
python setup.py install --home="."
cd ../../

cd utils/cpp_wrappers
sh compile_wrappers.sh
cd ../../

cd tf_ops/3d_interpolation
sh tf_interpolate_compile.sh
cd ../../

cd tf_ops/grouping
sh tf_grouping_compile.sh
cd ../../

cd tf_ops/sampling
sh tf_sampling_compile.sh
cd ../../
