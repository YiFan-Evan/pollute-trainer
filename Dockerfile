FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# COPY ./* /workspace/AISFormer/
# RUN git clone
WORKDIR /workspace/
RUN git clone https://github.com/YiFan-Evan/pollute-trainer.git
WORKDIR /workspace/pollute-trainer/

# maybe need to uninstall (but normally they are not exist): protobuf google pytorch_toolbelt 
RUN apt update \
    && pip3 uninstall urllib3 \
    && pip3 install numpy Cython urllib3==1.26.16 torchvision scikit-image \
    && python3 setup.py install \
    && cp -r detectron2/data/amodal_datasets /usr/local/lib/python3.10/dist-packages/detectron2-0.6-py3.10-linux-x86_64.egg/detectron2/data/amodal_datasets \
    && cp -r detectron2/modeling/roi_heads/aisformer /usr/local/lib/python3.10/dist-packages/detectron2-0.6-py3.10-linux-x86_64.egg/detectron2/modeling/roi_heads/aisformer \
    && pip3 install google protobuf \
    && touch /usr/local/lib/python3.10/dist-packages/google/__init__.py \
    && pip3 install opencv-python timm torch_dct pytorch_toolbelt==0.6.2 \
    && apt install -y libgl1-mesa-glx nvidia-cuda-toolkit nvidia-cudnn

WORKDIR /workspace/AISFormer/tools/
# ENTRYPOINT [ "bash", "python3", "train_net.py", "--config-file", "/mnt/c/users/15240/Desktop/experiments/AISFormer/configs/COCOA_cls-AmodalSeg/aisformer_R_50_FPN_1x_amodal_cocoa_cls.yaml", ">logs.txt"]

