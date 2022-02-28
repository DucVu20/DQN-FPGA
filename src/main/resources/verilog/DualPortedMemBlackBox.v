module DualPortedMemBlackBox
  #(parameter WIDTH=12,
    parameter MEM_DEPTH=64,
    parameter ADDR_WIDTH=6)
   (
    input wire 			clock,
    input wire [WIDTH-1:0] 	wrData,
    output wire [WIDTH-1:0] 	rdData,
    input wire [ADDR_WIDTH-1:0] readAddr,
    input wire [ADDR_WIDTH-1:0] writeAddr,
    input wire 			wrEna,
    input wire 			rdEna
    );
   
   // Declare the RAM variable
   reg [WIDTH-1:0] 	   ram[MEM_DEPTH-1:0];
   reg [WIDTH-1:0] 	   wrData_reg, rdData_reg;

   // Port A
   always @ (posedge clock)
     begin
	if (wrEna)
	  begin
	     ram[writeAddr] <= wrData;
	  end
     end // always @ (posedge clock)

   assign rdData = rdData_reg;
   
   always @(posedge clock)
     begin
	if(rdEna)
	  begin
	     rdData_reg <= ram[readAddr];
	  end
	else
	  begin
	     rdData_reg <= rdData_reg;
	  end
     end
   
   
endmodule
