#!/bin/bash
# 1. Clean up old locks (manual ExecStartPre)
rm -f /tmp/.X200-lock /tmp/.X11-unix/X200

# 2. Replicate the environment from your [Service] block
export HOME=/home/tiledb
export XDG_RUNTIME_DIR=/run/xpra-vivado
export DISPLAY=:200
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export _JAVA_AWT_WM_NONREPARENTING=1
export GDK_BACKEND=x11

# 3. Create the runtime directory if it doesn't exist
mkdir -p $XDG_RUNTIME_DIR
chmod 700 $XDG_RUNTIME_DIR

# 4. Run the exact ExecStart command
source /tools/Xilinx/Vivado_Lab/2022.2/settings64.sh && \
/usr/bin/xpra start :200 \
    --start-child="vivado_lab" \
    --start="bash -c \"for i in {1..30}; do wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz && break; sleep 1; done\"" \
    --bind-tcp=0.0.0.0:8082 \
    --html=on \
    --exit-with-children=yes \
    --daemon=no \
    --socket-dir=/run/xpra-vivado

