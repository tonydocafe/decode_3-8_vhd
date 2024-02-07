
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name decodes -dir "/home/mneoacme/mneoacme/decodes/planAhead_run_1" -part xc3s1200efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "decodd.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {../Downloads/decod7seg_4dig.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {dcd38.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {decodd.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top decodd $srcset
add_files [list {decodd.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s1200efg320-4
