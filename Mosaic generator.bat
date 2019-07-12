@ECHO OFF
setlocal enabledelayedexpansion

set wdir=2_8BIT
set srcDir=D:\Sentinel_2018\DKM\2019\0201Z\%wdir%\
set epsgDir=D:\Sentinel_2018\DKM\_EPSG2180\0201Z\%wdir%\
set kafleDir=D:\Sentinel_2018\DKM\_kafle\0201Z\%wdir%\
mkdir %epsgDir%
mkdir %kafleDir%
cd %srcDir%
for /r %%i in (*) do (
	echo %%~nxi
	call gdalwarp -t_srs EPSG:2180 -r near -of GTiff %srcDir%%%~nxi %epsgDir%%%~nxi
	call gdal_retile.py -v -r bilinear -levels 12 -ps 2048 2048 -co "TILED=YES" -targetDir %kafleDir% %epsgDir%%%~nxi
	del %epsgDir%%%~nxi
)

