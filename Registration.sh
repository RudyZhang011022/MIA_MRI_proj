# change all /Users/rudyzhang to the directory where your ANTs code is (where the ANTs folder is)
export PATH=/Users/rudyzhang/ANTs/install/bin:$PATH
ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=8
cd /Users/rudyzhang/ANTs/install/bin/ANTS_test

# T1w synthesis, assuming all input files are located in ./data and all output files goes to ./output
antsRegistrationSyN.sh -d 3 -f data/atlas.nii.gz -m data/subject_1_t1w.nii.gz -t r -x data/mask.nii.gz -o ./output/subject_1_t1w_

# T2w synthesis, assuming all input files are located in ./data and all output files goes to ./output
antsRegistrationSyN.sh -d 3 -f output/subject_1_t1w.nii.gz -m data/subject_1_t2w.nii.gz -t r -o ./output/subject_1_t2w_
