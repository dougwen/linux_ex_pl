hsi open_hw_design ./vivado/linux_ex_pl.xsa
hsi set_repo_path ./xlnx-devicetree
hsi create_sw_design device-tree -os device_tree -proc ps7_cortexa9_0
hsi generate_target -dir my_dts
hsi close_hw_design [current_hw_design]


