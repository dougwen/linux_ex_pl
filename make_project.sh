vivado -nolog -nojournal -mode batch -source ./tcl/make_project.tcl
vivado -nolog -nojournal -mode batch -source ./tcl/impl.tcl
#xsct tcl/make_sw.tcl
#vivado -nolog -nojournal -mode batch -source ./tcl/make_final_bitstream.tcl
cd tcl
bootgen -image makebin.bif -arch zynq -process_bitstream bin -w on
