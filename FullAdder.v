//Test Bench
module full_adder_TB;
    reg i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry;
    wire o_sum0,o_sum1,o_carry;

    full_adder test_adder(i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_sum0,o_sum1,o_carry);

    initial begin
        $monitor("[$monitor] time=%0t bitA0=%b bitA1=%b bitB0=%b bitB1=%b carry_in=%b carry_out=%b sum0_bit=%b sum1_bit=%b",$time,i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);

        $dumpfile("adder_tb.dump"); // create the dump file
		$dumpvars(0,full_adder_TB); // dump the variables into the file
        #12 
        //Without Carry
        i_bitA0=1; i_bitA1=0; i_bitB0=0; i_bitB1=1; i_carry=0;
		//#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=0; i_bitA1=1; i_bitB0=0; i_bitB1=1; i_carry=0;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=1; i_bitA1=1; i_bitB0=0; i_bitB1=1; i_carry=0;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=1; i_bitA1=1; i_bitB0=1; i_bitB1=1; i_carry=0;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        //With Carry
        i_bitA0=1; i_bitA1=0; i_bitB0=0; i_bitB1=1; i_carry=1;
		//#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=0; i_bitA1=1; i_bitB0=0; i_bitB1=1; i_carry=1;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=1; i_bitA1=1; i_bitB0=0; i_bitB1=1; i_carry=1;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
        #12 
        i_bitA0=1; i_bitA1=1; i_bitB0=1; i_bitB1=1; i_carry=1;
        //#12 $display("bitA0=%b, bitA1=%b,bitB0=%b, bitB1=%b, carry_in=%b,carry_out=%b, sum0_bit=%b,sum1_bit=%b",i_bitA0,i_bitA1,i_bitB0,i_bitB1,i_carry,o_carry,o_sum0,o_sum1);
    end 

endmodule        

module full_adder (i_bitA0,
                   i_bitA1,
                   i_bitB0,
                   i_bitB1,
                   i_carry,
                   o_sum0,
                   o_sum1,
                   o_carry);
 
  input  i_bitA0;
  input  i_bitA1;
  input  i_bitB0;
  input  i_bitB1;
  input  i_carry;
  output o_sum0;
  output o_sum1;
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
  assign w_WIRE_0 = i_bitB1 ^ i_carry; // ^ XOR, exclusive or

  //Sum Position 0
  assign w_WIRE_1 = i_bitA0 ^ i_bitB0; // & AND

  assign w_WIRE_2 = i_bitB1 | i_carry;

  assign w_WIRE_3 = w_WIRE_2 & i_bitA1;
  
  assign w_WIRE_4 = i_bitB1 & i_carry;
  assign w_WIRE_5 = w_WIRE_3 | w_WIRE_4;

  //Carry
  assign w_WIRE_6 = i_bitA0 | i_bitB0;
  assign w_WIRE_7 = i_bitA1 | i_bitB1;
  assign w_WIRE_8 = w_WIRE_7 & i_carry;
  assign w_WIRE_9 = i_bitA1 & i_bitB1;
  assign w_WIRE_10 = w_WIRE_8 | w_WIRE_9;

  assign w_WIRE_11 = w_WIRE_6 & w_WIRE_10;
  assign w_WIRE_12 = i_bitA0 & i_bitB0;

  //*** Output Assign ***

  //Sum Position 1 
  assign o_sum1 = w_WIRE_0 ^ i_bitA1;

  //Sum Position 0
  assign o_sum0 = w_WIRE_1 ^ w_WIRE_5;

  //Carry
  assign o_carry = w_WIRE_11 | w_WIRE_12; // | OR
 
  // FYI: Code above using wires will produce the same results as:
  // assign o_sum   = i_bitA0 ^ i_bitA1 ^ i_carry;
  // assign o_carry = (i_bitA0 ^ i_bitA1) & i_carry) | (i_bitA0 & i_bitA1);
 
  // Wires are just used to be explicit. 
   
endmodule