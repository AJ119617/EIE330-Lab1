`timescale 1ns/1ns
module comparator_tb;
 reg a_n, b_n;
 wire lt_n, eq_n, gt_n;
 integer checks=0;
 integer fd;
 comparator dut (.a_n(a_n), .b_n(b_n), .lt_n(lt_n), .eq_n(eq_n), .gt_n(gt_n));
 initial begin
  $dumpfile("comparator_tb.vcd");
  $dumpvars(0,comparator_tb);
  fd=$fopen("results.csv","w");
  if(fd==0) $fatal(1,"Cannot open results.csv");
  $fdisplay(fd,"case,time_ns,A,B,LT,EQ,GT,expected,actual,status");
  // Case 0: logical inputs 00, expected logical outputs 010
  {a_n,b_n}=~2'b00; #1;
  if ({~lt_n,~eq_n,~gt_n} !== 3'b010) $fatal(1,"Case 0 failed");
  if (({~lt_n,~eq_n,~gt_n} !== 3'b100) && ({~lt_n,~eq_n,~gt_n} !== 3'b010) && ({~lt_n,~eq_n,~gt_n} !== 3'b001)) $fatal(1,"Not one hot");
  checks=checks+1;
  $fdisplay(fd,"0,%0t,%b,%b,%b,%b,%b,010,%b,PASS",$time,~a_n,~b_n,~lt_n,~eq_n,~gt_n,{~lt_n,~eq_n,~gt_n});
  $display("CASE 0 inputs=00 expected=010 actual=%b PASS",{~lt_n,~eq_n,~gt_n});
  #19;
  // Case 1: logical inputs 01, expected logical outputs 100
  {a_n,b_n}=~2'b01; #1;
  if ({~lt_n,~eq_n,~gt_n} !== 3'b100) $fatal(1,"Case 1 failed");
  if (({~lt_n,~eq_n,~gt_n} !== 3'b100) && ({~lt_n,~eq_n,~gt_n} !== 3'b010) && ({~lt_n,~eq_n,~gt_n} !== 3'b001)) $fatal(1,"Not one hot");
  checks=checks+1;
  $fdisplay(fd,"1,%0t,%b,%b,%b,%b,%b,100,%b,PASS",$time,~a_n,~b_n,~lt_n,~eq_n,~gt_n,{~lt_n,~eq_n,~gt_n});
  $display("CASE 1 inputs=01 expected=100 actual=%b PASS",{~lt_n,~eq_n,~gt_n});
  #19;
  // Case 2: logical inputs 10, expected logical outputs 001
  {a_n,b_n}=~2'b10; #1;
  if ({~lt_n,~eq_n,~gt_n} !== 3'b001) $fatal(1,"Case 2 failed");
  if (({~lt_n,~eq_n,~gt_n} !== 3'b100) && ({~lt_n,~eq_n,~gt_n} !== 3'b010) && ({~lt_n,~eq_n,~gt_n} !== 3'b001)) $fatal(1,"Not one hot");
  checks=checks+1;
  $fdisplay(fd,"2,%0t,%b,%b,%b,%b,%b,001,%b,PASS",$time,~a_n,~b_n,~lt_n,~eq_n,~gt_n,{~lt_n,~eq_n,~gt_n});
  $display("CASE 2 inputs=10 expected=001 actual=%b PASS",{~lt_n,~eq_n,~gt_n});
  #19;
  // Case 3: logical inputs 11, expected logical outputs 010
  {a_n,b_n}=~2'b11; #1;
  if ({~lt_n,~eq_n,~gt_n} !== 3'b010) $fatal(1,"Case 3 failed");
  if (({~lt_n,~eq_n,~gt_n} !== 3'b100) && ({~lt_n,~eq_n,~gt_n} !== 3'b010) && ({~lt_n,~eq_n,~gt_n} !== 3'b001)) $fatal(1,"Not one hot");
  checks=checks+1;
  $fdisplay(fd,"3,%0t,%b,%b,%b,%b,%b,010,%b,PASS",$time,~a_n,~b_n,~lt_n,~eq_n,~gt_n,{~lt_n,~eq_n,~gt_n});
  $display("CASE 3 inputs=11 expected=010 actual=%b PASS",{~lt_n,~eq_n,~gt_n});
  #19;
  if(checks!=4) $fatal(1,"Missing cases");
  $fclose(fd);
  $display("PASS comparator: %0d cases",checks);
  $finish;
 end
endmodule
