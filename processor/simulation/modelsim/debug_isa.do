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
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R0
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R1
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R2
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R3
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R4
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R5
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R6
add wave -noupdate /datapath_tb/dut/scalar_rf_id/R8
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R11
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R0
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R1
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R2
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R3
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R4
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R5
add wave -noupdate /datapath_tb/dut/vectorial_rf_id/R6
add wave -noupdate /datapath_tb/dut/alu_ex/A
add wave -noupdate /datapath_tb/dut/alu_ex/B
add wave -noupdate /datapath_tb/dut/alu_ex/sel
add wave -noupdate /datapath_tb/dut/alu_ex/C
add wave -noupdate /datapath_tb/dut/alu_instance/vectorA
add wave -noupdate /datapath_tb/dut/alu_instance/vectorB
add wave -noupdate /datapath_tb/dut/alu_instance/scalar
add wave -noupdate /datapath_tb/dut/alu_instance/sel
add wave -noupdate /datapath_tb/dut/alu_instance/result
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/read_enable
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/write_enable
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/input_address
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/output_address
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/count_read
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/count_write
add wave -noupdate /datapath_tb/dut/mem/address
add wave -noupdate /datapath_tb/dut/mem/data
add wave -noupdate /datapath_tb/dut/mem/wren
add wave -noupdate /datapath_tb/dut/mem/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6785 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 371
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
configure wave -timelineunits ps
update
WaveRestoreZoom {6541 ps} {8220 ps}
