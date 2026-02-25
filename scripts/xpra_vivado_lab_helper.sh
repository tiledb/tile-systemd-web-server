#!/bin/bash

#!/bin/bash
# 1. Force the correct environment for the script itself
export DISPLAY=:200
export XAUTHORITY=/home/tiledb/.Xauthority
export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb

# 2. Start Vivado in the background
vivado_lab &

# 3. Wait for the window to actually exist (up to 20 seconds)
# for i in {1..60}; do
#     # Try to find any window and maximize it if it exists
#     if wmctrl -l | grep -i "Vivado"; then
#         wmctrl -r "Vivado" -b add,maximized_vert,maximized_horz
#         break
#     fi
#     sleep 1
# done
