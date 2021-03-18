# NVSLAM

## *Using one RGB camera to accurately detects object and produce mapping under low light condition*

![Dark KITTI](https://github.com/Michellelind/NVSLAM/blob/main/img/Dark_KITTI.jpg)
![MBLLEN and Monodepth before and after](https://github.com/Michellelind/NVSLAM/blob/main/img/MBLLEN_and_Monodepth.jpg)

### Introduction

As the increasing demands of autonomous vehicle, the autopilot feature is extremely important for a safe drive. One of the challenge is the accuracy at night. It is important for autonomous systems to still be able to navigate in dark conditions. The current system is able to have good performance in a well-lit environment but does not perform well in  dark environments. This is mostly caused by the noise and lacks offeatures in  the dark  images received  by the  cameras. LiDARis one of the main solutions in a current industry, but it alsoraises the costs of the production. Therefore, our goal of this project is to improve night detection in current SLAM systems without introducing additional sensors.  Our approach is to implement algorithms that will improve input data from the camera before processing it through the SLAM algorithm. With this, we can increase the accuracy for  object detection and increase the reliability of autonomous vehicles under low lighting conditions.

### Design Methodology
*The projects consists 2 parts and 1 prerequisite*
1. Prepare data: train a GAN model with Berkeley Deep Drive Dataset to produce Dark KITTI
2. The Night Enhancement Model is built with MBLLEN CNN model
3. Feed night-enhanced images into DSLAM to process map
4. Converted into C for deployment (not finished)

### Setup
Setup the environment using **docker-compose file** 

Download the [Berekely Deep Drive dataset](https://bdd-data.berkeley.edu/), and seperate the image into **trainA** and **trainB** 

build the dataset using the files in the */dataset/create-data/*

> run **sh train.sh**
 
The model can be found the */checkpoints*, and the results can be seen in */results*

Produce images by feeding [KITTI dataset](http://www.cvlibs.net/datasets/kitti/)

> run **sh train.sh**

Feed into CNN model
> run **python train_load.py** 
> 
> run **train.py** 
> 
> run **test.py**
> 
!
Apply to D-SLAM

### Future Work

- [ ] Implement into DSLAM
- [ ] Improve model to support different environment
- [ ] Convert to C for deployment
- [ ] Test in real time vehicle

### Contact

- Audrey Lee
- Michelle Karnadjaja
- Andres Ortiz

### Related work

- [Light conditions style transfer](https://github.com/Chenzhaowei13/Light-Condition-Style-Transfer)
- [Cyclegan and pix2pix in pytorch](https://github.com/junyanz/pytorch-CycleGAN-and-pix2pix)
- [British Machine VisionConference (BMVC)](http://bmvc2018.org/contents/papers/0700.pdf)
- [MBLLEN: Low-lightImage/Video Enhancement Using CNNs](https://github.com/Lvfeifan/MBLLEN).
- [Argb-d slam based on orbslam2 and monodepth2](https://github.com/zxcvbnmditto/D-SLAM/tree/master/src)

