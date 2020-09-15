CUDA_ROOT=/usr/local/cuda-10.0
TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')


echo $CUDA_ROOT
echo $TF_INC
echo $TF_LIB

CXX11=-D_GLIBCXX_USE_CXX11_ABI=1
ltensor=-l:libtensorflow_framework.so.1



$CUDA_ROOT/bin/nvcc approxmatch/tf_approxmatch_g.cu -o approxmatch/tf_approxmatch_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC

# TF>=1.4.0
g++ -std=c++11 approxmatch/tf_approxmatch.cpp approxmatch/tf_approxmatch_g.cu.o -o approxmatch/tf_approxmatch_so.so -shared -fPIC -I$TF_INC/ -I$TF_INC/external/nsync/public -L$TF_LIB $ltensor -I$CUDA_ROOT/include -lcudart -L$CUDA_ROOT/lib64/ -O2 $CXX11

$CUDA_ROOT/bin/nvcc nn_distance/tf_nndistance_g.cu -o nn_distance/tf_nndistance_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC


g++ -std=c++11 nn_distance/tf_nndistance.cpp nn_distance/tf_nndistance_g.cu.o -o nn_distance/tf_nndistance_so.so -shared -fPIC -I$TF_INC/ -I$TF_INC/external/nsync/public -L$TF_LIB $ltensor -I$CUDA_ROOT/include -lcudart -L$CUDA_ROOT/lib64/ -O2 $CXX11
