/usr/local/cuda-10.0/bin/nvcc tf_nndistance_g.cu -o tf_nndistance_g.cu.o -c -O2 -DGOOGLE_CUDA=1 -x cu -Xcompiler -fPIC
g++ -std=c++11 tf_nndistance.cpp tf_nndistance_g.cu.o -o tf_nndistance_so.so -shared -fPIC -I /home/sohee/anaconda3/envs/py3/lib/python3.6/site-packages/tensorflow/include -I /usr/local/cuda-10.0/include -I /home/sohee/anaconda3/envs/py3/lib/python3.6/site-packages/tensorflow/include/external/nsync/public -lcudart -L /usr/local/cuda-10.0/lib64/ -L/home/sohee/anaconda3/envs/py3/lib/python3.6/site-packages/tensorflow -l:libtensorflow_framework.so.1 -O2 -D_GLIBCXX_USE_CXX11_ABI=1

