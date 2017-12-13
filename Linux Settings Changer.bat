@echo OFF
echo This script will change layout settings of auto cleanup function in labview
echo Script will set following parameters:
echo auto Layout Block Padding X = 20
echo auto Layout Block Padding Y = 30
echo auto Layout Wire Padding X = 15
echo auto Layout Wire Padding Y = 15
echo auto Layout Fix Controls = True
echo auto Layout Fix Indicators = True
echo  
SET /P userInput=Do you want to continue? Press 'y' to continue or 'n' to exit...
if %userInput% == n (exit)

@ Move to Labview Directory
cd "C:\Program Files (x86)\National Instruments\LabVIEW 2015"

@ Create a temporary clear file
break>labview_temp.ini

@ Clear the original labview settings file from specified lines
@ Write the output to temporary file
findstr /V "autoLayoutBlockPaddingX  autoLayoutBlockPaddingY autoLayoutWirePaddingX autoLayoutWirePaddingY autoLayoutFixControls autoLayoutFixIndicators" labview.ini >> labview_temp.ini

@ Delete the original settings file
del labview.ini

@ Rename temp file to labview.ini
ren labview_temp.ini labview.ini

@ Append neccessary modified settings to labview.ini
echo autoLayoutBlockPaddingX=20 >> labview.ini
echo autoLayoutBlockPaddingY=30 >> labview.ini
echo autoLayoutWirePaddingX=15 >> labview.ini
echo autoLayoutWirePaddingY=15 >> labview.ini
echo autoLayoutFixControls=True >> labview.ini
echo autoLayoutFixIndicators=True >> labview.ini

echo Labview settings have been successfully changed.
pause
