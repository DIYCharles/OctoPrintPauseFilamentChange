#!/bin/bash

# Prompt user for layer height
read -p "Enter layer number: " layer

# Prompt user for gcode path
#If gcode is in the same folder as script you can just use file name
read -p "Enter gcode file path: " gcode

# Define our base string to add the layer number to
string=';LAYER:'

# Append the layer to the string
result="$string$layer"

# Print the result
echo "Searching for: $result"

# Lines to add 
#My steps are, retract E, move up z, move back and to the left, pause, extrude out then in, pause for nozzle wiping, extrude back. move right and forward back into xy position, move down back into z position, end
# lines_to_add=("G91 ;Relative positioning" "G1 E-2 F2700 ;Retract a bit" "G1 E-2 Z50 F2400 ;Retract and raise Z" "G1 X-15 Y15 F3000 ;Wipe out" "@pause" "G1 E3 F2700 ;Extrude back out a bit" "G1 E-1 F1500 ;Extrude back in a bit so you can clean the nozzle and no blob is formed when it goes back into place" "@pause" "G1 E-1 F1500 ;Extrude back in a bit" "G1 X15 Y-15 F3000 ;Wipe in" "G1 Z-50 F2400 ;lower Z" "G90 ;Absolute positioning")
mapfile -t lines_to_add < pausescript.gcode

# Search for the line in the file
line_number=$(grep -w -n "$result" "$gcode" | cut -d ":" -f1)

# If the line is found, add lines underneath it
if [[ -n $line_number ]]; then
    for line in "${lines_to_add[@]}"; do
        sed -i "$((line_number + 1))i\\$line" "$gcode"
    done
	# Return success message to user with details
    echo "Successfully added these lines under $result on line $line_number"
	for item in "${lines_to_add[@]}"; do
		echo "$item"
	done
else
    echo "Line not found in the file."
fi