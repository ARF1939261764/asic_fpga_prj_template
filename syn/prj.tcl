# Set the project name
set prj_dir "../"
set prj_name "rocket"

# Create project
create_project -force ${prj_name} ./${prj_name} -part xc7z035ffg676-2

# Add file
source ${prj_dir}/design/rtl_fpga.lst

# Add Define
set_property verilog_define {SYNTHESIS CLOCK_PERIOD=2} [current_fileset]

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "top" -objects $obj
set_property -name "top_auto_set" -value "0" -objects $obj
