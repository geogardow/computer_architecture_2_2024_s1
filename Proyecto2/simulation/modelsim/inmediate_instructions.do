onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/frec_clk/seconds
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_in
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_out
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_type
add wave -noupdate /datapath_tb/dut/control_unit_inst/opcode
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RS1
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RS2
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RS3
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RD
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/WD
add wave -noupdate -radix binary /datapath_tb/dut/scalar_rf_id/WES
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RD1
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RD2
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/RD3
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R0
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R1
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R2
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R3
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R4
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R5
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R6
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R7
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R8
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R9
add wave -noupdate -radix binary /datapath_tb/dut/alu_ex/A
add wave -noupdate -radix binary /datapath_tb/dut/alu_ex/B
add wave -noupdate /datapath_tb/dut/alu_ex/sel
add wave -noupdate -radix binary /datapath_tb/dut/alu_ex/C
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/input_address
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/output_address
add wave -noupdate -radix unsigned /datapath_tb/dut/extend_vector_size_inst/input_data
add wave -noupdate -radix binary /datapath_tb/dut/extend_vector_size_inst/output_data
add wave -noupdate -radix binary /datapath_tb/dut/mux_data_mem/A
add wave -noupdate -radix unsigned /datapath_tb/dut/mux_data_mem/B
add wave -noupdate -radix binary /datapath_tb/dut/mux_data_mem/sel
add wave -noupdate -radix binary /datapath_tb/dut/mux_data_mem/C
add wave -noupdate -radix binary /datapath_tb/dut/mux_WD_wb/A
add wave -noupdate -radix binary /datapath_tb/dut/mux_WD_wb/B
add wave -noupdate -radix binary /datapath_tb/dut/mux_WD_wb/sel
add wave -noupdate -radix binary /datapath_tb/dut/mux_WD_wb/C
add wave -noupdate -radix binary /datapath_tb/dut/mux_RD_wb/A
add wave -noupdate -radix binary /datapath_tb/dut/mux_RD_wb/B
add wave -noupdate -radix binary /datapath_tb/dut/mux_RD_wb/sel
add wave -noupdate -radix binary /datapath_tb/dut/mux_RD_wb/C
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {71952 ps} 0}
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
WaveRestoreZoom {0 ps} {137565 ps}
