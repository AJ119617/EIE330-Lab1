`timescale 1ns/1ns
module full_adder_tb;
 reg a_n, b_n, cin_n;
 wire sum_n, carry_n;
 integer checks=0;
 integer fd;
 full_adder dut (.a_n(a_n), .b_n(b_n), .cin_n(cin_n), .sum_n(sum_n), .carry_n(carry_n));
 initial begin
  $dumpfile("full_adder_tb.vcd");
  $dumpvars(0,full_adder_tb);
  fd=$fopen("results.csv","w");
  if(fd==0) $fatal(1,"Cannot open results.csv");
  $fdisplay(fd,"case,time_ns,A,B,Cin,S,Cout,expected,actual,status");
  // Case 0: logical inputs 000, expected logical outputs 00
  {a_n,b_n,cin_n}=~3'b000; #1;
  if ({~sum_n,~carry_n} !== 2'b00) $fatal(1,"Case 0 failed");
  checks=checks+1;
  $fdisplay(fd,"0,%0t,%b,%b,%b,%b,%b,00,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 0 inputs=000 expected=00 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 1: logical inputs 001, expected logical outputs 10
  {a_n,b_n,cin_n}=~3'b001; #1;
  if ({~sum_n,~carry_n} !== 2'b10) $fatal(1,"Case 1 failed");
  checks=checks+1;
  $fdisplay(fd,"1,%0t,%b,%b,%b,%b,%b,10,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 1 inputs=001 expected=10 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 2: logical inputs 010, expected logical outputs 10
  {a_n,b_n,cin_n}=~3'b010; #1;
  if ({~sum_n,~carry_n} !== 2'b10) $fatal(1,"Case 2 failed");
  checks=checks+1;
  $fdisplay(fd,"2,%0t,%b,%b,%b,%b,%b,10,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 2 inputs=010 expected=10 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 3: logical inputs 011, expected logical outputs 01
  {a_n,b_n,cin_n}=~3'b011; #1;
  if ({~sum_n,~carry_n} !== 2'b01) $fatal(1,"Case 3 failed");
  checks=checks+1;
  $fdisplay(fd,"3,%0t,%b,%b,%b,%b,%b,01,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 3 inputs=011 expected=01 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 4: logical inputs 100, expected logical outputs 10
  {a_n,b_n,cin_n}=~3'b100; #1;
  if ({~sum_n,~carry_n} !== 2'b10) $fatal(1,"Case 4 failed");
  checks=checks+1;
  $fdisplay(fd,"4,%0t,%b,%b,%b,%b,%b,10,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 4 inputs=100 expected=10 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 5: logical inputs 101, expected logical outputs 01
  {a_n,b_n,cin_n}=~3'b101; #1;
  if ({~sum_n,~carry_n} !== 2'b01) $fatal(1,"Case 5 failed");
  checks=checks+1;
  $fdisplay(fd,"5,%0t,%b,%b,%b,%b,%b,01,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 5 inputs=101 expected=01 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 6: logical inputs 110, expected logical outputs 01
  {a_n,b_n,cin_n}=~3'b110; #1;
  if ({~sum_n,~carry_n} !== 2'b01) $fatal(1,"Case 6 failed");
  checks=checks+1;
  $fdisplay(fd,"6,%0t,%b,%b,%b,%b,%b,01,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 6 inputs=110 expected=01 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  // Case 7: logical inputs 111, expected logical outputs 11
  {a_n,b_n,cin_n}=~3'b111; #1;
  if ({~sum_n,~carry_n} !== 2'b11) $fatal(1,"Case 7 failed");
  checks=checks+1;
  $fdisplay(fd,"7,%0t,%b,%b,%b,%b,%b,11,%b,PASS",$time,~a_n,~b_n,~cin_n,~sum_n,~carry_n,{~sum_n,~carry_n});
  $display("CASE 7 inputs=111 expected=11 actual=%b PASS",{~sum_n,~carry_n});
  #19;
  if(checks!=8) $fatal(1,"Missing cases");
  $fclose(fd);
  $display("PASS full_adder: %0d cases",checks);
  $finish;
 end
endmodule
