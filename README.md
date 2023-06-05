OctoPrintPauseFilamentChange
=========
Script to automatically add a pause for filament change into the gcode when running  on octoprint. 

<img src="https://raw.githubusercontent.com/DIYCharles/OctoPrintPauseFilamentChange/main/img/1.jpg" style="max-width:80%;" />  

Table of contents 
=================

<!--ts-->
   * [What it Does](#What-it-Does)
   * [How to Use](#How-to-Use)
   * [How to Change Pause Script](#How-to-Change-Pause-Script)
   * [My Pause Script](#My-Pause-Script)
<!--te-->

What it Does
=====
This script that runs in a terminal cli will prompt you to enter the layer number that you want to pause at and then will inject a script into the specified Gcode at the start of that layer.

The script it injects can be customized and I have an example already in the script. Octoprint uses commands in gcode that can control the print like `@pause`.

How to Use
============
Make sure `pause.sh` and `pausescript.gcode` are in the same folder before you run.

#### 1. Open a terminal on your computer
#### 2. Run the command
```sh
path/to/script/pause.sh
```
Or if you are in the folder with the script run
```sh
./pause.sh
```
#### 3. Type the layer you want to change filaments at the start of and hit enter
```sh
Enter layer number: 3
```
#### 4. Enter the path to the gcode file
```sh
Enter gcode file path: path/to/file/example.gcode
```
Or if you are in the folder with the gcode file just enter in the file name
```sh
Enter gcode file path: example.gcode
```
#### 5. If it all works you will get something like this back 
<img src="https://raw.githubusercontent.com/DIYCharles/OctoPrintPauseFilamentChange/main/img/1.jpg" style="max-width:80%;" />  

How to Change Pause Script
=====
The pause script loads from `pausescript.gcode` so make sure it is in the same folder as `pause.sh`. To edit just open in a text editor like notepad or notepad++ and change the lines you want to.

My Pause Script
=====
This script is what I use to change filaments. It pauses twice. Once to change the filament and once to clean the nozzle after it all the pressure from the extruder is relieved to make sure there are no blobs or strings when it resumes printing again.

```gcode
G91 ;Relative positioning
G1 E-2 F2700 ;Retract a bit
G1 E-2 Z50 F2400 ;Retract and raise Z
G1 X-15 Y15 F3000 ;Wipe out
@pause
G1 E3 F2700 ;Extrude back out a bit
G1 E-1 F1500 ;Extrude back in a bit so you can clean the nozzle and no blob is formed when it goes back into place
@pause
G1 E-1 F1500 ;Extrude back in a bit
G1 X15 Y-15 F3000 ;Wipe in
G1 Z-50 F2400 ;lower Z
G90 ;Absolute positioning
```
It is important to note that the model has to be further away from the sides than the distance you move in the script.

