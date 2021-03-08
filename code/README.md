## How to enhance low light images
### Using a docker contain
The following libraries need to be installed to ensure images are enhanced.<br>
**For testing/enhancing dataset:**
1. start and attach docker
2. pip install keras
3. pip install tensorflow
4. pip install opencv-python-headless
5. pip install git+https://www.github.com/keras-team/keras-contrib.git
6. pip install imageio
7. Run the following command line: `python test.py -i <INPUT_FOLDER> -r <RESULTS_FOLDER> -m <MODEL_FILE>`
    - <INPUT_FOLDER> needs to be an already existing folder containing your dataset.
    - <RESULTS_FOLDER> does not need to be an existing folder because the code will create if for you. An existing folder can still be used.
    - <MODEL_FILE>  create a 'models' folder that contains .h files.
        - exclude '.h' from the command line above

Example: `python test.py -i dataset -r results -m Syn_img_lowlight_withnoise`<br>

In addition to the above libraries, take the following steps.<br>
**For training dataset:**
1. conda install pydot (Will take a few minutes)
2. conda install pydotplus
3. conda install -c conda-forge xorg-libxrender xorg-libxpm
4. Run the following command line: `python train.py`

### Running on Google Colab
1. run `!pip install git+https://www.github.com/keras-team/keras-contrib.git`
2. When trying to test dataset on Google Colab, the order should be as follows
    - Network.py
    - utls.py
    - video_capture.py (Interchangeable)
    - data_load.py
    - train.py
    - test.py
3. Run the following command line: `python test.py -i <INPUT_FOLDER> -r <RESULTS_FOLDER> -m <MODEL_FILE>` <br>
    
