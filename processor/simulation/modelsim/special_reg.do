onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/frec_clk/seconds
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_type
add wave -noupdate /datapath_tb/dut/control_unit_inst/opcode
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_in
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_out
add wave -noupdate /datapath_tb/finish
add wave -noupdate -radix unsigned /datapath_tb/R28_stall_count
add wave -noupdate -radix unsigned /datapath_tb/R29_aritmetric_count
add wave -noupdate -radix unsigned /datapath_tb/R30_memory_count
add wave -noupdate -radix unsigned /datapath_tb/dut/special_register_manager_inst/instruction_count
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R27
add wave -noupdate -radix unsigned /datapath_tb/R31_cicles_per_inst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {525874 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 435
configure wave -valuecolwidth 250
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {685948 ps}
