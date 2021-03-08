## How to enhance low light images
In order to enhance low light images changes may need to be made in ***test.py***.<br>
The following steps need to be taken to ensure images are enhanced.

1. (Optional) If running on Google Colab run `!pip install git+https://www.github.com/keras-team/keras-contrib.git`
2. If running python command line you do not need to worry about the order, but running on google colab run the coding snippets in this order
    - Network.py
    - utls.py
    - video_capture.py (Can be ran anywhere)
    - data_load.py
    - train.py
    - test.py
4. Run the following command line: `python test.py -i <INPUT_FOLDER> -r <RESULTS_FOLDER> -m <MODEL_FILE>` <br>
    - <INPUT_FOLDER> needs to be an already existing folder containing your dataset.
    - <RESULTS_FOLDER> does not need to be an existing folder because the code will create if for you. An existing folder can still be used.
    - <MODEL_FILE>  create a 'models' folder that contains .h files.
        - exclude '.h' from the command line above
