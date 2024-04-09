onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /systemne_tb/systemne_inst/memory_0/DATA_WIDTH
add wave -noupdate /systemne_tb/systemne_inst/memory_0/ADDRESS_WIDTH
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iClk
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iReset_n
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iChipSelect_n
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iRead_n
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iWrite_n
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iAddress
add wave -noupdate /systemne_tb/systemne_inst/memory_0/iData
add wave -noupdate /systemne_tb/systemne_inst/memory_0/oData
add wave -noupdate /systemne_tb/systemne_inst/memory_0/mem
add wave -noupdate /systemne_tb/systemne_inst/memory_0/address_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {873250000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 339
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {2239582656 ps}
