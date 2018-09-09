# verilog_freq_div

<em><a href="https://github.com/KuiLiangLin/verilog_freq_div/">View frequency divisor on GitHub</a></em>. 

<hr>

This module is used to divide frequency.

 If we want 19 clks to be divided into 9 clks, we can use : 

 fenzi = 19 and fenmu = 9.
 
 19/9 = (2a+3b)/(a+b) --> a = 8, b = 1 --> use counter and combind 8 divide_2 with 1 divide_3

 Then we get clkout = 9 posedges while refclk = 19 posedges. 

 <img src="https://raw.githubusercontent.com/KuiLiangLin/verilog_freq_div/master/Waveform.JPG" height="100%" width="100%" >
 
<hr>
<h3> END </h3>
<ul><li> You can return <em><a href="https://kuilianglin.github.io/Welcome/">My Main Page</a></em>. </li></ul>
