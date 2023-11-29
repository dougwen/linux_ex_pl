set project_name "linux_pl"
open_project ./vivado/${project_name}.xpr
add_files -norecurse ./vitis/my_app/Debug/my_app.elf
set_property used_in_simulation 0 [get_files ./vitis/my_app/Debug/my_app.elf]
set_property SCOPED_TO_REF design_1 [get_files -all -of_objects [get_fileset sources_1] {./vitis/my_app/Debug/my_app.elf}]
set_property SCOPED_TO_CELLS { microblaze_0 } [get_files -all -of_objects [get_fileset sources_1] {./vitis/my_app/Debug/my_app.elf}]
reset_run impl_1 -prev_step 
launch_runs impl_1 -to_step write_bitstream -jobs 7
wait_on_run impl_1
