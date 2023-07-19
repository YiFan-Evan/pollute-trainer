FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# COPY ./* /workspace/AISFormer/
# RUN git clone
WORKDIR /workspace/
RUN apt update && apt install -y git
RUN git clone https://github.com/YiFan-Evan/pollute-trainer.git
WORKDIR /workspace/pollute-trainer/

# maybe need to uninstall (but normally they are not exist): protobuf google pytorch_toolbelt
RUN pip3 uninstall -y urllib3
RUN pip3 install numpy Cython urllib3==1.26.16 torchvision scikit-image
RUN apt install -y build-essential
RUN python3 setup.py install
RUN cp -r detectron2/data/amodal_datasets /opt/conda/lib/python3.10/site-packages/detectron2-0.6-py3.10-linux-x86_64.egg/detectron2/data/amodal_datasets
RUN cp -r detectron2/modeling/roi_heads/aisformer /opt/conda/lib/python3.10/site-packages/detectron2-0.6-py3.10-linux-x86_64.egg/detectron2/modeling/roi_heads/aisformer
RUN pip3 uninstall -y protobuf google
RUN pip3 install google protobuf
RUN touch /opt/conda/lib/python3.10/site-packages/google/__init__.py
RUN pip3 install opencv-python timm torch_dct pytorch_toolbelt==0.6.2
RUN apt install -y libgl1-mesa-glx

#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

RUN apt install -y nvidia-cuda-toolkit
WORKDIR /workspace/pollute-trainer/tools/
# ENTRYPOINT [ "bash", "python3", "train_net.py", "--config-file", "/mnt/c/users/15240/Desktop/experiments/AISFormer/configs/COCOA_cls-AmodalSeg/aisformer_R_50_FPN_1x_amodal_cocoa_cls.yaml", ">logs.txt"]