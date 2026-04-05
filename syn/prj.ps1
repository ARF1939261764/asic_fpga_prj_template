echo "create vivado project..."
Start-Process -WindowStyle hidden "vivado" -ArgumentList " -source ./prj.tcl"
