# Geoserver
How to publish rasters via Geoserver and Image mosaicking plugin
* Install Python https://www.python.org/
* Install OSGeo4W with gdal & gdal-pyton http://trac.osgeo.org/osgeo4w/
* Edit paths in Mosaic generator.bat file
* Change destination EPSG code in line 'call gdalwarp -t_srs EPSG:2180 ...'
* run Mosaic generator.bat in OSGeo4W Shell (Start Menu)
* Copy gereated tiles to data_dir directory to your geoserver server
