# Legal Notice: (C)2024 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	systemne_nios2_qsys_0 	systemne_nios2_qsys_0:*
set 	systemne_nios2_qsys_0_oci 	systemne_nios2_qsys_0_nios2_oci:the_systemne_nios2_qsys_0_nios2_oci
set 	systemne_nios2_qsys_0_oci_break 	systemne_nios2_qsys_0_nios2_oci_break:the_systemne_nios2_qsys_0_nios2_oci_break
set 	systemne_nios2_qsys_0_ocimem 	systemne_nios2_qsys_0_nios2_ocimem:the_systemne_nios2_qsys_0_nios2_ocimem
set 	systemne_nios2_qsys_0_oci_debug 	systemne_nios2_qsys_0_nios2_oci_debug:the_systemne_nios2_qsys_0_nios2_oci_debug
set 	systemne_nios2_qsys_0_wrapper 	systemne_nios2_qsys_0_jtag_debug_module_wrapper:the_systemne_nios2_qsys_0_jtag_debug_module_wrapper
set 	systemne_nios2_qsys_0_jtag_tck 	systemne_nios2_qsys_0_jtag_debug_module_tck:the_systemne_nios2_qsys_0_jtag_debug_module_tck
set 	systemne_nios2_qsys_0_jtag_sysclk 	systemne_nios2_qsys_0_jtag_debug_module_sysclk:the_systemne_nios2_qsys_0_jtag_debug_module_sysclk
set 	systemne_nios2_qsys_0_oci_path 	 [format "%s|%s" $systemne_nios2_qsys_0 $systemne_nios2_qsys_0_oci]
set 	systemne_nios2_qsys_0_oci_break_path 	 [format "%s|%s" $systemne_nios2_qsys_0_oci_path $systemne_nios2_qsys_0_oci_break]
set 	systemne_nios2_qsys_0_ocimem_path 	 [format "%s|%s" $systemne_nios2_qsys_0_oci_path $systemne_nios2_qsys_0_ocimem]
set 	systemne_nios2_qsys_0_oci_debug_path 	 [format "%s|%s" $systemne_nios2_qsys_0_oci_path $systemne_nios2_qsys_0_oci_debug]
set 	systemne_nios2_qsys_0_jtag_tck_path 	 [format "%s|%s|%s" $systemne_nios2_qsys_0_oci_path $systemne_nios2_qsys_0_wrapper $systemne_nios2_qsys_0_jtag_tck]
set 	systemne_nios2_qsys_0_jtag_sysclk_path 	 [format "%s|%s|%s" $systemne_nios2_qsys_0_oci_path $systemne_nios2_qsys_0_wrapper $systemne_nios2_qsys_0_jtag_sysclk]
set 	systemne_nios2_qsys_0_jtag_sr 	 [format "%s|*sr" $systemne_nios2_qsys_0_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$systemne_nios2_qsys_0_oci_break_path|break_readreg*] -to [get_keepers *$systemne_nios2_qsys_0_jtag_sr*]
set_false_path -from [get_keepers *$systemne_nios2_qsys_0_oci_debug_path|*resetlatch]     -to [get_keepers *$systemne_nios2_qsys_0_jtag_sr[33]]
set_false_path -from [get_keepers *$systemne_nios2_qsys_0_oci_debug_path|monitor_ready]  -to [get_keepers *$systemne_nios2_qsys_0_jtag_sr[0]]
set_false_path -from [get_keepers *$systemne_nios2_qsys_0_oci_debug_path|monitor_error]  -to [get_keepers *$systemne_nios2_qsys_0_jtag_sr[34]]
set_false_path -from [get_keepers *$systemne_nios2_qsys_0_ocimem_path|*MonDReg*] -to [get_keepers *$systemne_nios2_qsys_0_jtag_sr*]
set_false_path -from *$systemne_nios2_qsys_0_jtag_sr*    -to *$systemne_nios2_qsys_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$systemne_nios2_qsys_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$systemne_nios2_qsys_0_oci_debug_path|monitor_go
