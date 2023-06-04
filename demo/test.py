import os

# --config-file C:\Users\15240\Desktop\experiments\AISFormer\configs\COCOA_cls-AmodalSeg\aisformer_R_50_FPN_1x_amodal_cocoa_cls.yaml --input C:\Users\15240\PycharmProjects\flaskProject\preprocess\json\results\0-激光图.png --output ./output  --confidence-threshold 0.7  --opts MODEL.WEIGHTS C:\Users\15240\Desktop\experiments\AISFormer\data\train_outputs\aisformer\aisformer_R_50_FPN_1x_amodal_cocoa_cls\model_best.pth

for i in range(101,330):
    if os.path.exists(f"C:\\Users\\15240\\PycharmProjects\\flaskProject\\preprocess\\json\\results\\{i}-激光图.png"):
        os.system(f"python demo.py --config-file C:\\Users\\15240\\Desktop\\experiments\\AISFormer\\configs\\COCOA_cls-AmodalSeg\\aisformer_R_50_FPN_1x_amodal_cocoa_cls.yaml --input C:\\Users\\15240\\PycharmProjects\\flaskProject\\preprocess\\json\\results\\{i}-激光图.png --output ./predicts/{i}.png  --confidence-threshold 0.7  --opts MODEL.WEIGHTS C:\\Users\\15240\\Desktop\\experiments\\AISFormer\\data\\train_outputs\\aisformer\\aisformer_R_50_FPN_1x_amodal_cocoa_cls\\model_best.pth")

