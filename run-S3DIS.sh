#!/bin/bash
GPU_ID=1
labeled_point=0.1%  # 0.01% 0.1% 1% 10%

# prepare the dataset
python utils/data_prepare_s3dis.py

# S3DIS
python main_S3DIS.py --mode train --gpu $GPU_ID --test_area 5 --labeled_point $labeled_point
python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 5 --labeled_point $labeled_point


# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 1 --gen_pesudo
# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 2 --gen_pesudo
# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 3 --gen_pesudo
# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 4 --gen_pesudo
# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 6 --gen_pesudo
# python main_S3DIS.py --mode train --gpu $GPU_ID --test_area 5 --labeled_point $labeled_point --retrain
# python main_S3DIS.py --mode test --gpu $GPU_ID --test_area 5 --labeled_point $labeled_point

# Print completion message
echo ""
echo "Process completed successfully!"