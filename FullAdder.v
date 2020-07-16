//Test Bench
module full_adder_TB;

    reg [1:0] i_a;
    reg [1:0] i_b;
    reg i_carry;

    wire [1:0] o_sum;
    wire o_carry;

    full_adder test_adder(i_a,i_b,i_carry,o_sum,o_carry);

    initial begin

        $dumpfile("adder_tb.dump"); 
		$dumpvars(0,full_adder_TB); 
        
        $monitor("[$monitor] time=%0t [Sumando0] %1b [Sumando1] %1b [Carry]=%b [Resultado] %b %1b ",$time,i_a,i_b,i_carry,o_carry,o_sum);



        //Without Carry
        #12 
        i_a=10; i_b=01; i_carry=0;
        #12 
        i_a=01; i_b=01; i_carry=0;
        #12 
        i_a=11; i_b=01; i_carry=0;
        #12 
        i_a=11; i_b=11; i_carry=0; 


        //With Carry
        #12 
        i_a=10; i_b=01; i_carry=1;
        #12 
        i_a=01; i_b=01; i_carry=1;
        #12 
        i_a=11; i_b=01; i_carry=1;
        #12 
        i_a=11; i_b=11; i_carry=1; 

    end 

endmodule        

module full_adder (i_a,
                   i_b,
                   i_carry,
                   o_sum,
                   o_carry);
 
  input [1:0] i_a;
  input [1:0] i_b;
  input  i_carry;

  output [1:0] o_sum;
  output o_carry;
  
  //Sum Position 1 
  wire   w_WIRE_0;

  //Sum Position 0
  wire   w_WIRE_1;
  wire   w_WIRE_2;
  wire   w_WIRE_3;
  wire   w_WIRE_4;
  wire   w_WIRE_5;

  //Carry
  wire   w_WIRE_6;
  wire   w_WIRE_7;
  wire   w_WIRE_8;
  wire   w_WIRE_9;
  wire   w_WIRE_10;
  wire   w_WIRE_11;
  wire   w_WIRE_12;

  //*** Wire Assign ***   

  //Sum Position 1 
  assign w_WIRE_0 = i_b[0] ^ i_carry; 

  //Sum Position 0
  assign w_WIRE_1 = i_a[1] ^ i_b[1]; 

  assign w_WIRE_2 = i_b[0] | i_carry;

  assign w_WIRE_3 = w_WIRE_2 & i_a[0];
  
  assign w_WIRE_4 = i_b[0] & i_carry;
  assign w_WIRE_5 = w_WIRE_3 | w_WIRE_4;

  //Carry
  assign w_WIRE_6 = i_a[1] | i_b[1];
  assign w_WIRE_7 = i_a[0] | i_b[0];
  assign w_WIRE_8 = w_WIRE_7 & i_carry;
  assign w_WIRE_9 = i_a[0] & i_b[0];
  assign w_WIRE_10 = w_WIRE_8 | w_WIRE_9;

  assign w_WIRE_11 = w_WIRE_6 & w_WIRE_10;
  assign w_WIRE_12 = i_a[1] & i_b[1];

  //*** Output Assign ***

  //Sum Position 1 
  assign o_sum[0] = w_WIRE_0 ^ i_a[0];

  //Sum Position 0
  assign o_sum[1] = w_WIRE_1 ^ w_WIRE_5;

  //Carry
  assign o_carry = w_WIRE_11 | w_WIRE_12; 
 

   
endmodule