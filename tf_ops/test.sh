CUDA_ROOT=/usr/local/cuda-10.0
TF_INC=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_include())')
TF_LIB=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_lib())')
TF_CFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_compile_flags()))') )
TF_LFLAGS=( $(python -c 'import tensorflow as tf; print(" ".join(tf.sysconfig.get_link_flags()))') )


CXX=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_compile_flags()[1])')
LINK=$(python -c 'import tensorflow as tf; print(tf.sysconfig.get_link_flags()[1])')


# echo $CUDA_ROOT
# echo $TF_INC
# echo $TF_LIB
# echo $TF_CFLAGS
# echo $TF_LFLAGS
echo $CXX
echo $LINK

echo 'completed'