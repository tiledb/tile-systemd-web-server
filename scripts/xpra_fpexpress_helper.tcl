open_project -project {/home/tiledb/apps/tile-wjtag/bin/proasic/db7_proasic_fw_cm.pro} -connect_programmers 1

# Wait for 2 seconds to ensure the GUI is fully rendered
after 2000 

# This creates a dummy variable and waits for it to change (which it won't)
# Keeping the Tcl interpreter alive inside FPExpress.
set stay_open 1
vwait stay_open

# Enters the Tcl event loop and waits indefinitely, keeping the GUI open
vwait forever
