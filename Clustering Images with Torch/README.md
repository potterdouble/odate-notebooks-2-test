# Identifying Similar Images with Torch

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/ChantalMB/odate-notebooks-wip/clustering-images)

> **Note:** This notebook can take ~10min to build-- the package Torch is a deep-learning library so it takes some time to install.

Here we take the second-last layer of the neural network and demonstrates how to study it for clustering visually similar images.

This notebook is inspired by on Douglas Duhaime's tutorial [identifying similar images with tensorflow](http://douglasduhaime.com/posts/identifying-similar-images-with-tensorflow.html) which is very clearly laid out and explained. In this notebook, I've compressed the steps. The 'images' directory only has 25 images in it for demo purposes. In Duhaime's post, the images folder (that you grab with `wget` has about 2000 images in it). If you [clone this repo locally](TO DO: link to install page), you can easily load more images into that folder. Alternatively, you might want to clone this repo into something like [Google Colab](colab.research.google.com/) and connect it to your GDrive (where you might have a folder with hundreds of images ready to go).

