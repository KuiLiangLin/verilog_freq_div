/*
(19/9) * (a+b)=2a+3b ===> a=8, b=1
*/
`timescale 1us/100ns
`define DFF_DLY 20
module clkdiv(
                  output reg   clkout,
                  input        rstn,
                  input        refclk,
                  input [31:0] fenzi,//fenzi/fenmu must equal or more than 2
                  input [31:0] fenmu //fenzi/fenmu must equal or more than 2
);
   reg [2:0]                   rstn_syn;
   reg [31:0]                  cnt;

   //1. reset synchronization;
   //2. indicate that refclk is already stable
   always @(posedge refclk) begin
      rstn_syn[0] <= #`DFF_DLY rstn;
      rstn_syn[1] <= #`DFF_DLY rstn_syn[0];
      rstn_syn[2] <= #`DFF_DLY rstn_syn[1];
   end

   //1. main algorithm
   always @(posedge refclk or negedge rstn_syn[2]) begin
      if(!rstn_syn[2]) cnt <= #`DFF_DLY 0;
      else begin
         if(cnt < fenzi) cnt <= #`DFF_DLY cnt + fenmu;
         else cnt <= #`DFF_DLY cnt + fenmu - fenzi;
      end
   end

   //1. base the above algorithm, deduce clkout
   always @(posedge refclk or negedge rstn_syn[2]) begin
      if(!rstn_syn[2]) clkout <= #`DFF_DLY 0;
      else begin
         if(((cnt > (fenzi>>1)) || (cnt == (fenzi>>1))) && (cnt < fenzi)) clkout <= #`DFF_DLY 1;
         else clkout <= #`DFF_DLY 0;
      end
   end
endmodule
