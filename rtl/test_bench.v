//#1 = 10ns
`timescale 1us/100ns
`define DFF_DLY 20
`define CYCLE 100
`define TOP_NAME clkdiv
module test_bench ();

//**************************** wire & reg**********************//
initial begin
    $display("//***************************************");
    $display("//==top input : rstn, refclk, [31:0] fenzi, [31:0] fenmu");
    $display("//==top output : clkout");
    $display("//***************************************");
    end

reg rstn, refclk;
reg [31:0] fenzi, fenmu;
wire clkout;

initial begin
    rstn = 0;
    refclk = 0;
    fenmu = 32'd0;
    fenzi = 32'd0;
    end

//**************************** module **********************//
initial begin
    $display("===module : clkdiv" );
    end
`TOP_NAME `TOP_NAME(
        .clkout(clkout),
		.rstn(rstn),
		.fenzi(fenzi),
        .fenmu(fenmu),
        .refclk(refclk)
);

//**************************** clock gen **********************//
reg clk;
initial begin
	$display("===starting generating clk");
	clk = 1'b0;
	forever #(`CYCLE/2) clk = !clk;
    end

//**************************** dump waveform **********************//
initial begin
	$display("===starting dump waveform");
	$dumpfile("dumpfile.vcd");
	$dumpvars(0,`TOP_NAME);
end

//**************************** main **********************//
initial begin
	$display("===starting pattern");    
    rstn = 0;
    #100;
    rstn = 1; 
    #100;
    force refclk = clk;
    fenzi = 32'd19;
    fenmu = 32'd9;
    #100;
    rstn = 0;
    #100;
    rstn = 1;


	$display("===all done");
	#10000 $finish;
    end

endmodule