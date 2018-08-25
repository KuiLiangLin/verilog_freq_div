# verilog_freq_div

This module is used to divide frequency.

 If we want 19 clks to be divided into 9 clks, we can use : 

 fenzi = 19 and fenmu = 9.
 
 19/9 = (2a+3b)/(a+b) --> a = 8, b = 1 --> use counter and combind 8 divide_2 with 1 divide_3

 Then we get clkout = 9 posedges while refclk = 19 posedges. 

 ![image](https://github.com/KuiLiangLin/verilog_freq_div/blob/master/Waveform.JPG)
 