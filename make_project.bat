call c:\Xilinx\Vivado\2022.1\settings64.bat
call vivado -nolog -nojournal -mode=batch -source=./tcl/make_project.tcl
call vivado -nolog -nojournal -mode=batch -source=./tcl/impl.tcl
call xsct tcl/make_sw.tcl
call vivado -nolog -nojournal -mode batch -source ./tcl/make_final_bitstream.tcl
cd tcl
call bootgen -image makebin.bif -arch zynq -process_bitstream bin -w on
