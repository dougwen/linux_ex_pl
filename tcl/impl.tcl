set project_name "linux_pl"
open_project ./vivado/${project_name}.xpr


# build the bitstream
update_compile_order -fileset sources_1
launch_runs impl_1 -to_step write_bitstream -jobs 7
wait_on_run impl_1

# export the XSA file for software development
write_hw_platform -fixed -include_bit -force -file ./vivado/proc_system.xsa

close_project
