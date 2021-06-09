# 3dtool
Developed a system that can compute 3‑D locations of an object in a world coordinate system. This function especially works on custom prop
that was made for this . Used a stereo camera to capture the object.

Implemented image processing pipeline that includes image undistortion, image segmentation, feature extraction and feature matching. Then
after triangulating points, the function gives 3D‑World coordinate of the object.

Implemented a machine learning model to simplify the image processing pipeline. Created all input data and ground‑truth data using MATLAB.
Implemented this model in python using Keras API and with help of the OpenCV library. In this model, I used UNET‑ CNN for image segmentation.
