connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351AD6ADCA" && level==0} -index 1
fpga -file C:/Users/aleja/Desktop/Projects/Car_Zybo/project_1/CarTest/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/Users/aleja/Desktop/Projects/Car_Zybo/project_1/ZyboCarPlatform/export/ZyboCarPlatform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/Users/aleja/Desktop/Projects/Car_Zybo/project_1/CarTest/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/Users/aleja/Desktop/Projects/Car_Zybo/project_1/CarTest/Debug/CarTest.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
