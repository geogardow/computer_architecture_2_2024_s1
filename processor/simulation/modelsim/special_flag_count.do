onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/frec_clk/seconds
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_in
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_out
add wave -noupdate /datapath_tb/R28_stall_count
add wave -noupdate /datapath_tb/R29_aritmetric_count
add wave -noupdate /datapath_tb/R30_memory_count
add wave -noupdate /datapath_tb/R31_cicles_per_inst
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_type
add wave -noupdate /datapath_tb/dut/control_unit_inst/opcode
add wave -noupdate /datapath_tb/dut/control_unit_inst/stall_count
add wave -noupdate /datapath_tb/dut/control_unit_inst/aritmetric_count
add wave -noupdate /datapath_tb/dut/control_unit_inst/memory_count
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_count
add wave -noupdate /datapath_tb/dut/control_unit_inst/stall_count_temp
add wave -noupdate /datapath_tb/dut/control_unit_inst/aritmetric_count_temp
add wave -noupdate /datapath_tb/dut/control_unit_inst/memory_count_temp
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_count_temp
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R27
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R31
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R28_stall_count
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R29_aritmetric_count
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R30_memory_count
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R31_cicles_per_inst
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20631 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 369
configure wave -valuecolwidth 201
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
WaveRestoreZoom {0 ps} {145988 ps}
