module vending_machine(
    input clk,
    input reset,
    input [1:0]in, //00 = reset, 01 = 5dollar, 10 = 10dollar
    output reg out, [1:0]change
);

parameter s0= 2'b00; //00 = reset
parameter s1= 2'b01; //01 = 5dollar
parameter s2= 2'b10; //10 = 10dollar

reg [1:0]c_state,n_state;

always@(posedge clk);
begin
    if(reset == 1)
    begin
       c_state = 0;
       n_state = 0; 
    end
    else
    begin
        c_state = n_state;
        case(c_state)
        s0: if(in == 0)
                begin
                   n_state = s0;
                   out=0;
                   change = 0;
                end
            else if(in == 2'b01)
                begin
                    n_state = s1;
                    out=0;
                    change = 0;
                end
            A if(in == 2'b10)
                begin
                    n_state = s2;
                    out=0;
                    change = 0;
                end
        s1: if(in == 0)
                begin
                   n_state = s0;
                   out=0;
                   change = 2'b01;
                end
            else if(in == 2'b01)
                begin
                    n_state = s2;
                    out=0;
                    change = 0;
                end
            else if(in == 2'b10)
                begin
                    n_state = s0;
                    out=1;
                    change = 0;
                end
        s2: if(in == 0)
                begin
                   n_state = s0;
                   out=0;
                   change = 2'b10;
                end
            else if(in == 2'b01)
                begin
                    n_state = s0;
                    out=1;
                    change = 0;
                end
            else if(in == 2'b10)
                begin
                    n_state = s0;
                    out=1;
                    change = 2'b01;
                end
        endcase
    end
end
endmodule