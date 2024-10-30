#!/bin/bash

# Start the VNC server without a password and with no security
tightvncserver $DISPLAY -geometry $GEOMETRY -depth $DEPTH -SecurityTypes None

# Start noVNC proxy
/opt/noVNC/utils/novnc_proxy --vnc localhost:5901 --web /opt/noVNC & 

# Keep the script running
tail -f /dev/null
