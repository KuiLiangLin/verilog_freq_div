#!usr/bin/perl
use warnings; use strict;
use LWP::Simple;

print ">>> TOP => Delet .out/.vvp/.vcd! \n";
system "del *.out";#for windows
#system "del *.vvp";#for windows
system "del *.vcd";#for windows
#system "rm -fr test_0_$stockNO.txt";#for linux 

print ">>> TOP => Run iverilog compiler! \n";
system "iverilog -g2012 rtl/*";
#system "iverilog -g2012 -gno-io-range-error rtl/*";

print ">>> TOP => Run vvp simulation! \n";
system "vvp a.out";

print ">>> TOP => Run gtkwave! \n";
system "gtkwave *.vcd";

print ">>> TOP => All works have been done! \n\n";
