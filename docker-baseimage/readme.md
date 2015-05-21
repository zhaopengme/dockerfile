# docker-baseimage
基于 phusion/baseimage-docker 的基础镜像.  
替换更新源为aliyun.  
预先安装 vim curl wget lrzsz unzip.  

## 使用

### step 1
编译mysql容器

    docker build -t zhaopengme/baseimage ./baseimage