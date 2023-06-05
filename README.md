OctoPrintPauseFilamentChange
=========
Script to automatically add a pause for filament change into the gcode when running  on octoprint. 

<img src="https://raw.githubusercontent.com/DIYCharles/OctoPrintPauseFilamentChange/main/photos/1.JPG" style="max-width:80%;" />  

Table of contents 
=================

<!--ts-->
   * [How to Use](#How-to-Use)
   * [Randomizing Input work in progress](#Randomizing-Input-work-in-progress)
   * [Compile And Flash](#Compile-And-Flash)
   * [Build](#Build)
   * [How to add a MouseJiggler toggle macro to your QMK keyboard](#How-to-add-a-MouseJiggler-toggle-macro-to-your-QMK-keyboard)
<!--te-->

How to Use
============

### 1. Open a terminal on your computer
### 2. Run the command
```sh
path/to/script/fc.sh
```
Or if you are in the folder with the script run
```sh
./fc.sh
```
3. Enter the layer you want to change filaments at the start of
### 4. Enter the path to the gcode file
```sh
path/to/file/example.gcode
```
Or if you are in the folder with the gcode file just enter in the file name
```sh
example.gcode
```
### 5. If it all works you will get something like this back 
<img src="https://raw.githubusercontent.com/DIYCharles/OctoPrintPauseFilamentChange/main/photos/1.JPG" style="max-width:80%;" />  



Randomizing Input work in progress
=====
Currently trying to find a way to randomize the code. My thoughts are to use a counter and only execute that code when the counter is divisable by small prime numbers. If anyone 