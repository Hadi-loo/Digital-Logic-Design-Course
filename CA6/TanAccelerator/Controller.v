module controller(input clk,rst,start,Co, output reg ready,busy,load_x,load_term,load_res,init_cnt,init_term,init_res,cnt_en);
	parameter [1:0] idle=0, init=1, load=2, calc=3;
	reg [1:0] ps,ns;
	
	always @(ps,start,Co) begin
		ns = idle;
		ready = 0;
		busy = 0;
		load_x = 0;
		load_term = 0;
		load_res = 0;
		init_cnt = 0;
		init_term = 0;
		init_res = 0;
		cnt_en = 0;
		case (ps)
			idle: begin ns = start ? idle : init; ready=1'b1; end
			init: begin ns = start ? load : init; init_cnt=1'b1; end
			load: begin ns = calc; busy=1'b1; init_term=1'b1; init_res=1'b1; load_x=1'b1; end
			calc: begin ns = Co ? idle : calc;
					busy = 1'b1;
					cnt_en = Co ? 1'b0 : 1'b1;
					load_term = Co ? 1'b0 : 1'b1;
					load_res = Co ? 1'b0 : 1'b1; end
		endcase
	end

	always @(posedge clk, posedge rst) begin
		if (rst) ps <= idle;
		else ps <= ns;
	end
	
endmodule 