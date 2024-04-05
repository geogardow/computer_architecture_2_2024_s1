onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /datapath_tb/dut/frec_clk/seconds
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_in
add wave -noupdate -radix unsigned /datapath_tb/dut/pc_if/pc_out
add wave -noupdate /datapath_tb/rst
add wave -noupdate /datapath_tb/finish
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R0
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R6
add wave -noupdate -radix unsigned /datapath_tb/dut/scalar_rf_id/R8
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/A
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/B
add wave -noupdate /datapath_tb/dut/alu_ex/sel
add wave -noupdate -radix unsigned /datapath_tb/dut/alu_ex/C
add wave -noupdate -radix binary /datapath_tb/dut/alu_ex/flagZ
add wave -noupdate -radix binary /datapath_tb/dut/alu_ex/flagN
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/FlagZ
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/FlagN
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/BranchB
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/BranchI
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/BranchGEQ
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/BranchLEQ
add wave -noupdate -radix binary /datapath_tb/dut/jump_unit_ex/PCSource
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3266 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 392
configure wave -valuecolwidth 126
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
WaveRestoreZoom {0 ps} {23401 ps}
