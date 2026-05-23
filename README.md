# GHDL_Xilinx_libraries





It is necessary to analyze the libraries previous to analyze.

``` bash
ghdl -a -fsynopsys --work=unisim unisim/vcomponents/unisim_VCOMP.vhd
ghdl -a -fsynopsys --work=unisim unisim/*.vhd
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