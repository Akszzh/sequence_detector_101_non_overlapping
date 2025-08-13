module sequence_detector(
	input clk,
	input reset,
	input x,
	output reg z
);


	parameter S0=2'b00;
	parameter S1=2'b01;
	parameter S2=2'b10;
	parameter S3=2'b11;

	reg[1:0] current , next;

	always@(posedge clk or posedge reset)
		begin 
			if(reset)
				current <= S0;

			else
				current <= next;
		end

	always@(*)
		begin
			case(current)
				S0: next = x?S1:S0;
				S1: next = x?S1:S2;
				S2: next = x?S3:S0;
				S3: next = x?S1:S0;
			endcase
		end 
	
	always@(*)
		begin
			case(current)
				S2:z = (x==1)?1:0;
				default z=0;
			endcase
		end	
endmodule
			

	
		
				
				
