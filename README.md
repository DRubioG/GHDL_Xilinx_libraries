# GHDL_Xilinx_libraries

<u>**NOTE:**</u> This library is only necessary to analyze once.

## UNISIM

It is necessary to analyze the libraries previous to analyze the project.

_(Follow this order to analyze)_
``` bash
ghdl -a --std=08 -fsynopsys --work=unisim unisim/vcomponents/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/primitives/*.vhd
ghdl -a --std=08 -fsynopsys --work=unisim unisim/retarget/*.vhd
```


## XPM

``` bash
ghdl -a --std=08 -fsynopsys --work=xpm xpm/*.vhd
```

XPM repo: https://github.com/fransschreuder/xpm_vhdl


<!-- ## NVC

```
nvc --work=unisim -a unisim/IBUF.vhd
nvc --work=unisim -a unisim/OBUF.vhd
nvc --work=unisim -a unisim/IOBUF.vhd
nvc --work=unisim -a unisim/VComponents.vhd


nvc -L . -a rtl/top.vhd
nvc -L . -a tb/tb_top.vhd

nvc -e tb_top
nvc -r tb_top --wave=test.vcd
``` -->