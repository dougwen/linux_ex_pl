setws ./vitis
platform create -name {hwplat} -hw {./vivado/proc_system.xsa} -proc {microblaze_0} -os {standalone} 
platform write
app create -name my_app
importsources -name my_app -path ./src/proc_software
app build my_app
