# System
- tesseract-ocr

# Python
- conda install gdal
- pip install git+https://github.com/p-lod/plodlib
- matplotlib
- pandas
- mesa
- numpy
- networkx
- torch
- torchvision
- scikit-learn
- scikit-image
- seaborn
- tqdm
- tensorflow
- pillow
- gpt_2_simple
- scipy
- tracery
- ipython
- sqlite3
- sqlitebiter
- imageio
- laspy
- datashader
- lazrs
- rasterio
- pytesseract
- img2table
- scrapy
- miditime
- fiona
- pysal
- shapely
- descartes
- geopandas
- ipywidgets
- pygeoprocessing
- opencv-python
- bokeh
- Pygments
- ipyleaflet

# R
- dplyr
- NetLogoR
- ggplot2
- igraph
- tidyr
- jsonlite
- RCurl
- curl
- archdata
- DBI
- RSQLite
- geojsonio
- protolite
- sf
- terra
- lattice
- gridExtra
- XML

# Challenge: Install library from R archive
url <- "https://cran.r-project.org/src/contrib/Archive/SPARQL/SPARQL_1.16.tar.gz"
destination_file <- "SPARQL.tar.gz"

install.packages("SPARQL.tar.gz", repos = NULL, type="source")
