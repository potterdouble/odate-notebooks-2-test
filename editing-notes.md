# Notebook Editing Notes

- **Chronicling America API**
  - Should explain that it's now a general LoC API rather than just Chronicling America
  - Updated API: https://libraryofcongress.github.io/data-exploration/loc.gov%20JSON%20API/Chronicling_America/README.html

- **OC Measurements**: SG- Contact the Open Context person?
  - Do we have an example of what the original query response looks like? bc the original search doesn't work, and search updated with taxon query still doesn't work

- **Datasette API**
  - CSTM api is dead on Heroku
    - https://cstm-demo.herokuapp.com/cstm/fulldata.json
  - Can replace with David Dean postage stamps project

- **Archdata in R** SG- Can you try and get an export from PAS for this? I cannot make an account
  - Absolutely bunged, can't retrieve any data bc of cloudflare block

- **LOD and SPARQL**: SG- Pls check the queries in this notebook, some error but I'm note 100% on what the output is intended to look like
  - Python
    - Simple RDF Example: The only museum I'm able to find with LOD is the [Smithsonian American Art Museum](https://americanart.si.edu/about/lod)
    - Wikidata: Works generally, but diagrams can't be drawn since `sparqlkernel` is so out of date it's using obsolete code
    - Nomisma works! But stopped using Jena so I had to do some really imprecise "around Athens" math lol
  - R
    - SPARQL library was archived in 2022 after not being updated for 10yrs
    - `glitter` only "current" SPARQL library but also hasn't been updated in 3yrs --> doesn't seem to work with current version of R
  - *Solution:* Replaced with course digiarch-labbench edition
    - Stealing PALP too

- **Spatial Arch**
  - Data & maps works but need to test on py 3.6 + geopandas 0.4.0 to confirm results
    - Same w linlithgow
  - Used this process to get gdal working locally: https://gis.stackexchange.com/questions/481539/install-gdal-into-conda-environment
  - *Solution*: Works as expected

- **Scraping**
  - PAS suffering strikes again
  - Updated both R activities but both require R Studio to work...
  - PaddleOCR or python alternative? --> scrapegraphai
  - *Solution*: New notebook using img2table for Tesseract

- **Creativity I**
  - `semanticsimilaritychatbot` might be broken --> in final section, chatbot only returns one response after building --> Die
  - Knowing Machines or Teachable Machines
  - *Solution:* Replaced with practical-necromancy from digiarch-labbench

- **Clustering w Tensorflow**: SG- The digiarch-labbench image-similarity works to replace this, but do you have the/an image dataset that we could use for it?
  - May need to update line in find-similar-imgs notebook --> The repo is at [github](https://github.com/o-date/Identifying-Similar-Images-with-TensorFlow). The various python bits and pieces are called from the `requirements.txt` file, which saves us from having to `!pip install`.
  - `annoy` might be broken, need to test on 3.6
- Update with pixplot?
- *Solution*: Might still be nice to mention pixplot, but could be replaced with the more "beginner" digiarch-labbench's image-similarity.ipynb

- **LiDAR**
  - `tostring_rgb` deprecated but gif breaks when using `buffer_rgba`
  - Check LiDAR stuff from notebooks
  - *Solution*: Squares from Avebury OR Carleton depending on access

- **ABM**
  - Updated python scripts, but removing visualising in browser option bc they just totally re-did that system
  - *Solution*: combo of digiarch-labbench and mesa updated
