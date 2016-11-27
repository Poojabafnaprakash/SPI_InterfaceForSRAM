module controller(decA, rstA, latchA, validA, loadCbuf, command, latchRx, validRx , decRx, rstRx, loadTx, decTx, shiftTx, rstTx, ss, in1,in2,in3,in4,in5, rst, lA, dA, cout);

output wire decA, rstA, latchA, validA, loadCbuf, command, latchRx, decRx, rstRx, ss, validRx, loadTx, decTx, shiftTx, rstTx;
input in1,in2,in3,in4,in5, rst, lA, dA, cout;

//output wire loadTx, decTx, rstTx, shiftTx;
//loadTx, decTx, rstTx, shiftTx,

and A2(ss1,~in1,~in2,~in3,~in4,in5);
and B2(ss2,~in1,~in2,~in3,in4,~in5);
and C2(ss3,~in1,~in2,~in3,in4,in5);
and D2(ss4,~in1,~in2,in3,~in4,~in5);

and E2(ss5,~in1,~in2,in3,~in4,in5);
and F2(ss6,~in1,~in2,in3,in4,~in5);
and G2(ss7,~in1,~in2,in3,in4,in5);
and H2(ss8,~in1,in2,~in3,~in4,~in5);

and I2(ss9,~in1,in2,~in3,~in4,in5);
and J2(ss10,~in1,in2,~in3,in4,~in5);
and K2(ss11,~in1,in2,~in3,in4,in5);
and L2(ss12,~in1,in2,in3,~in4,~in5);

and M2(ss13,~in1,in2,in3,~in4,in5);
and N2(ss14,~in1,in2,in3,in4,~in5);
and O2(ss15,~in1,in2,in3,in4,in5);
and P2(ss16,in1,~in2,~in3,~in4,~in5);
and R2(ss17,in1,~in2,~in3,~in4,in5);
and S2(ss18,in1,~in2,~in3,in4,~in5);
and T2(ss19,in1,~in2,~in3,in4,in5);

or Q2(ss20,ss1, ss2, ss3, ss4, ss5, ss6, ss7, ss8, ss9, ss10, ss11, ss12, ss13, ss14, ss15, ss16, ss17, ss18, ss19);
not ss18(ss, ss20);

and A(decA1,~in1,~in2,~in3,~in4,in5);
and B(decA2,~in1,~in2,~in3,in4,~in5);
and C(decA3,~in1,~in2,~in3,in4,in5);
and D(decA4,~in1,~in2,in3,~in4,~in5);
and E(decA5,~in1,~in2,in3,~in4,in5);
and F(decA6,~in1,~in2,in3,in4,~in5);
and G(decA7,~in1,~in2,in3,in4,in5);

or one(decA,decA1,decA2,decA3,decA4,decA5,decA6,decA7, dA);//1 


and two1(rstA1,~in1,in2,~in3,~in4,~in5);//2
or two(rstA, rstA1, rst );//2

and A1(latchA1,~in1,~in2,~in3,~in4,in5);
and B1(latchA2,~in1,~in2,~in3,in4,~in5);
and C1(latchA3,~in1,~in2,~in3,in4,in5);
and D1(latchA4,~in1,~in2,in3,~in4,~in5);
and E1(latchA5,~in1,~in2,in3,~in4,in5);
and F1(latchA6,~in1,~in2,in3,in4,~in5);
and G1(latchA7,~in1,~in2,in3,in4,in5);

or three(latchA,latchA1,latchA2,latchA3,latchA4,latchA5,latchA6,latchA7, lA);//3

and four(validA,~in1,in2,~in3,~in4,in5);//4

and five(loadCbuf,~in1,in2,~in3,~in4,in5);//5


and six1(command1,~in1,in2,~in3,in4,~in5);
and six2(command2,~in1,in2,~in3,in4,in5);
and six3(command3,~in1,in2,in3,~in4,~in5);
and six4(command4,~in1,in2,in3,~in4,in5);
and six5(command5,~in1,in2,in3,in4,~in5);
and six6(command6,~in1,in2,in3,in4,in5);
and six7(command7,in1,~in2,~in3,~in4,~in5);
and six8(command8,in1,~in2,~in3,~in4,in5);
and six9(command9,in1,~in2,~in3,in4,~in5);
and six10(command10,in1,~in2,~in3,~in4,in5);
and six11(command11,in1,~in2,~in3,in4,~in5);

or six(command,command1,command2,command3,command4,command5,command6,command7, command8, command9, command10, command11);//6


and I(decRx1,~in1,in2,~in3,in4,~in5);
and J(decRx2,~in1,in2,~in3,in4,in5);
and K(decRx3,~in1,in2,in3,~in4,~in5);
and P(decRx4,~in1,in2,in3,~in4,in5);
and Q(decRx5,~in1,in2,in3,in4,~in5);
and R(decRx6,~in1,in2,in3,in4,in5);
and S(decRx7,in1,~in2,~in3,~in4,~in5);
and S4(decRx8,in1,~in2,~in3,~in4,in5);


or eight(decRx9, decRx1, decRx2, decRx3, decRx4, decRx5, decRx6, decRx7, decRx8);//8
and rxcheck(decRx, decRx9, cout);

and I5(latchRx1,~in1,in2,~in3,in4,~in5);
and J5(latchRx2,~in1,in2,~in3,in4,in5);
and K5(latchRx3,~in1,in2,in3,~in4,~in5);
and P5(latchRx4,~in1,in2,in3,~in4,in5);
and Q5(latchRx5,~in1,in2,in3,in4,~in5);
and R5(latchRx6,~in1,in2,in3,in4,in5);
and S5(latchRx7,in1,~in2,~in3,~in4,~in5);
and T5(latchRx8,in1,~in2,~in3,~in4,in5);

or nine(latchRx9, latchRx2, latchRx3, latchRx4, latchRx5, latchRx6, latchRx7, latchRx8,latchRx1 );//9
and latchRxCheck(latchRx,latchRx9, cout );

and validRx1(validRx, in1,~in2,~in3,in4,~in5);

and ten(rstRx1,in1,~in2,~in3,in4,~in5);
or ten1(rstRx, rstRx1, rst);//10



//TX
and loadTxcommand(loadTx,~in1,in2,~in3,in4,in5);

and II(decTx1,~in1,in2,in3,~in4,~in5);
and JJ(decTx2,~in1,in2,in3,~in4,in5);
and KK(decTx3,~in1,in2,in3,in4,~in5);
and PP(decTx4,~in1,in2,in3,in4,in5);
and QQ(decTx5,in1,~in2,~in3,~in4,~in5);
and RR(decTx6,in1,~in2,~in3,~in4,in5);
and SS(decTx7,in1,~in2,~in3,in4,~in5);
and TT(decTx8,in1,~in2,~in3,in4,in5);

or eight1(decTx9, decTx1, decTx2, decTx3, decTx4, decTx5, decTx6, decTx7, decTx8);//8
and DeCcheck1(decTx, decTx9, ~cout);

and I65(shiftTx1,~in1,in2,in3,~in4,~in5);
and J65(shiftTx2,~in1,in2,in3,~in4,in5);
and K65(shiftTx3,~in1,in2,in3,in4,~in5);
and P65(shiftTx4,~in1,in2,in3,in4,in5);
and Q65(shiftTx5,in1,~in2,~in3,~in4,~in5);
and R65(shiftTx6,in1,~in2,~in3,~in4,in5);
and S65(shiftTx7,in1,~in2,~in3,in4,~in5);
and T65(shiftTx8,in1,~in2,~in3,in4,in5);

or eight2(shiftTx9, shiftTx1, shiftTx2, shiftTx3, shiftTx4, shiftTx5, shiftTx6, shiftTx7, shiftTx8);//8
and shiftcheck1(shiftTx, shiftTx9, ~cout);

and KK3(rstTx1, in1,~in2,in3,~in4,~in5);
or ten12(rstTx, rstTx1, rst);
endmodule