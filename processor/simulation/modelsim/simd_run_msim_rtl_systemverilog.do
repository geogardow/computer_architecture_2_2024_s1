transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

if ![file isdirectory vhdl_libs] {
	file mkdir vhdl_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/ram7.v}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/adder.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/alu_element_vec.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/alu_scalar.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/alu_vec.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/branch_unit.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/compare.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/control_unit.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/datapath.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/decode.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/extend.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/extend_vector_size.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/mem_addr_manager.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/mem_input_manager.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/mem_output_manager.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/mux_2to1.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/mux_4to1.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/new_clk.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/pc.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/scalar_rf.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/segment_ex_mem.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/segment_id_ex.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/segment_if_id.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/segment_mem_wb.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/vectorial_rf.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/special_register_manager.sv}
vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/extend_pc.sv}

vlog -sv -work work +incdir+C:/Users/dmeji/OneDrive\ -\ Estudiantes\ ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2 {C:/Users/dmeji/OneDrive - Estudiantes ITCR/TEC/Semestres/IS2024/Arqui_II/Proyecto2/datapath_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  datapath_tb

add wave *
view structure
view signals
run -all
