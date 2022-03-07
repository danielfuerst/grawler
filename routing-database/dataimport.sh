#!/bin/bash

# Gets data from geo admin, filters and formats it an writes it to
# wege.sql
cd data

# Datendownload von geo admin
# 2021_SWISSTLM3D_SHP_CHLV95_LN02/TLM_STRASSEN/swissTLM3D_TLM_STRASSE.shp



FILE=2021_SWISSTLM3D_SHP_CHLV95_LN02
if [ -d "$FILE" ]; then
    echo "$FILE exists. Skip download and unzip"
else
    FILE=swisstlm3d_2021-04_2056_5728.shp.zip
    if [ -f "$FILE" ]; then
        echo "$FILE exists. Skip Download"
    else 
        wget https://data.geo.admin.ch/ch.swisstopo.swisstlm3d/swisstlm3d_2021-04/swisstlm3d_2021-04_2056_5728.shp.zip
    fi
    unzip swisstlm3d_2021-04_2056_5728.shp.zip
fi

# Import data from swissTLM3D_TLM_STRASSE and filter out unnecessary paths
# filtered.shp
ogr2ogr -sql "SELECT * FROM swissTLM3D_TLM_STRASSE WHERE WANDERWEGE != 'Bergwanderweg' AND WANDERWEGE != 'Alpinwanderweg' AND KUNSTBAUTE != 'Treppe' AND KUNSTBAUTE != 'Unterfuehrung mit Treppe' AND KUNSTBAUTE != 'Bruecke mit Treppe' AND OBJEKTART != 'Autobahn' AND OBJEKTART != 'Autostrasse' AND OBJEKTART != 'Einfahrt' AND OBJEKTART != 'Ausfahrt' AND OBJEKTART != 'Zufahrt' AND OBJEKTART != 'Klettersteig' AND OBJEKTART != 'Faehre'" filtered.shp 2021_SWISSTLM3D_SHP_CHLV95_LN02/TLM_STRASSEN/swissTLM3D_TLM_STRASSE.shp

# Clip data to avoid large dataset (for development purposes only)
# clipped_and_filtered.shp
ogr2ogr -clipsrc 2730000 1260000 2750000 1280000 clipped_and_filtered.shp filtered.shp

# Reproject data to EPSG:3857 (Weg Mercator, https://en.wikipedia.org/wiki/Web_Mercator_projection)
# reprojected.shp
# ogr2ogr reprojected.shp -t_srs "EPSG:3857" clipped_and_filtered.shp

# Write all data in a SQL-File
# wege.sql
shp2pgsql -I -s 2056:3857 -t 2D clipped_and_filtered.shp ways postgres >  2_import_ways.sql

cd ..