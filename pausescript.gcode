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