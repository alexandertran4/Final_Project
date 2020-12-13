transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/SPI_Module.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/4waymux.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/bin2bcd.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/BCD7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/clkDiv.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/rotateDisplay.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/SPIComms_top.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Documents/Final_Project {C:/Users/User/Documents/Final_Project/bin2bcd_2.v}

