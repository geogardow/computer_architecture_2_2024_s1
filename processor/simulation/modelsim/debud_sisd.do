onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/frec_clk/seconds
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_in
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_out
add wave -noupdate /datapath_tb/dut/control_unit_inst/instruction_type
add wave -noupdate /datapath_tb/dut/control_unit_inst/opcode
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
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R10
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R11
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R12
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R13
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R14
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R15
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R16
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R17
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R18
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R20
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/A
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/B
add wave -noupdate /datapath_tb/dut/alu_ex/sel
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/C
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/read_enable
add wave -noupdate /datapath_tb/dut/mem_addr_manager_inst/write_enable
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/input_address
add wave -noupdate -radix unsigned /datapath_tb/dut/mem_addr_manager_inst/output_address
add wave -noupdate -radix unsigned /datapath_tb/dut/mem/address
add wave -noupdate -radix unsigned /datapath_tb/dut/mem/data
add wave -noupdate -radix binary /datapath_tb/dut/mem/wren
add wave -noupdate -radix unsigned /datapath_tb/dut/mem/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {284 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 299
configure wave -valuecolwidth 363
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
WaveRestoreZoom {4377788 ps} {4418868 ps}
