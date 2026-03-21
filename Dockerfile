# mybinder-compatible image with Python + R kernels
FROM quay.io/jupyter/base-notebook:python-3.12.11

# --- Build args for mybinder ---
ARG NB_USER=jovyan
ARG NB_UID=1000

# --- System-level dependencies (as root) ---
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    tesseract-ocr \
    tesseract-ocr-eng \
    build-essential \
    gfortran \
    poppler-utils \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

# --- Conda-forge: Python packages, R base + kernel, R packages ---
RUN mamba install -y -c conda-forge \
    # R base and Jupyter kernel
    r-base \
    r-irkernel \
    # Python packages
    gdal \
    matplotlib \
    pandas \
    numpy \
    networkx \
    scikit-learn \
    scikit-image \
    seaborn \
    tqdm \
    pillow \
    scipy \
    ipython \
    imageio \
    laspy \
    datashader \
    rasterio \
    pytesseract \
    scrapy \
    fiona \
    pysal \
    shapely \
    descartes \
    geopandas \
    ipywidgets \
    pygeoprocessing \
    py-opencv \
    bokeh \
    pygments \
    ipyleaflet \
    # R packages
    r-dplyr \
    r-ggplot2 \
    r-igraph \
    r-tidyr \
    r-jsonlite \
    r-rcurl \
    r-curl \
    r-dbi \
    r-rsqlite \
    r-sf \
    r-terra \
    r-lattice \
    r-gridextra \
    r-xml \
    && mamba clean -afy

# --- Pip-only Python packages ---
RUN pip install --no-cache-dir \
    "git+https://github.com/p-lod/plodlib" \
    gpt_2_simple \
    tracery \
    sqlitebiter \
    img2table \
    miditime \
    mesa \
    lazrs \
    torch \
    torchvision \
    tensorflow

# --- R packages from CRAN (not available on conda-forge) ---
RUN R -e "install.packages(c('archdata', 'NetLogoR', 'geojsonio', 'protolite'), repos='https://cloud.r-project.org')"

# --- SPARQL: archived on CRAN, install from source tarball ---
RUN R -e "\
    download.file('https://cran.r-project.org/src/contrib/Archive/SPARQL/SPARQL_1.16.tar.gz', 'SPARQL.tar.gz'); \
    install.packages('SPARQL.tar.gz', repos=NULL, type='source'); \
    file.remove('SPARQL.tar.gz')"

# --- Custom JupyterLab extensions ---
COPY --chown=${NB_UID}:${NB_GID} odate-extensions/*.whl /tmp/odate-extensions/
RUN pip install --no-cache-dir \
    /tmp/odate-extensions/jlab_cell_run-0.1.0-py3-none-any.whl \
    /tmp/odate-extensions/jlab_solarised_dark_theme-0.2.0-py3-none-any.whl \
    /tmp/odate-extensions/jlab_solarised_light_theme-0.2.0-py3-none-any.whl \
    && rm -rf /tmp/odate-extensions

WORKDIR ${HOME}