@ECHO OFF
setlocal enabledelayedexpansion
for /f "tokens=*" %%G in ('dir /b /a:d "D:\orto\2019\*"') do (
	mkdir D:\orto\_EPSG2180\%%~nxG\2_8BIT\
	mkdir D:\orto\_kafle\2019\%%~nxG\2_8BIT\
	cd D:\orto\2019\%%~nxG\2_8BIT\
	for /r %%i in (*) do (
		echo %%~nxi
		 call gdalwarp -t_srs EPSG:2180 -r near -of GTiff D:\orto\2019\%%~nxG\2_8BIT\%%~nxi D:\orto\_EPSG2180\%%~nxG\2_8BIT\%%~nxi
		 call gdal_retile.py -v -r bilinear -levels 12 -ps 2048 2048 -co "TILED=YES" -targetDir D:\orto\_kafle\2019\%%~nxG\2_8BIT\ D:\orto\_EPSG2180\%%~nxG\2_8BIT\%%~nxi
		 del D:\Orto\_EPSG2180\%%~nxG\2_8BIT\%%~nxi
	)
)


