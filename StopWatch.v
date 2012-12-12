module StopWatch(clk, MSB0, MSB1, MSB2, MSB3, LSB0, LSB1, LSB2, LSB3, Interrupt);
	
	input clk;

	output reg MSB0, MSB1, MSB2, MSB3;
	output reg LSB0, LSB1, LSB2, LSB3;
	input Interrupt;
	reg [3:0] MSBcount;
	reg [3:0] LSBcount;
	

always@(negedge clk) begin

	if(Interrupt==0)
		begin
		
		if(MSBcount <= 9)
			begin
			if(LSBcount < 9)
				begin
				MSB3 <= MSBcount[3];
				MSB2 <= MSBcount[2];
				MSB1 <= MSBcount[1];
				MSB0 <= MSBcount[0];
				LSB3 <= LSBcount[3];
				LSB2 <= LSBcount[2];
				LSB1 <= LSBcount[1];
				LSB0 <= LSBcount[0];
				LSBcount <= LSBcount + 1;
			end
			else begin
				LSBcount <= 0;
				MSBcount <= MSBcount + 1;
				MSB3 <= MSBcount[3];
				MSB2 <= MSBcount[2];
				MSB1 <= MSBcount[1];
				MSB0 <= MSBcount[0];
				LSB3 <= LSBcount[3];
				LSB2 <= LSBcount[2];
				LSB1 <= LSBcount[1];
				LSB0 <= LSBcount[0];
				end
			end
		else begin
			MSB3 <= 1;
			MSB2 <= 0;
			MSB1 <= 0;
			MSB0 <= 1;
			LSB3 <= 1;
			LSB2 <= 0;
			LSB1 <= 0;
			LSB0 <= 1;
		end
	end
	else begin
		MSB3 <= MSBcount[3];
		MSB2 <= MSBcount[2];
		MSB1 <= MSBcount[1];
		MSB0 <= MSBcount[0];
		LSB3 <= LSBcount[3];
		LSB2 <= LSBcount[2];
		LSB1 <= LSBcount[1];
		LSB0 <= LSBcount[0];	
	end
	
end		

endmodule
