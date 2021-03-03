import cv2 as cv
import os

def VideoCapture(path):
  vid = cv.VideoCapture(path)
  success, read = vid.read()
  image = cv.resize(read,(560,480),fx=0,fy=0, interpolation = cv.INTER_CUBIC)
  count = 0

  if not os.path.isdir('./dataset'):
    os.makedirs('./dataset')

  data_path = './dataset'

  while success:
    cv.imwrite(data_path+"/"+"frame%d.png" % count, image)
    success, read = vid.read()
    try:
      image = cv.resize(read,(560,480),fx=0,fy=0, interpolation = cv.INTER_CUBIC)
    except:
        break
    count += 1

  vid.release()

path = './video-1612691536.mp4'
VideoCapture(path)