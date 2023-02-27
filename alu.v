module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);
        
    input [31:0] data_operandA, data_operandB;
    input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

    output [31:0] data_result;
    output isNotEqual, isLessThan, overflow;
    //and gates compounded with gate 2 isNotEqual
    //implement MSB for isLessThan 



    // add your code here:

    wire [31:0] sum;
    wire [31:0] difference;
    wire [31:0] bNegate;
    wire [2:0] actual_select;
    wire [31:0] logicallyleft, arithmeticallyright;
    wire [31:0] test3 = 32'b00000000000000000000000000000000;
    wire [31:0] test2 = 32'b00000000000000000000000000000000;
    wire [31:0] test5 = 32'b00000000000000000000000000000000;
    wire [31:0] test6 = 32'b00000000000000000000000000000000;
    wire [31:0] test7 = 32'b00000000000000000000000000000000;
    wire [31:0] andfinal, orfinal;
    wire carryingin;
    wire carryingout1;
    wire carryingout2;
    assign carryingin = ctrl_ALUopcode[0];
    assign actual_select[2:0] = ctrl_ALUopcode[2:0];
    wire bNegate0, bNegate1, bNegate2, bNegate3, bNegate4, bNegate5, bNegate6, bNegate7, bNegate8, bNegate9, bNegate10, bNegate11;
    wire bNegate12, bNegate13, bNegate14, bNegate15, bNegate16, bNegate17, bNegate18, bNegate19, bNegate20, bNegate21;
    wire bNegate22, bNegate23, bNegate24, bNegate25, bNegate26, bNegate27, bNegate28, bNegate29, bNegate30, bNegate31;
    wire aMSB, bMSB, sumMSB, differenceMSB;
    wire naMSB, nbMSB, nsumMSB, ndifferenceMSB;
    wire overflow1resultadd, overflow2resultadd;
    wire overflow1resultsub, overflow2resultsub;
    wire finaladdoverflowresult, finalsuboverflowresult;

    //if positive + positive = negative overflow
    //if negative + negative = positive overflow

    assign aMSB = data_operandA[31];
    assign bMSB = data_operandB[31];
    assign sumMSB = sum[31];
    assign differenceMSB = difference[31];



    not negatingB0(bNegate0, data_operandB[0]);
    not negatingB1(bNegate1, data_operandB[1]);
    not negatingB2(bNegate2, data_operandB[2]);
    not negatingB3(bNegate3, data_operandB[3]);
    not negatingB4(bNegate4, data_operandB[4]);
    not negatingB5(bNegate5, data_operandB[5]);
    not negatingB6(bNegate6, data_operandB[6]);
    not negatingB7(bNegate7, data_operandB[7]);
    not negatingB8(bNegate8, data_operandB[8]);
    not negatingB9(bNegate9, data_operandB[9]);
    not negatingB10(bNegate10, data_operandB[10]);
    not negatingB11(bNegate11, data_operandB[11]);
    not negatingB12(bNegate12, data_operandB[12]);
    not negatingB13(bNegate13, data_operandB[13]);
    not negatingB14(bNegate14, data_operandB[14]);
    not negatingB15(bNegate15, data_operandB[15]);
    not negatingB16(bNegate16, data_operandB[16]);
    not negatingB17(bNegate17, data_operandB[17]);
    not negatingB18(bNegate18, data_operandB[18]);
    not negatingB19(bNegate19, data_operandB[19]);
    not negatingB20(bNegate20, data_operandB[20]);
    not negatingB21(bNegate21, data_operandB[21]);
    not negatingB22(bNegate22, data_operandB[22]);
    not negatingB23(bNegate23, data_operandB[23]);
    not negatingB24(bNegate24, data_operandB[24]);
    not negatingB25(bNegate25, data_operandB[25]);
    not negatingB26(bNegate26, data_operandB[26]);
    not negatingB27(bNegate27, data_operandB[27]);
    not negatingB28(bNegate28, data_operandB[28]);
    not negatingB29(bNegate29, data_operandB[29]);
    not negatingB30(bNegate30, data_operandB[30]);
    not negatingB31(bNegate31, data_operandB[31]);

    assign bNegate[0] = bNegate0;
    assign bNegate[1] = bNegate1;
    assign bNegate[2] = bNegate2;
    assign bNegate[3] = bNegate3;
    assign bNegate[4] = bNegate4;
    assign bNegate[5] = bNegate5;
    assign bNegate[6] = bNegate6;
    assign bNegate[7] = bNegate7;
    assign bNegate[8] = bNegate8;
    assign bNegate[9] = bNegate9;
    assign bNegate[10] = bNegate10;
    assign bNegate[11] = bNegate11;
    assign bNegate[12] = bNegate12;
    assign bNegate[13] = bNegate13;
    assign bNegate[14] = bNegate14;
    assign bNegate[15] = bNegate15;
    assign bNegate[16] = bNegate16;
    assign bNegate[17] = bNegate17;
    assign bNegate[18] = bNegate18;
    assign bNegate[19] = bNegate19;
    assign bNegate[20] = bNegate20;
    assign bNegate[21] = bNegate21;
    assign bNegate[22] = bNegate22;
    assign bNegate[23] = bNegate23;
    assign bNegate[24] = bNegate24;
    assign bNegate[25] = bNegate25;
    assign bNegate[26] = bNegate26;
    assign bNegate[27] = bNegate27;
    assign bNegate[28] = bNegate28;
    assign bNegate[29] = bNegate29;
    assign bNegate[30] = bNegate30;
    assign bNegate[31] = bNegate31;




    //MAIN CHOOSING MUX
    mux_8 chooser(data_result, actual_select, sum, difference, andfinal, orfinal, logicallyleft, arithmeticallyright, test6, test7);
    cla_adder adding(sum, data_operandA, data_operandB, carryingin, carryingout1);
    cla_adder subtracting(difference, data_operandA, bNegate, carryingin, carryingout2);
    logical_left_shift shiftingleft(logicallyleft, ctrl_shiftamt, data_operandA);
    assign isLessThan = differenceMSB;
    andbitwise anditup(andfinal, data_operandA, data_operandB);
    orbitwise oritup(orfinal, data_operandA, data_operandB);
    right_shift shiftingright(arithmeticallyright, ctrl_shiftamt, data_operandA);


    not overflow1negatea(naMSB, aMSB);
    not overflow1negateb(nbMSB, bMSB);
    not overflow2negatesum(nsumMSB, sumMSB);
    and overflow1add(overflow1resultadd, naMSB, nbMSB, sumMSB);
    and overflow2add(overflow2resultadd, aMSB, bMSB, nsumMSB);
    or addoverflowresult(finaladdoverflowresult, overflow1resultadd, overflow2resultadd);

    not overflownegatedifference(ndifferenceMSB, differenceMSB);
    and overflow1sub(overflow1resultsub, naMSB, bMSB, differenceMSB);
    and overflowsub(overflow2resultsub, aMSB, nbMSB, ndifferenceMSB);
    or suboverflowresult(finalsuboverflowresult, overflow1resultsub, overflow2resultsub);




    mux_2_overflow addorsub(overflow, carryingin, finaladdoverflowresult, finalsuboverflowresult);
    isitequal equalornot(isNotEqual, data_operandA, data_operandB);



endmodule

module full_adder(S, Cout, A, B, Cin);
    input A, B, Cin;
    output S, Cout;
    wire w1, w2, w3;

    xor Sresult(S, A, B, Cin);
    and A_and_B(w1, A, B);
    and A_and_Cin(w2, A, Cin);
    and B_and_Cin(w3, B, Cin);
    or w1_w2_w3(Cout, w1, w2, w3);

endmodule

module cla_adder(S, A, B, Carryin, c32);

    input Carryin;
    input [31:0] A, B;
    output [31:0] S;
    output c32;
    wire zerog, zerop, oneg, onep, twog, twop, threeg, threep;
    wire p0c0, p1g0, p1p0c0, p2g1, p2p1g0, p2p1p0c0, p3g2, p3p2g1, p3p2p1g0, p3p2p1p0c0;
    wire c8, c16, c24;
    wire firstCarryOut, secondCarryOut, thirdCarryOut, fourthCarryOut;
    wire [7:0] s1, s2, s3, s4;

    assign S[7:0] = s1;
    assign S[15:8] = s2;
    assign S[23:16] = s3;
    assign S[31:24] = s4;

    eight_bit_adder first(zerog, zerop, s1, A[7:0], B[7:0], Carryin, firstCarryOut);

    and p0c0gate(p0c0, zerop, Carryin);
    or c8gate(c8, p0c0, zerog);

    eight_bit_adder second(oneg, onep, s2, A[15:8], B[15:8], c8, secondCarryOut);

    and p1g0gate(p1g0, onep, zerog);
    and p1p0c0gate(p1p0c0, onep, zerop, Carryin);
    or c16gate(c16, oneg, p1g0, p1p0c0);

    eight_bit_adder third(twog, twop, s3, A[23:16], B[23:16], c16, thirdCarryOut);

    and p2g1gate(p2g1, twop, oneg);
    and p2p1g0gate(p2p1g0, twop, onep, zerog);
    and p2p1p0c0gate(p2p1p0c0, twop, onep, zerop, Carryin);
    or c24gate(c24, twog, p2g1, p2p1g0, p2p1p0c0);

    eight_bit_adder fourth(threeg, threep, s4, A[31:24], B[31:24], c24, fourthCarryOut);

    and p3g2gate(p3g2, threep, twog);
    and p3p2g1gate(p3p2g1, threep, twop, oneg);
    and p3p2p1g0gate(p3p2p1g0, threep, twop, onep, zerog);
    and p3p2p1p0c0gate(p3p2p1p0c0, threep, twop, onep, zerop, Carryin);
    or c32gate(c32, threeg, p3g2, p3p2g1, p3p2p1g0, p3p2p1p0c0);


endmodule

module eight_bit_adder(Gout, Pout, S, A, B, Cin, Cout);
    output Gout, Pout, Cout;
    output [7:0] S;
    input [7:0] A, B;
    input Cin;
    wire carry1, carry2, carry3, carry4, carry5, carry6, carry7;
    wire p0, p1, p2, p3, p4, p5, p6, p7; 
    wire g0, g1, g2, g3, g4, g5, g6, g7;
    wire pg1, pg2, pg3, pg4, pg5, pg6, pg7;

    full_adder add0(S[0], carry1, A[0], B[0], Cin);
    full_adder add1(S[1], carry2, A[1], B[1], carry1);
    full_adder add2(S[2], carry3, A[2], B[2], carry2);
    full_adder add3(S[3], carry4, A[3], B[3], carry3);
    full_adder add4(S[4], carry5, A[4], B[4], carry4);
    full_adder add5(S[5], carry6, A[5], B[5], carry5);
    full_adder add6(S[6], carry7, A[6], B[6], carry6);
    full_adder add7(S[7], Cout, A[7], B[7], carry7);
    
    or propagate0(p0, A[0], B[0]);
    or propagate1(p1, A[1], B[1]);
    or propagate2(p2, A[2], B[2]);
    or propagate3(p3, A[3], B[3]);
    or propagate4(p4, A[4], B[4]);
    or propagate5(p5, A[5], B[5]);
    or propagate6(p6, A[6], B[6]);
    or propagate7(p7, A[7], B[7]);

    and generate0(g0, A[0], B[0]);
    and generate1(g1, A[1], B[1]);
    and generate2(g2, A[2], B[2]);
    and generate3(g3, A[3], B[3]);
    and generate4(g4, A[4], B[4]);
    and generate5(g5, A[5], B[5]);
    and generate6(g6, A[6], B[6]);
    and generate7(g7, A[7], B[7]);

    and propagateMain(Pout, p0, p1, p2, p3, p4, p5, p6, p7);

    and pg1gate(pg1, p7, g6);
    and pg2gate(pg2, p7, p6, g5);
    and pg3gate(pg3, p7, p6, p5, g4);
    and pg4gate(pg4, p7, p6, p5, p4, g3);
    and pg5gate(pg5, p7, p6, p5, p4, p3, g2);
    and pg6gate(pg6, p7, p6, p5, p4, p3, p2, g1);
    and pg7gate(pg7, p7, p6, p5, p4, p3, p2, p1, g0);

    
    or generateMain(Gout, g7, pg1, pg2, pg3, pg4, pg5, pg6, pg7);


endmodule

module mux_8(out, select, in0, in1, in2, in3, in4, in5, in6, in7);
    input [2:0] select;
    input [31:0] in0, in1, in2, in3, in4, in5, in6, in7;
    output [31:0] out;
    wire [31:0] w1, w2;
    mux_4 top_first(w1, select[1:0], in0, in1, in2, in3);
    mux_4 bottom_first(w2, select[1:0], in4, in5, in6, in7);
    mux_2 second_mux2(out, select[2], w1, w2);
endmodule

module mux_4(out, select, in0, in1, in2, in3);
    input [1:0] select;
    input [31:0] in0, in1, in2, in3;
    output [31:0] out;
    wire [31:0] w1, w2;
    mux_2 first_top(w1, select[0], in0, in1);
    mux_2 first_bottom(w2, select[0], in2, in3);
    mux_2 second(out, select[1], w1, w2);
endmodule

module mux_2(out, select, in0, in1);
    input select;
    input [31:0] in0, in1;
    output [31:0] out;
    assign out = select ? in1 : in0;
endmodule

module mux_2_overflow(out, select, in0, in1);
    input select;
    input in0, in1;
    output out;
    assign out = select ? in1 : in0;
endmodule


module isitequal(out, a, b);
    input [31:0] a, b;
    output out;
    wire a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20, a21, a22, a23;
    wire a24, a25, a26, a27, a28, a29, a30, a31;
    wire b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23;
    wire b24, b25, b26, b27, b28, b29, b30, b31;
    wire a0b0, a1b1, a2b2, a3b3, a4b4, a5b5, a6b6, a7b7, a8b8, a9b9, a10b10, a11b11, a12b12, a13b13, a14b14, a15b15, a16b16;
    wire a17b17, a18b18, a19b19, a20b20, a21b21, a22b22, a23b23, a24b24, a25b25, a26b26, a27b27, a28b28;
    wire a29b29, a30b30, a31b31;

    assign a0 = a[0];
    assign a1 = a[1];
    assign a2 = a[2];
    assign a3 = a[3];
    assign a4 = a[4];
    assign a5 = a[5];
    assign a6 = a[6];
    assign a7 = a[7];
    assign a8 = a[8];
    assign a9 = a[9];
    assign a10 = a[10];
    assign a11 = a[11];
    assign a12 = a[12];
    assign a13 = a[13];
    assign a14 = a[14];
    assign a15 = a[15];
    assign a16 = a[16];
    assign a17 = a[17];
    assign a18 = a[18];
    assign a19 = a[19];
    assign a19 = a[19];
    assign a20 = a[20];
    assign a21 = a[21];
    assign a22 = a[22];
    assign a23 = a[23];
    assign a24 = a[24];
    assign a25 = a[25];
    assign a26 = a[26];
    assign a27 = a[27];
    assign a28 = a[28];
    assign a29 = a[29];
    assign a30 = a[30];
    assign a31 = a[31];

    assign b0 = b[0];
    assign b1 = b[1];
    assign b2 = b[2];
    assign b3 = b[3];
    assign b4 = b[4];
    assign b5 = b[5];
    assign b6 = b[6];
    assign b7 = b[7];
    assign b8 = b[8];
    assign b9 = b[9];
    assign b10 = b[10];
    assign b11 = b[11];
    assign b12 = b[12];
    assign b13 = b[13];
    assign b14 = b[14];
    assign b15 = b[15];
    assign b16 = b[16];
    assign b17 = b[17];
    assign b18 = b[18];
    assign b19 = b[19];
    assign b20 = b[20];
    assign b21 = b[21];
    assign b22 = b[22];
    assign b23 = b[23];
    assign b24 = b[24];
    assign b25 = b[25];
    assign b26 = b[26];
    assign b27 = b[27];
    assign b28 = b[28];
    assign b29 = b[29];
    assign b30 = b[30];
    assign b31 = b[31];

    xnor a0b0gate(a0b0, a0, b0);
    xnor a1b1gate(a1b1, a1, b1);
    xnor a2b2gate(a2b2, a2, b2);
    xnor a3b3gate(a3b3, a3, b3);
    xnor a4b4gate(a4b4, a4, b4);
    xnor a5b5gate(a5b5, a5, b5);
    xnor a6b6gate(a6b6, a6, b6);
    xnor a7b7gate(a7b7, a7, b7);
    xnor a8b8gate(a8b8, a8, b8);
    xnor a9b9gate(a9b9, a9, b9);
    xnor a10b10gate(a10b10, a10, b10);
    xnor a11b11gate(a11b11, a11, b11);
    xnor a12b12gate(a12b12, a12, b12);
    xnor a13b13gate(a13b13, a13, b13);
    xnor a14b14gate(a14b14, a14, b14);
    xnor a15b15gate(a15b15, a15, b15);
    xnor a16b16gate(a16b16, a16, b16);
    xnor a17b17gate(a17b17, a17, b17);
    xnor a18b18gate(a18b18, a18, b18);
    xnor a19b19gate(a19b19, a19, b19);
    xnor a20b20gate(a20b20, a20, b20);
    xnor a21b21gate(a21b21, a21, b21);
    xnor a22b22gate(a22b22, a22, b22);
    xnor a23b23gate(a23b23, a23, b23);
    xnor a24b24gate(a24b24, a24, b24);
    xnor a25b25gate(a25b25, a25, b25);
    xnor a26b26gate(a26b26, a26, b26);
    xnor a27b27gate(a27b27, a27, b27);
    xnor a28b28gate(a28b28, a28, b28);
    xnor a29b29gate(a29b29, a29, b29);
    xnor a30b30gate(a30b30, a30, b30);
    xnor a31b31gate(a31b31, a31, b31);

    nand resFinal(out, a0b0, a1b1, a2b2, a3b3, a4b4, a5b5, a6b6, a7b7, a8b8, a9b9, a10b10, a11b11, a12b12, a13b13, a14b14, a15b15, a16b16, a17b17, a18b18, a19b19, a20b20, a21b21, a22b22, a23b23, a24b24, a25b25, a26b26, a27b27, a28b28, a29b29, a30b30, a31b31);




endmodule

module logical_left_shift(out, shiftAmount, operandA);

    input [31:0] operandA;
    input [4:0] shiftAmount;
    output [31:0] out;


    wire [31:0] sixteenresult, eightresult, fourresult, tworesult, oneresult;
    wire [31:0] lshift16, lshift8, lshift4, lshift2, lshift1;


    leftshiftersixteen sixteen1(lshift16, operandA);
    mux_2 sixteen(sixteenresult, shiftAmount[4], operandA, lshift16);
    leftshiftereight eight1(lshift8, sixteenresult);
    mux_2 eight(eightresult, shiftAmount[3], sixteenresult, lshift8);
    leftshifterfour four1(lshift4, eightresult);
    mux_2 four(fourresult, shiftAmount[2], eightresult, lshift4);
    leftshiftertwo two1(lshift2, fourresult);
    mux_2 two(tworesult, shiftAmount[1], fourresult, lshift2);
    leftshifterone one1(lshift1, tworesult);
    mux_2 one(oneresult, shiftAmount[0], tworesult, lshift1);
    assign out[31:0] = oneresult;





endmodule

module leftshiftersixteen(out, operandA1);
    input [31:0] operandA1;
    output [31:0] out;

    assign out[31] = operandA1[15];
    assign out[30] = operandA1[14];
    assign out[29] = operandA1[13];
    assign out[28] = operandA1[12];
    assign out[27] = operandA1[11];
    assign out[26] = operandA1[10];
    assign out[25] = operandA1[9];
    assign out[24] = operandA1[8];
    assign out[23] = operandA1[7];
    assign out[22] = operandA1[6];
    assign out[21] = operandA1[5];
    assign out[20] = operandA1[4];
    assign out[19] = operandA1[3];
    assign out[18] = operandA1[2];
    assign out[17] = operandA1[1];
    assign out[16] = operandA1[0];
    assign out[15] = 1'b0;
    assign out[14] = 1'b0;
    assign out[13] = 1'b0;
    assign out[12] = 1'b0;
    assign out[11] = 1'b0;
    assign out[10] = 1'b0;
    assign out[9] = 1'b0;
    assign out[8] = 1'b0;
    assign out[7] = 1'b0;
    assign out[6] = 1'b0;
    assign out[5] = 1'b0;
    assign out[4] = 1'b0;
    assign out[3] = 1'b0;
    assign out[2] = 1'b0;
    assign out[1] = 1'b0;
    assign out[0] = 1'b0;

endmodule

module leftshiftereight(out, operandA2);
    input [31:0] operandA2;
    output [31:0] out;

    assign out[31] = operandA2[23];
    assign out[30] = operandA2[22];
    assign out[29] = operandA2[21];
    assign out[28] = operandA2[20];
    assign out[27] = operandA2[19];
    assign out[26] = operandA2[18];
    assign out[25] = operandA2[17];
    assign out[24] = operandA2[16];
    assign out[23] = operandA2[15];
    assign out[22] = operandA2[14];
    assign out[21] = operandA2[13];
    assign out[20] = operandA2[12];
    assign out[19] = operandA2[11];
    assign out[18] = operandA2[10];
    assign out[17] = operandA2[9];
    assign out[16] = operandA2[8];
    assign out[15] = operandA2[7];
    assign out[14] = operandA2[6];
    assign out[13] = operandA2[5];
    assign out[12] = operandA2[4];
    assign out[11] = operandA2[3];
    assign out[10] = operandA2[2];
    assign out[9] = operandA2[1];
    assign out[8] = operandA2[0];
    assign out[7] = 1'b0;
    assign out[6] = 1'b0;
    assign out[5] = 1'b0;
    assign out[4] = 1'b0;
    assign out[3] = 1'b0;
    assign out[2] = 1'b0;
    assign out[1] = 1'b0;
    assign out[0] = 1'b0;



endmodule

module leftshifterfour(out, operandA3);

    input[31:0] operandA3;
    output[31:0] out;


    assign out[31] = operandA3[27];
    assign out[30] = operandA3[26];
    assign out[29] = operandA3[25];
    assign out[28] = operandA3[24];
    assign out[27] = operandA3[23];
    assign out[26] = operandA3[22];
    assign out[25] = operandA3[21];
    assign out[24] = operandA3[20];
    assign out[23] = operandA3[19];
    assign out[22] = operandA3[18];
    assign out[21] = operandA3[17];
    assign out[20] = operandA3[16];
    assign out[19] = operandA3[15];
    assign out[18] = operandA3[14];
    assign out[17] = operandA3[13];
    assign out[16] = operandA3[12];
    assign out[15] = operandA3[11];
    assign out[14] = operandA3[10];
    assign out[13] = operandA3[9];
    assign out[12] = operandA3[8];
    assign out[11] = operandA3[7];
    assign out[10] = operandA3[6];
    assign out[9] = operandA3[5];
    assign out[8] = operandA3[4];
    assign out[7] = operandA3[3];
    assign out[6] = operandA3[2];
    assign out[5] = operandA3[1];
    assign out[4] = operandA3[0];
    assign out[3] = 1'b0;
    assign out[2] = 1'b0;
    assign out[1] = 1'b0;
    assign out[0] = 1'b0;

endmodule

module leftshiftertwo(out, operandA4);
    input [31:0] operandA4;
    output[31:0] out;

    assign out[31] = operandA4[29];
    assign out[30] = operandA4[28];
    assign out[29] = operandA4[27];
    assign out[28] = operandA4[26];
    assign out[27] = operandA4[25];
    assign out[26] = operandA4[24];
    assign out[25] = operandA4[23];
    assign out[24] = operandA4[22];
    assign out[23] = operandA4[21];
    assign out[22] = operandA4[20];
    assign out[21] = operandA4[19];
    assign out[20] = operandA4[18];
    assign out[19] = operandA4[17];
    assign out[18] = operandA4[16];
    assign out[17] = operandA4[15];
    assign out[16] = operandA4[14];
    assign out[15] = operandA4[13];
    assign out[14] = operandA4[12];
    assign out[13] = operandA4[11];
    assign out[12] = operandA4[10];
    assign out[11] = operandA4[9];
    assign out[10] = operandA4[8];
    assign out[9] = operandA4[7];
    assign out[8] = operandA4[6];
    assign out[7] = operandA4[5];
    assign out[6] = operandA4[4];
    assign out[5] = operandA4[3];
    assign out[4] = operandA4[2];
    assign out[3] = operandA4[1];
    assign out[2] = operandA4[0];
    assign out[1] = 1'b0;
    assign out[0] = 1'b0;

endmodule

module leftshifterone(out, operandA5);
    input[31:0] operandA5;
    output[31:0] out;

    assign out[31] = operandA5[30];
    assign out[30] = operandA5[29];
    assign out[29] = operandA5[28];
    assign out[28] = operandA5[27];
    assign out[27] = operandA5[26];
    assign out[26] = operandA5[25];
    assign out[25] = operandA5[24];
    assign out[24] = operandA5[23];
    assign out[23] = operandA5[22];
    assign out[22] = operandA5[21];
    assign out[21] = operandA5[20];
    assign out[20] = operandA5[19];
    assign out[19] = operandA5[18];
    assign out[18] = operandA5[17];
    assign out[17] = operandA5[16];
    assign out[16] = operandA5[15];
    assign out[15] = operandA5[14];
    assign out[14] = operandA5[13];
    assign out[13] = operandA5[12];
    assign out[12] = operandA5[11];
    assign out[11] = operandA5[10];
    assign out[10] = operandA5[9];
    assign out[9] = operandA5[8];
    assign out[8] = operandA5[7];
    assign out[7] = operandA5[6];
    assign out[6] = operandA5[5];
    assign out[5] = operandA5[4];
    assign out[4] = operandA5[3];
    assign out[3] = operandA5[2];
    assign out[2] = operandA5[1];
    assign out[1] = operandA5[0];
    assign out[0] = 1'b0;


endmodule

module andbitwise(out, Aoperand, Boperand);
    input [31:0] Aoperand, Boperand;
    output [31:0] out;
    wire and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17, and18, and19, and20;
    wire and21, and22, and23, and24, and25, and26, and27, and28, and29, and30, and31, and32;
    

    and and32gate(and32, Aoperand[31], Boperand[31]);
    and and31gate(and31, Aoperand[30], Boperand[30]);
    and and30gate(and30, Aoperand[29], Boperand[29]);
    and and29gate(and29, Aoperand[28], Boperand[28]);
    and and28gate(and28, Aoperand[27], Boperand[27]);
    and and27gate(and27, Aoperand[26], Boperand[26]);
    and and26gate(and26, Aoperand[25], Boperand[25]);
    and and25gate(and25, Aoperand[24], Boperand[24]);
    and and24gate(and24, Aoperand[23], Boperand[23]);
    and and23gate(and23, Aoperand[22], Boperand[22]);
    and and22gate(and22, Aoperand[21], Boperand[21]);
    and and21gate(and21, Aoperand[20], Boperand[20]);
    and and20gate(and20, Aoperand[19], Boperand[19]);
    and and19gate(and19, Aoperand[18], Boperand[18]);
    and and18gate(and18, Aoperand[17], Boperand[17]);
    and and17gate(and17, Aoperand[16], Boperand[16]);
    and and16gate(and16, Aoperand[15], Boperand[15]);
    and and15gate(and15, Aoperand[14], Boperand[14]);
    and and14gate(and14, Aoperand[13], Boperand[13]);
    and and13gate(and13, Aoperand[12], Boperand[12]);
    and and12gate(and12, Aoperand[11], Boperand[11]);
    and and11gate(and11, Aoperand[10], Boperand[10]);
    and and10gate(and10, Aoperand[9], Boperand[9]);
    and and9gate(and9, Aoperand[8], Boperand[8]);
    and and8gate(and8, Aoperand[7], Boperand[7]);
    and and7gate(and7, Aoperand[6], Boperand[6]);
    and and6gate(and6, Aoperand[5], Boperand[5]);
    and and5gate(and5, Aoperand[4], Boperand[4]);
    and and4gate(and4, Aoperand[3], Boperand[3]);
    and and3gate(and3, Aoperand[2], Boperand[2]);
    and and2gate(and2, Aoperand[1], Boperand[1]);
    and and1gate(and1, Aoperand[0], Boperand[0]);

    assign out[31] = and32;
    assign out[30] = and31;
    assign out[29] = and30;
    assign out[28] = and29;
    assign out[27] = and28;
    assign out[26] = and27;
    assign out[25] = and26;
    assign out[24] = and25;
    assign out[23] = and24;
    assign out[22] = and23;
    assign out[21] = and22;
    assign out[20] = and21;
    assign out[19] = and20;
    assign out[18] = and19;
    assign out[17] = and18;
    assign out[16] = and17;
    assign out[15] = and16;
    assign out[14] = and15;
    assign out[13] = and14;
    assign out[12] = and13;
    assign out[11] = and12;
    assign out[10] = and11;
    assign out[9] = and10;
    assign out[8] = and9;
    assign out[7] = and8;
    assign out[6] = and7;
    assign out[5] = and6;
    assign out[4] = and5;
    assign out[3] = and4;
    assign out[2] = and3;
    assign out[1] = and2;
    assign out[0] = and1;

endmodule

module orbitwise(out, Aop, Bop);
    input[31:0] Aop, Bop;
    output [31:0] out;
    
    wire or0, or1, or2, or3, or4, or5, or6, or7, or8, or9, or10, or11, or12, or13, or14, or15, or16;
    wire or17, or18, or19, or20, or21, or22, or23, or24, or25, or26, or27, or28, or29, or30, or31;

    or or31gate(or31, Aop[31], Bop[31]);
    or or30gate(or30, Aop[30], Bop[30]);
    or or29gate(or29, Aop[29], Bop[29]);
    or or28gate(or28, Aop[28], Bop[28]);
    or or27gate(or27, Aop[27], Bop[27]);
    or or26gate(or26, Aop[26], Bop[26]);
    or or25gate(or25, Aop[25], Bop[25]);
    or or24gate(or24, Aop[24], Bop[24]);
    or or23gate(or23, Aop[23], Bop[23]);
    or or22gate(or22, Aop[22], Bop[22]);
    or or21gate(or21, Aop[21], Bop[21]);
    or or20gate(or20, Aop[20], Bop[20]);
    or or19gate(or19, Aop[19], Bop[19]);
    or or18gate(or18, Aop[18], Bop[18]);
    or or17gate(or17, Aop[17], Bop[17]);
    or or16gate(or16, Aop[16], Bop[16]);
    or or15gate(or15, Aop[15], Bop[15]);
    or or14gate(or14, Aop[14], Bop[14]);
    or or13gate(or13, Aop[13], Bop[13]);
    or or12gate(or12, Aop[12], Bop[12]);
    or or11gate(or11, Aop[11], Bop[11]);
    or or10gate(or10, Aop[10], Bop[10]);
    or or9gate(or9, Aop[9], Bop[9]);
    or or8gate(or8, Aop[8], Bop[8]);
    or or7gate(or7, Aop[7], Bop[7]);
    or or6gate(or6, Aop[6], Bop[6]);
    or or5gate(or5, Aop[5], Bop[5]);
    or or4gate(or4, Aop[4], Bop[4]);
    or or3gate(or3, Aop[3], Bop[3]);
    or or2gate(or2, Aop[2], Bop[2]);
    or or1gate(or1, Aop[1], Bop[1]);
    or or0gate(or0, Aop[0], Bop[0]);

    assign out[31] = or31;
    assign out[30] = or30;
    assign out[29] = or29;
    assign out[28] = or28;
    assign out[27] = or27;
    assign out[26] = or26;
    assign out[25] = or25;
    assign out[24] = or24;
    assign out[23] = or23;
    assign out[22] = or22;
    assign out[21] = or21;
    assign out[20] = or20;
    assign out[19] = or19;
    assign out[18] = or18;
    assign out[17] = or17;
    assign out[16] = or16;
    assign out[15] = or15;
    assign out[14] = or14;
    assign out[13] = or13;
    assign out[12] = or12;
    assign out[11] = or11;
    assign out[10] = or10;
    assign out[9] = or9;
    assign out[8] = or8;
    assign out[7] = or7;
    assign out[6] = or6;
    assign out[5] = or5;
    assign out[4] = or4;
    assign out[3] = or3;
    assign out[2] = or2;
    assign out[1] = or1;
    assign out[0] = or0;

endmodule

module right_shift(out, amountShift, originalbit);
    input [31:0] originalbit;
    input [4:0] amountShift;
    output [31:0] out;
    wire mostSignificant;
    assign mostSignificant = originalbit[31];

    wire [31:0] resultsixteen, resulteight, resultfour, resulttwo, resultone;
    wire [31:0] rshift16, rshift8, rshift4, rshift2, rshift1;

    oneright oneup(rshift1, originalbit, mostSignificant);
    mux_2 rightoneup(resultone, amountShift[0], originalbit, rshift1);
    tworight twoup(rshift2, resultone, mostSignificant);
    mux_2 righttwoup(resulttwo, amountShift[1], resultone, rshift2);
    fourright fourup(rshift4, resulttwo, mostSignificant);
    mux_2 rightfourup(resultfour, amountShift[2], resulttwo, rshift4);
    eightright eightup(rshift8, resultfour, mostSignificant);
    mux_2 righteightup(resulteight, amountShift[3], resultfour, rshift8);
    sixteenright sixteenup(rshift16, resulteight, mostSignificant);
    mux_2 rightsixteenup(resultsixteen, amountShift[4], resulteight, rshift16);
    assign out[31:0] = resultsixteen;






endmodule

module sixteenright(out, Aop1, msb1);

    input [31:0] Aop1;
    input msb1;
    output [31:0] out;

    assign out[31] = msb1;
    assign out[30] = msb1;
    assign out[29] = msb1;
    assign out[28] = msb1;
    assign out[27] = msb1;
    assign out[26] = msb1;
    assign out[25] = msb1;
    assign out[24] = msb1;
    assign out[23] = msb1;
    assign out[22] = msb1;
    assign out[21] = msb1;
    assign out[20] = msb1;
    assign out[19] = msb1;
    assign out[18] = msb1;
    assign out[17] = msb1;
    assign out[16] = msb1;
    assign out[15] = Aop1[31];
    assign out[14] = Aop1[30];
    assign out[13] = Aop1[29];
    assign out[12] = Aop1[28];
    assign out[11] = Aop1[27];
    assign out[10] = Aop1[26];
    assign out[9] = Aop1[25];
    assign out[8] = Aop1[24];
    assign out[7] = Aop1[23];
    assign out[6] = Aop1[22];
    assign out[5] = Aop1[21];
    assign out[4] = Aop1[20];
    assign out[3] = Aop1[19];
    assign out[2] = Aop1[18];
    assign out[1] = Aop1[17];
    assign out[0] = Aop1[16];

endmodule

module eightright(out, Aop2, msb2);
    input[31:0] Aop2;
    input msb2;
    output[31:0] out;

    assign out[31] = msb2;
    assign out[30] = msb2;
    assign out[29] = msb2;
    assign out[28] = msb2;
    assign out[27] = msb2;
    assign out[26] = msb2;
    assign out[25] = msb2;
    assign out[24] = msb2;
    assign out[23] = Aop2[31];
    assign out[22] = Aop2[30];
    assign out[21] = Aop2[29];
    assign out[20] = Aop2[28];
    assign out[19] = Aop2[27];
    assign out[18] = Aop2[26];
    assign out[17] = Aop2[25];
    assign out[16] = Aop2[24];
    assign out[15] = Aop2[23];
    assign out[14] = Aop2[22];
    assign out[13] = Aop2[21];
    assign out[12] = Aop2[20];
    assign out[11] = Aop2[19];
    assign out[10] = Aop2[18];
    assign out[9] = Aop2[17];
    assign out[8] = Aop2[16];
    assign out[7] = Aop2[15];
    assign out[6] = Aop2[14];
    assign out[5] = Aop2[13];
    assign out[4] = Aop2[12];
    assign out[3] = Aop2[11];
    assign out[2] = Aop2[10];
    assign out[1] = Aop2[9];
    assign out[0] = Aop2[8];

endmodule

module fourright(out, Aop3, msb3);
    input[31:0] Aop3;
    input msb3;
    output[31:0] out;

    assign out[31] = msb3;
    assign out[30] = msb3;
    assign out[29] = msb3;
    assign out[28] = msb3;
    assign out[27] = Aop3[31];
    assign out[26] = Aop3[30];
    assign out[25] = Aop3[29];
    assign out[24] = Aop3[28];
    assign out[23] = Aop3[27];
    assign out[22] = Aop3[26];
    assign out[21] = Aop3[25];
    assign out[20] = Aop3[24];
    assign out[19] = Aop3[23];
    assign out[18] = Aop3[22];
    assign out[17] = Aop3[21];
    assign out[16] = Aop3[20];
    assign out[15] = Aop3[19];
    assign out[14] = Aop3[18];
    assign out[13] = Aop3[17];
    assign out[12] = Aop3[16];
    assign out[11] = Aop3[15];
    assign out[10] = Aop3[14];
    assign out[9] = Aop3[13];
    assign out[8] = Aop3[12];
    assign out[7] = Aop3[11];
    assign out[6] = Aop3[10];
    assign out[5] = Aop3[9];
    assign out[4] = Aop3[8];
    assign out[3] = Aop3[7];
    assign out[2] = Aop3[6];
    assign out[1] = Aop3[5];
    assign out[0] = Aop3[4];

endmodule

module tworight(out, Aop4, msb4);
    input[31:0] Aop4;
    input msb4;
    output[31:0] out;

    assign out[31] = msb4;
    assign out[30] = msb4;
    assign out[29] = Aop4[31];
    assign out[28] = Aop4[30];
    assign out[27] = Aop4[29];
    assign out[26] = Aop4[28];
    assign out[25] = Aop4[27];
    assign out[24] = Aop4[26];
    assign out[23] = Aop4[25];
    assign out[22] = Aop4[24];
    assign out[21] = Aop4[23];
    assign out[20] = Aop4[22];
    assign out[19] = Aop4[21];
    assign out[18] = Aop4[20];
    assign out[17] = Aop4[19];
    assign out[16] = Aop4[18];
    assign out[15] = Aop4[17];
    assign out[14] = Aop4[16];
    assign out[13] = Aop4[15];
    assign out[12] = Aop4[14];
    assign out[11] = Aop4[13];
    assign out[10] = Aop4[12];
    assign out[9] = Aop4[11];
    assign out[8] = Aop4[10];
    assign out[7] = Aop4[9];
    assign out[6] = Aop4[8];
    assign out[5] = Aop4[7];
    assign out[4] = Aop4[6];
    assign out[3] = Aop4[5];
    assign out[2] = Aop4[4];
    assign out[1] = Aop4[3];
    assign out[0] = Aop4[2];


endmodule

module oneright(out, Aop5, msb5);
    input[31:0] Aop5;
    input msb5;
    output[31:0] out;

    assign out[31] = msb5;
    assign out[30] = Aop5[31];
    assign out[29] = Aop5[30];
    assign out[28] = Aop5[29];
    assign out[27] = Aop5[28];
    assign out[26] = Aop5[27];
    assign out[25] = Aop5[26];
    assign out[24] = Aop5[25];
    assign out[23] = Aop5[24];
    assign out[22] = Aop5[23];
    assign out[21] = Aop5[22];
    assign out[20] = Aop5[21];
    assign out[19] = Aop5[20];
    assign out[18] = Aop5[19];
    assign out[17] = Aop5[18];
    assign out[16] = Aop5[17];
    assign out[15] = Aop5[16];
    assign out[14] = Aop5[15];
    assign out[13] = Aop5[14];
    assign out[12] = Aop5[13];
    assign out[11] = Aop5[12];
    assign out[10] = Aop5[11];
    assign out[9] = Aop5[10];
    assign out[8] = Aop5[9];
    assign out[7] = Aop5[8];
    assign out[6] = Aop5[7];
    assign out[5] = Aop5[6];
    assign out[4] = Aop5[5];
    assign out[3] = Aop5[4];
    assign out[2] = Aop5[3];
    assign out[1] = Aop5[2];
    assign out[0] = Aop5[1];

endmodule