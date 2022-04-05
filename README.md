# Welcome to the Glycan-recognition MATLAB scripts repository
In this repository you will find necessary scripts for glycan image training including but not limited to making distortion images, DarkNet-19 neural net for training purpose and prediction. For each script, a brief introduction of their function is listed as below. You can also click on each script to see for more details in the code documentation section.

## 1.[NewData.m](https://github.com/GW-HIVE/Glycan-recognition/blob/main/NewData.m)
* Function: This script will create the distortion images. The script is set to make 15 sets of variations but it can be changed based on needs.
* Input file:	[.png files] Files for this study were downloaded from https://data.glygen.org/GLY_000339

## 2.[DisImg.m](https://github.com/GW-HIVE/Glycan-recognition/blob/main/DisImg.m)
* Function: This script serves as a supporting file for NewData.m. It specifies the kind of variations will be created.
* Input file:	None

## 3.[DarkNet19.m](https://github.com/GW-HIVE/Glycan-recognition/blob/main/DarkNet19.m)
* Function: This script is the DarkNet-19 nerual net used for training. It will output a .mat file as the trained neural net and first prediction and top 5 predictions accuracy are provided at the end.
* Input file:	[output file from NewData.m]

## 4.[TopPerdict.m](https://github.com/GW-HIVE/Glycan-recognition/blob/main/TopPerdict.m)
* Function: This script serves as the supporting file for DarkNet19.m where outlines the prediction function.
* Input file:	None

## 5.[organize_files.py](https://github.com/GW-HIVE/Glycan-recognition/blob/main/organize_files.py)
* Function: This script will move the glycan images to three seperate directories for N-linked, O-linked and Glycosphingolipid based on glycan type.
* Command line input: `python organize_files.py -m path/mapping_file.csv -n name_field -f field_name -s subfield_name -d path/ -x .file_extension`
* Input file:	[glycan_classification.csv](https://github.com/GW-HIVE/Glycan-recognition/blob/main/glycan_classification.csv) and [.png] (folder contains all glycan images in .png)

## 6.[ClassOne.m](https://github.com/GW-HIVE/Glycan-recognition/blob/main/ClassOne.m)
* Function: This script will test the trained neural nets from DarkNet19.m. This version integrates up to four neural nets.
* Input file:	[file_name.mat] from DarkNet19.m and a test image in [.png].
