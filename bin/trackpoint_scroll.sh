#!/bin/bash
LOOKFOR="Lite-On Technology Corp\. ThinkPad USB Keyboard with TrackPoint"
for id in $(xinput list | egrep "${LOOKFOR}" | cut -f2 | cut -d= -f2); do
    xinput set-int-prop $id "Evdev Wheel Emulation" 8 1
    xinput set-int-prop $id "Evdev Wheel Emulation Button" 8 2
done
