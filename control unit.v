module control_unit(
		input [15:0]instruction,
		input clk,
		output [1:0]op,
		output binv,
		output cin,
		output mrd,
		output mwr,
		output wr);


always@(*)
begin
	case(instruction[11:8])
	4'b0000:	//AND
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;
	end
	4'b0001:	//OR
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0010:	//ADD
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0011:	//SUB
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0100:	//ANDi
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0101:	//ORi
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0110:	//ADDi
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b0111:	//SUBi
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1000:	//SLT
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1001:	//SLTi
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1010:	//BEQ
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1011:	//BNE
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1100:	//J
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1101:	//
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;
	end
	4'b1110:	//LW
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;	
	end
	4'b1111:	//SW
	begin
		op=;
		binv=;
		cin=;
		mrd=;
		mwr=;
		wr=;		
	end
end



		
endmodule
