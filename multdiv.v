//CREATED BY KEVIN SHAH
//netid: ks539

module multdiv(
	data_operandA, data_operandB, 
	ctrl_MULT, ctrl_DIV, 
	clock, 
	data_result, data_exception, data_resultRDY);

    input [31:0] data_operandA, data_operandB;
    input ctrl_MULT, ctrl_DIV, clock;

    output [31:0] data_result;
    output data_exception, data_resultRDY;

    //These next two lines find if an exception needs to be raised, either multiplication overflow or division by zero
    onebitcompare compareitup(multexception, sixtyfiveFinal[63:32], sixtyfiveFinal[31]);
    onebitcomparediv compareitup2(divexception, data_operandB);

    //This selector decides whether to raise an exception. Works by putting a 3 bit number filled with divexception,multexception,and divormult
    //into a 8:1 multiplexer
    wire [2:0] finalselector;
    wire multexception;
    wire divexception;
    assign finalselector[0] = divexception;
    assign finalselector[1] = multexception;
    assign finalselector[2] = divormult;

    wire exceptionzero;
    wire exceptionone;
    assign exceptionzero = 1'b0;
    assign exceptionone = 1'b1;

    wire divormult;
    //Latch to keep the control signal in memory past the one cycle it is asserted for
    srlatch pleasework(ctrl_MULT, ctrl_DIV, clock, divormult);

    //Final Choosing of returning the mult answer or div answer
    mux_2 finalmux(data_result, divormult, sixtyfiveFinal[31:0], holdervariable2);
    mux_8 finalmuxexception(data_exception, finalselector, exceptionzero, exceptionzero, exceptionone, exceptionone, exceptionzero, exceptionone, exceptionzero, exceptionone);
 

    wire [63:0] firstFinal, secondFinal, thirdFinal, fourthFinal, fifthFinal, sixthFinal, seventhFinal, eighthFinal, ninthFinal, tenthFinal, eleventhFinal;
    wire [63:0] twelvethFinal, thirteenthFinal, fourteenthFinal, fifteenthFinal, sixteenthFinal, seventeenthFinal, eighteenthFinal;
    wire [63:0] nineteenthFinal, twentiethFinal, twentyoneFinal, twentytwoFinal, twentythreeFinal, twentyfourFinal;
    wire [63:0] twentyfiveFinal, twentysixFinal, twentysevenFinal, twentyeightFinal, twentynineFinal, thirtyFinal, thirtyoneFinal, thirtytwoFinal, thirtythreeFinal;
    wire [63:0] thirtyfourFinal, thirtyfiveFinal, thirtysixFinal, thirtysevenFinal, thirtyeightFinal, thirtynineFinal, fortyFinal, fortyoneFinal, fortytwoFinal;
    wire [63:0] fortythreeFinal, fortyfourFinal, fortyfiveFinal, fortysixFinal, fortysevenFinal, fortyeightFinal, fortynineFinal, fiftyFinal;
    wire [63:0] fiftyoneFinal, fiftytwoFinal, fiftythreeFinal, fiftyfourFinal, fiftyfiveFinal, fiftysixFinal, fiftysevenFinal, fiftyeightFinal, fiftynineFinal;
    wire [63:0] sixtyFinal, sixtyoneFinal, sixtytwoFinal, sixtythreeFinal, sixtyfourFinal, sixtyfiveFinal;
    assign firstFinal[63:32] = 32'b00000000000000000000000000000000;
    assign firstFinal[31:0] = data_operandB[31:0];

    wire [1:0] firstControl, secondControl, thirdControl, fourthControl, fifthControl, sixthControl, seventhControl, eighthControl, ninthControl;
    wire [1:0] tenthControl, eleventhControl, twelvethControl, thirteenthControl, fourteenthControl, fifteenthControl, sixteenthControl;
    wire [1:0] seventeenthControl, eighteenthControl, nineteenthControl, twentiethControl, twentyoneControl, twentytwoControl;
    wire [1:0] twentythreeControl, twentyfourControl, twentyfiveControl, twentysixControl, twentysevenControl, twentyeightControl, twentynineControl;
    wire [1:0] thirtyControl, thirtyoneControl, thirtytwoControl;

    wire weareready; 


    wire [1:0] wc0, wc1, wc2, wc3, wc4, wc5, wc6, wc7, wc8, wc9, wc10, wc11, wc12, wc13, wc14, wc15, wc16, wc17, wc18, wc19, wc20, wc21, wc22;
    wire [1:0] wc23, wc24, wc25, wc26, wc27, wc28, wc29, wc30, wc31;
    wire [31:0] addr0, addr1, addr2, addr3, addr4, addr5, addr6, addr7, addr8, addr9, addr10, addr11, addr12, addr13, addr14, addr15, addr16, addr17;
    wire [31:0] addr18, addr19, addr20, addr21, addr22, addr23, addr24, addr25, addr26, addr27, addr28, addr29, addr30, addr31;
    wire [31:0] subr0, subr1, subr2, subr3, subr4, subr5, subr6, subr7, subr8, subr9, subr10, subr11, subr12, subr13, subr14, subr15, subr16, subr17, subr18;
    wire [31:0] subr19, subr20, subr21, subr22, subr23, subr24, subr25, subr26, subr27, subr28, subr29, subr30, subr31;
    wire [31:0] negate1;

    wire [31:0] rmux0, rmux1, rmux2, rmux3, rmux4, rmux5, rmux6, rmux7, rmux8, rmux9, rmux10, rmux11, rmux12, rmux13, rmux14, rmux15, rmux16;
    wire [31:0] rmux17, rmux18, rmux19, rmux20, rmux21, rmux22, rmux23, rmux24, rmux25, rmux26, rmux27, rmux28, rmux29, rmux30;
    wire [31:0] rmux31, rmux32, rmux33, rmux34, rmux35, rmux36, rmux37, rmux38, rmux39, rmux40, rmux41, rmux42, rmux43, rmux44;
    wire [31:0] rmux45, rmux46, rmux47, rmux48, rmux49, rmux50, rmux51, rmux52, rmux53, rmux54, rmux55, rmux56, rmux57;
    wire [31:0] rmux58, rmux59, rmux60, rmux61, rmux62, rmux63;
    wire weadd, wesubtract;
    assign weadd = 1'b0;
    assign wesubtract = 1'b1;
    assign firstControl[0] = 1'b0;
    assign firstControl[1] = data_operandB[0];
    wire randomcarry1, randomcarry2, randomcarry3, randomcarry4, randomcarry5, randomcarry6, randomcarry7, randomcarry8, randomcarry9;
    wire randomcarry10, randomcarry11, randomcarry12, randomcarry13, randomcarry14, randomcarry15, randomcarry16;
    wire randomcarry17, randomcarry18, randomcarry19, randomcarry20, randomcarry21, randomcarry22, randomcarry23, randomcarry24;
    wire randomcarry25, randomcarry26, randomcarry27, randomcarry28, randomcarry29, randomcarry30, randomcarry31, randomcarry32;
    wire randomcarry33, randomcarry34, randomcarry35, randomcarry36, randomcarry37, randomcarry38, randomcarry39, randomcarry40;
    wire randomcarry41, randomcarry42, randomcarry43, randomcarry44, randomcarry45, randomcarry46, randomcarry47;
    wire randomcarry48, randomcarry49, randomcarry50, randomcarry51, randomcarry52, randomcarry53, randomcarry54, randomcarry55;
    wire randomcarry56, randomcarry57, randomcarry58, randomcarry59, randomcarry60, randomcarry61, randomcarry62, randomcarry63;
    wire randomcarry64;

    wire [31:0] divisor, dividend;
    
    //Start of multiplication process. I used regular booths
    control_algo controller0(firstControl, wc0);
    cla_adder adding_1(addr0, data_operandA[31:0], firstFinal[63:32], weadd, randomcarry1);
    b_negater negater0(data_operandA[31:0], negate1);
    cla_adder subtracting_1(subr0, negate1, firstFinal[63:32], wesubtract, randomcarry2);
    mux_2 mux0(rmux0, wc0[1], addr0, subr0);
    mux_2 mux1(rmux1, wc0[0], firstFinal[63:32], rmux0);
    assign secondFinal[63:32] = rmux1[31:0];
    assign secondFinal[31:0] = firstFinal[31:0];
    productshifter shift1(secondFinal, thirdFinal);

    assign secondControl[0] = secondFinal[0];
    assign secondControl[1] = thirdFinal[0];
    control_algo controller1(secondControl, wc1);
    cla_adder adding_2(addr1, data_operandA[31:0], thirdFinal[63:32], weadd, randomcarry3);
    cla_adder subtracting_2(subr1, negate1, thirdFinal[63:32], wesubtract, randomcarry4);
    mux_2 mux2(rmux2, wc1[1], addr1, subr1);
    mux_2 mux3(rmux3, wc1[0], thirdFinal[63:32], rmux2);
    assign fourthFinal[63:32] = rmux3[31:0];
    assign fourthFinal[31:0] = thirdFinal[31:0];
    productshifter shift2(fourthFinal, fifthFinal);

    assign thirdControl[0] = fourthFinal[0];
    assign thirdControl[1] = fifthFinal[0];
    control_algo controller2(thirdControl, wc2);
    cla_adder adding_3(addr2, data_operandA[31:0], fifthFinal[63:32], weadd, randomcarry5);
    cla_adder subtracting_3(subr2, negate1, fifthFinal[63:32], wesubtract, randomcarry6);
    mux_2 mux4(rmux4, wc2[1], addr2, subr2);
    mux_2 mux5(rmux5, wc2[0], fifthFinal[63:32], rmux4);
    assign sixthFinal[63:32] = rmux5[31:0];
    assign sixthFinal[31:0] = fifthFinal[31:0];
    productshifter shift3(sixthFinal, seventhFinal);

    assign fourthControl[0] = sixthFinal[0];
    assign fourthControl[1] = seventhFinal[0];
    control_algo controller3(fourthControl, wc3);
    cla_adder adding_4(addr3, data_operandA[31:0], seventhFinal[63:32], weadd, randomcarry7);
    cla_adder subtracting_4(subr3, negate1, seventhFinal[63:32], wesubtract, randomcarry8);
    mux_2 mux6(rmux6, wc3[1], addr3, subr3);
    mux_2 mux7(rmux7, wc3[0], seventhFinal[63:32], rmux6);
    assign eighthFinal[63:32] = rmux7[31:0];
    assign eighthFinal[31:0] = seventhFinal[31:0];
    productshifter shift4(eighthFinal, ninthFinal);
    
    assign fifthControl[0] = eighthFinal[0];
    assign fifthControl[1] = ninthFinal[0];
    control_algo controller4(fifthControl, wc4);
    cla_adder adding_5(addr4, data_operandA[31:0], ninthFinal[63:32], weadd, randomcarry9);
    cla_adder subtracting_5(subr4, negate1, ninthFinal[63:32], wesubtract, randomcarry10);
    mux_2 mux8(rmux8, wc4[1], addr4, subr4);
    mux_2 mux9(rmux9, wc4[0], ninthFinal[63:32], rmux8);
    assign tenthFinal[63:32] = rmux9[31:0];
    assign tenthFinal[31:0] = ninthFinal[31:0];
    productshifter shift5(tenthFinal, eleventhFinal);

    assign sixthControl[0] = tenthFinal[0];
    assign sixthControl[1] = eleventhFinal[0];
    control_algo controller5(sixthControl, wc5);
    cla_adder adding_6(addr5, data_operandA[31:0], eleventhFinal[63:32], weadd, randomcarry11);
    cla_adder subtracting_6(subr5, negate1, eleventhFinal[63:32], wesubtract, randomcarry12);
    mux_2 mux10(rmux10, wc5[1], addr5, subr5);
    mux_2 mux11(rmux11, wc5[0], eleventhFinal[63:32], rmux10);
    assign twelvethFinal[63:32] = rmux11[31:0];
    assign twelvethFinal[31:0] = eleventhFinal[31:0];
    productshifter shift6(twelvethFinal, thirteenthFinal);

    assign seventhControl[0] = twelvethFinal[0];
    assign seventhControl[1] = thirteenthFinal[0];
    control_algo controller6(seventhControl, wc6);
    cla_adder adding_7(addr6, data_operandA[31:0], thirteenthFinal[63:32], weadd, randomcarry13);
    cla_adder subtracting_7(subr6, negate1, thirteenthFinal[63:32], wesubtract, randomcarry14);
    mux_2 mux12(rmux12, wc6[1], addr6, subr6);
    mux_2 mux13(rmux13, wc6[0], thirteenthFinal[63:32], rmux12);
    assign fourteenthFinal[63:32] = rmux13[31:0];
    assign fourteenthFinal[31:0] = thirteenthFinal[31:0];
    productshifter shift7(fourteenthFinal, fifteenthFinal);

    assign eighthControl[0] = fourteenthFinal[0];
    assign eighthControl[1] = fifteenthFinal[0];
    control_algo controller7(eighthControl, wc7);
    cla_adder adding_8(addr7, data_operandA[31:0], fifteenthFinal[63:32], weadd, randomcarry15);
    cla_adder subtracting_8(subr7, negate1, fifteenthFinal[63:32], wesubtract, randomcarry16);
    mux_2 mux14(rmux14, wc7[1], addr7, subr7);
    mux_2 mux15(rmux15, wc7[0], fifteenthFinal[63:32], rmux14);
    assign sixteenthFinal[63:32] = rmux15[31:0];
    assign sixteenthFinal[31:0] = fifteenthFinal[31:0];
    productshifter shift8(sixteenthFinal, seventeenthFinal);

    assign ninthControl[0] = sixteenthFinal[0];
    assign ninthControl[1] = seventeenthFinal[0];
    control_algo controller8(ninthControl, wc8);
    cla_adder adding_9(addr8, data_operandA[31:0], seventeenthFinal[63:32], weadd, randomcarry17);
    cla_adder subtracting_9(subr8, negate1, seventeenthFinal[63:32], wesubtract, randomcarry18);
    mux_2 mux16(rmux16, wc8[1], addr8, subr8);
    mux_2 mux17(rmux17, wc8[0], seventeenthFinal[63:32], rmux16);
    assign eighteenthFinal[63:32] = rmux17[31:0];
    assign eighteenthFinal[31:0] = seventeenthFinal[31:0];
    productshifter shift9(eighteenthFinal, nineteenthFinal);

    assign tenthControl[0] = eighteenthFinal[0];
    assign tenthControl[1] = nineteenthFinal[0];
    control_algo controller9(tenthControl, wc9);
    cla_adder adding_10(addr9, data_operandA[31:0], nineteenthFinal[63:32], weadd, randomcarry19);
    cla_adder subtracting_10(subr9, negate1, nineteenthFinal[63:32], wesubtract, randomcarry20);
    mux_2 mux18(rmux18, wc9[1], addr9, subr9);
    mux_2 mux19(rmux19, wc9[0], nineteenthFinal[63:32], rmux18);
    assign twentiethFinal[63:32] = rmux19[31:0];
    assign twentiethFinal[31:0] = nineteenthFinal[31:0];
    productshifter shift10(twentiethFinal, twentyoneFinal);

    assign eleventhControl[0] = twentiethFinal[0];
    assign eleventhControl[1] = twentyoneFinal[0];
    control_algo controller10(eleventhControl, wc10);
    cla_adder adding_11(addr10, data_operandA[31:0], twentyoneFinal[63:32], weadd, randomcarry21);
    cla_adder subtracting_11(subr10, negate1, twentyoneFinal[63:32], wesubtract, randomcarry22);
    mux_2 mux20(rmux20, wc10[1], addr10, subr10);
    mux_2 mux21(rmux21, wc10[0], twentyoneFinal[63:32], rmux20);
    assign twentytwoFinal[63:32] = rmux21[31:0];
    assign twentytwoFinal[31:0] = twentyoneFinal[31:0];
    productshifter shift11(twentytwoFinal, twentythreeFinal);

    assign twelvethControl[0] = twentytwoFinal[0];
    assign twelvethControl[1] = twentythreeFinal[0];
    control_algo controller11(twelvethControl, wc11);
    cla_adder adding_12(addr11, data_operandA[31:0], twentythreeFinal[63:32], weadd, randomcarry23);
    cla_adder subtracting_12(subr11, negate1, twentythreeFinal[63:32], wesubtract, randomcarry24);
    mux_2 mux22(rmux22, wc11[1], addr11, subr11);
    mux_2 mux23(rmux23, wc11[0], twentythreeFinal[63:32], rmux22);
    assign twentyfourFinal[63:32] = rmux23[31:0];
    assign twentyfourFinal[31:0] = twentythreeFinal[31:0];
    productshifter shift12(twentyfourFinal, twentyfiveFinal);

    assign thirteenthControl[0] = twentyfourFinal[0];
    assign thirteenthControl[1] = twentyfiveFinal[0];
    control_algo controller12(thirteenthControl, wc12);
    cla_adder adding_13(addr12, data_operandA[31:0], twentyfiveFinal[63:32], weadd, randomcarry25);
    cla_adder subtracting_13(subr12, negate1, twentyfiveFinal[63:32], wesubtract, randomcarry26);
    mux_2 mux24(rmux24, wc12[1], addr12, subr12);
    mux_2 mux25(rmux25, wc12[0], twentyfiveFinal[63:32], rmux24);
    assign twentysixFinal[63:32] = rmux25[31:0];
    assign twentysixFinal[31:0] = twentyfiveFinal[31:0];
    productshifter shift13(twentysixFinal, twentysevenFinal);

    assign fourteenthControl[0] = twentysixFinal[0];
    assign fourteenthControl[1] = twentysevenFinal[0];
    control_algo controller13(fourteenthControl, wc13);
    cla_adder adding_14(addr13, data_operandA[31:0], twentysevenFinal[63:32], weadd, randomcarry27);
    cla_adder subtracting_14(subr13, negate1, twentysevenFinal[63:32], wesubtract, randomcarry28);
    mux_2 mux26(rmux26, wc13[1], addr13, subr13);
    mux_2 mux27(rmux27, wc13[0], twentysevenFinal[63:32], rmux26);
    assign twentyeightFinal[63:32] = rmux27[31:0];
    assign twentyeightFinal[31:0] = twentysevenFinal[31:0];
    productshifter shift14(twentyeightFinal, twentynineFinal);

    assign fifteenthControl[0] = twentyeightFinal[0];
    assign fifteenthControl[1] = twentynineFinal[0];
    control_algo controller14(fifteenthControl, wc14);
    cla_adder adding_15(addr14, data_operandA[31:0], twentynineFinal[63:32], weadd, randomcarry29);
    cla_adder subtracting_15(subr14, negate1, twentynineFinal[63:32], wesubtract, randomcarry30);
    mux_2 mux28(rmux28, wc14[1], addr14, subr14);
    mux_2 mux29(rmux29, wc14[0], twentynineFinal[63:32], rmux28);
    assign thirtyFinal[63:32] = rmux29[31:0];
    assign thirtyFinal[31:0] = twentynineFinal[31:0];
    productshifter shift15(thirtyFinal, thirtyoneFinal);

    assign sixteenthControl[0] = thirtyFinal[0];
    assign sixteenthControl[1] = thirtyoneFinal[0];
    control_algo controller15(sixteenthControl, wc15);
    cla_adder adding_16(addr15, data_operandA[31:0], thirtyoneFinal[63:32], weadd, randomcarry31);
    cla_adder subtracting_16(subr15, negate1, thirtyoneFinal[63:32], wesubtract, randomcarry32);
    mux_2 mux30(rmux30, wc15[1], addr15, subr15);
    mux_2 mux31(rmux31, wc15[0], thirtyoneFinal[63:32], rmux30);
    assign thirtytwoFinal[63:32] = rmux31[31:0];
    assign thirtytwoFinal[31:0] = thirtyoneFinal[31:0];
    productshifter shift16(thirtytwoFinal, thirtythreeFinal);

    assign seventeenthControl[0] = thirtytwoFinal[0];
    assign seventeenthControl[1] = thirtythreeFinal[0];
    control_algo controller16(seventeenthControl, wc16);
    cla_adder adding_17(addr16, data_operandA[31:0], thirtythreeFinal[63:32], weadd, randomcarry33);
    cla_adder subtracting_17(subr16, negate1, thirtythreeFinal[63:32], wesubtract, randomcarry34);
    mux_2 mux32(rmux32, wc16[1], addr16, subr16);
    mux_2 mux33(rmux33, wc16[0], thirtythreeFinal[63:32], rmux32);
    assign thirtyfourFinal[63:32] = rmux33[31:0];
    assign thirtyfourFinal[31:0] = thirtythreeFinal[31:0];
    productshifter shift17(thirtyfourFinal, thirtyfiveFinal);

    assign eighteenthControl[0] = thirtyfourFinal[0];
    assign eighteenthControl[1] = thirtyfiveFinal[0];
    control_algo controller17(eighteenthControl, wc17);
    cla_adder adding_18(addr17, data_operandA[31:0], thirtyfiveFinal[63:32], weadd, randomcarry35);
    cla_adder subtracting_18(subr17, negate1, thirtyfiveFinal[63:32], wesubtract, randomcarry36);
    mux_2 mux34(rmux34, wc17[1], addr17, subr17);
    mux_2 mux35(rmux35, wc17[0], thirtyfiveFinal[63:32], rmux34);
    assign thirtysixFinal[63:32] = rmux35[31:0];
    assign thirtysixFinal[31:0] = thirtyfiveFinal[31:0];
    productshifter shift18(thirtysixFinal, thirtysevenFinal);

    assign nineteenthControl[0] = thirtysixFinal[0];
    assign nineteenthControl[1] = thirtysevenFinal[0];
    control_algo controller18(nineteenthControl, wc18);
    cla_adder adding_19(addr18, data_operandA[31:0], thirtysevenFinal[63:32], weadd, randomcarry37);
    cla_adder subtracting_19(subr18, negate1, thirtysevenFinal[63:32], wesubtract, randomcarry38);
    mux_2 mux36(rmux36, wc18[1], addr18, subr18);
    mux_2 mux37(rmux37, wc18[0], thirtysevenFinal[63:32], rmux36);
    assign thirtyeightFinal[63:32] = rmux37[31:0];
    assign thirtyeightFinal[31:0] = thirtysevenFinal[31:0];
    productshifter shift19(thirtyeightFinal, thirtynineFinal);

    assign twentiethControl[0] = thirtyeightFinal[0];
    assign twentiethControl[1] = thirtynineFinal[0];
    control_algo controller19(twentiethControl, wc19);
    cla_adder adding_20(addr19, data_operandA[31:0], thirtynineFinal[63:32], weadd, randomcarry39);
    cla_adder subtracting_20(subr19, negate1, thirtynineFinal[63:32], wesubtract, randomcarry40);
    mux_2 mux38(rmux38, wc19[1], addr19, subr19);
    mux_2 mux39(rmux39, wc19[0], thirtynineFinal[63:32], rmux38);
    assign fortyFinal[63:32] = rmux39[31:0];
    assign fortyFinal[31:0] = thirtynineFinal[31:0];
    productshifter shift20(fortyFinal, fortyoneFinal);

    assign twentyoneControl[0] = fortyFinal[0];
    assign twentyoneControl[1] = fortyoneFinal[0];
    control_algo controller20(twentyoneControl, wc20);
    cla_adder adding_21(addr20, data_operandA[31:0], fortyoneFinal[63:32], weadd, randomcarry41);
    cla_adder subtracting_21(subr20, negate1, fortyoneFinal[63:32], wesubtract, randomcarry42);
    mux_2 mux40(rmux40, wc20[1], addr20, subr20);
    mux_2 mux41(rmux41, wc20[0], fortyoneFinal[63:32], rmux40);
    assign fortytwoFinal[63:32] = rmux41[31:0];
    assign fortytwoFinal[31:0] = fortyoneFinal[31:0];
    productshifter shift21(fortytwoFinal, fortythreeFinal);

    assign twentytwoControl[0] = fortytwoFinal[0];
    assign twentytwoControl[1] = fortythreeFinal[0];
    control_algo controller21(twentytwoControl, wc21);
    cla_adder adding_22(addr21, data_operandA[31:0], fortythreeFinal[63:32], weadd, randomcarry43);
    cla_adder subtracting_22(subr21, negate1, fortythreeFinal[63:32], wesubtract, randomcarry44);
    mux_2 mux42(rmux42, wc21[1], addr21, subr21);
    mux_2 mux43(rmux43, wc21[0], fortythreeFinal[63:32], rmux42);
    assign fortyfourFinal[63:32] = rmux43[31:0];
    assign fortyfourFinal[31:0] = fortythreeFinal[31:0];
    productshifter shift22(fortyfourFinal, fortyfiveFinal);

    assign twentythreeControl[0] = fortyfourFinal[0];
    assign twentythreeControl[1] = fortyfiveFinal[0];
    control_algo controller22(twentythreeControl, wc22);
    cla_adder adding_23(addr22, data_operandA[31:0], fortyfiveFinal[63:32], weadd, randomcarry45);
    cla_adder subtracting_23(subr22, negate1, fortyfiveFinal[63:32], wesubtract, randomcarry46);
    mux_2 mux44(rmux44, wc22[1], addr22, subr22);
    mux_2 mux45(rmux45, wc22[0], fortyfiveFinal[63:32], rmux44);
    assign fortysixFinal[63:32] = rmux45[31:0];
    assign fortysixFinal[31:0] = fortyfiveFinal[31:0];
    productshifter shift23(fortysixFinal, fortysevenFinal);

    assign twentyfourControl[0] = fortysixFinal[0];
    assign twentyfourControl[1] = fortysevenFinal[0];
    control_algo controller23(twentyfourControl, wc23);
    cla_adder adding_24(addr23, data_operandA[31:0], fortysevenFinal[63:32], weadd, randomcarry47);
    cla_adder subtracting_24(subr23, negate1, fortysevenFinal[63:32], wesubtract, randomcarry48);
    mux_2 mux46(rmux46, wc23[1], addr23, subr23);
    mux_2 mux47(rmux47, wc23[0], fortysevenFinal[63:32], rmux46);
    assign fortyeightFinal[63:32] = rmux47[31:0];
    assign fortyeightFinal[31:0] = fortysevenFinal[31:0];
    productshifter shift24(fortyeightFinal, fortynineFinal);

    assign twentyfiveControl[0] = fortyeightFinal[0];
    assign twentyfiveControl[1] = fortynineFinal[0];
    control_algo controller24(twentyfiveControl, wc24);
    cla_adder adding_25(addr24, data_operandA[31:0], fortynineFinal[63:32], weadd, randomcarry49);
    cla_adder subtracting_25(subr24, negate1, fortynineFinal[63:32], wesubtract, randomcarry50);
    mux_2 mux48(rmux48, wc24[1], addr24, subr24);
    mux_2 mux49(rmux49, wc24[0], fortynineFinal[63:32], rmux48);
    assign fiftyFinal[63:32] = rmux49[31:0];
    assign fiftyFinal[31:0] = fortynineFinal[31:0];
    productshifter shift25(fiftyFinal, fiftyoneFinal);

    assign twentysixControl[0] = fiftyFinal[0];
    assign twentysixControl[1] = fiftyoneFinal[0];
    control_algo controller25(twentysixControl, wc25);
    cla_adder adding_26(addr25, data_operandA[31:0], fiftyoneFinal[63:32], weadd, randomcarry51);
    cla_adder subtracting_26(subr25, negate1, fiftyoneFinal[63:32], wesubtract, randomcarry52);
    mux_2 mux50(rmux50, wc25[1], addr25, subr25);
    mux_2 mux51(rmux51, wc25[0], fiftyoneFinal[63:32], rmux50);
    assign fiftytwoFinal[63:32] = rmux51[31:0];
    assign fiftytwoFinal[31:0] = fiftyoneFinal[31:0];
    productshifter shift26(fiftytwoFinal, fiftythreeFinal);

    assign twentysevenControl[0] = fiftytwoFinal[0];
    assign twentysevenControl[1] = fiftythreeFinal[0];
    control_algo controller26(twentysevenControl, wc26);
    cla_adder adding_27(addr26, data_operandA[31:0], fiftythreeFinal[63:32], weadd, randomcarry53);
    cla_adder subtracting_27(subr26, negate1, fiftythreeFinal[63:32], wesubtract, randomcarry54);
    mux_2 mux52(rmux52, wc26[1], addr26, subr26);
    mux_2 mux53(rmux53, wc26[0], fiftythreeFinal[63:32], rmux52);
    assign fiftyfourFinal[63:32] = rmux53[31:0];
    assign fiftyfourFinal[31:0] = fiftythreeFinal[31:0];
    productshifter shift27(fiftyfourFinal, fiftyfiveFinal);

    assign twentyeightControl[0] = fiftyfourFinal[0];
    assign twentyeightControl[1] = fiftyfiveFinal[0];
    control_algo controller27(twentyeightControl, wc27);
    cla_adder adding_28(addr27, data_operandA[31:0], fiftyfiveFinal[63:32], weadd, randomcarry55);
    cla_adder subtracting_28(subr27, negate1, fiftyfiveFinal[63:32], wesubtract, randomcarry56);
    mux_2 mux54(rmux54, wc27[1], addr27, subr27);
    mux_2 mux55(rmux55, wc27[0], fiftyfiveFinal[63:32], rmux54);
    assign fiftysixFinal[63:32] = rmux55[31:0];
    assign fiftysixFinal[31:0] = fiftyfiveFinal[31:0];
    productshifter shift28(fiftysixFinal, fiftysevenFinal);

    assign twentynineControl[0] = fiftysixFinal[0];
    assign twentynineControl[1] = fiftysevenFinal[0];
    control_algo controller28(twentynineControl, wc28);
    cla_adder adding_29(addr28, data_operandA[31:0], fiftysevenFinal[63:32], weadd, randomcarry57);
    cla_adder subtracting_29(subr28, negate1, fiftysevenFinal[63:32], wesubtract, randomcarry58);
    mux_2 mux56(rmux56, wc28[1], addr28, subr28);
    mux_2 mux57(rmux57, wc28[0], fiftysevenFinal[63:32], rmux56);
    assign fiftyeightFinal[63:32] = rmux57[31:0];
    assign fiftyeightFinal[31:0] = fiftysevenFinal[31:0];
    productshifter shift29(fiftyeightFinal, fiftynineFinal);

    assign thirtyControl[0] = fiftyeightFinal[0];
    assign thirtyControl[1] = fiftynineFinal[0];
    control_algo controller29(thirtyControl, wc29);
    cla_adder adding_30(addr29, data_operandA[31:0], fiftynineFinal[63:32], weadd, randomcarry59);
    cla_adder subtracting_30(subr29, negate1, fiftynineFinal[63:32], wesubtract, randomcarry60);
    mux_2 mux58(rmux58, wc29[1], addr29, subr29);
    mux_2 mux59(rmux59, wc29[0], fiftynineFinal[63:32], rmux58);
    assign sixtyFinal[63:32] = rmux59[31:0];
    assign sixtyFinal[31:0] = fiftynineFinal[31:0];
    productshifter shift30(sixtyFinal, sixtyoneFinal);

    assign thirtyoneControl[0] = sixtyFinal[0];
    assign thirtyoneControl[1] = sixtyoneFinal[0];
    control_algo controller30(thirtyoneControl, wc30);
    cla_adder adding_31(addr30, data_operandA[31:0], sixtyoneFinal[63:32], weadd, randomcarry61);
    cla_adder subtracting_31(subr30, negate1, sixtyoneFinal[63:32], wesubtract, randomcarry62);
    mux_2 mux60(rmux60, wc30[1], addr30, subr30);
    mux_2 mux61(rmux61, wc30[0], sixtyoneFinal[63:32], rmux60);
    assign sixtytwoFinal[63:32] = rmux61[31:0];
    assign sixtytwoFinal[31:0] = sixtyoneFinal[31:0];
    productshifter shift31(sixtytwoFinal, sixtythreeFinal);

    assign thirtytwoControl[0] = sixtytwoFinal[0];
    assign thirtytwoControl[1] = sixtythreeFinal[0];
    control_algo controller31(thirtytwoControl, wc31);
    cla_adder adding_32(addr31, data_operandA[31:0], sixtythreeFinal[63:32], weadd, randomcarry63);
    cla_adder subtracting_32(subr31, negate1, sixtythreeFinal[63:32], wesubtract, randomcarry64);
    mux_2 mux62(rmux62, wc31[1], addr31, subr31);
    mux_2 mux63(rmux63, wc31[0], sixtythreeFinal[63:32], rmux62);
    assign sixtyfourFinal[63:32] = rmux63[31:0];
    assign sixtyfourFinal[31:0] = sixtythreeFinal[31:0];
    productshifterfinal shift32(sixtyfourFinal, sixtyfiveFinal, weareready);
    //Sixtyfivefinal is the final 64 bit answer of regular booths algorithm


    // DIVISION RESTORING DIVISION ALGORITHM

    wenegative negativeit(data_operandA, data_operandB, divisor, dividend);

    wire [31:0] divnegate1;
    wire [63:0] divfirst, shifteddivfirst, divsigzero0, divsigone0, shifteddivsecond, divsigzero1, divsigone1;
    wire [31:0] divtrial1, divtrial2, divtrial3, divtrial4, divtrial5, divtrial6, divtrial7, divtrial8, divtrial9, divtrial10;
    wire [31:0] divtrial11, divtrial12, divtrial13, divtrial14, divtrial15, divtrial16, divtrial17, divtrial18, divtrial19;
    wire [31:0] divtrial20, divtrial21, divtrial22, divtrial23, divtrial24, divtrial25, divtrial26, divtrial27;
    wire [31:0] divtrial28, divtrial29, divtrial30, divtrial31, divtrial32;
    wire [63:0] shifteddivthird, shifteddivfourth, shifteddivfifth, shifteddivsixth, shifteddivseventh, shifteddiveighth;
    wire [63:0] shifteddivninth, shifteddivtenth, shifteddiv11, shifteddiv12, shifteddiv13, shifteddiv14, shifteddiv15;
    wire [63:0] shifteddiv16, shifteddiv17, shifteddiv18, shifteddiv19, shifteddiv20, shifteddiv21, shifteddiv22;
    wire [63:0] shifteddiv23, shifteddiv24, shifteddiv25, shifteddiv26, shifteddiv27, shifteddiv28, shifteddiv29;
    wire [63:0] shifteddiv30, shifteddiv31, shifteddiv32;
    wire randomdivcarry1, randomdivcarry2, randomdivcarry3, randomdivcarry4, randomdivcarry5, randomdivcarry6, randomdivcarry7;
    wire randomdivcarry8, randomdivcarry9, randomdivcarry10, randomdivcarry11, randomdivcarry12, randomdivcarry13, randomdivcarry14, randomdivcarry15;
    wire randomdivcarry16, randomdivcarry17, randomdivcarry18, randomdivcarry19, randomdivcarry20, randomdivcarry21;
    wire randomdivcarry22, randomdivcarry23, randomdivcarry24, randomdivcarry25, randomdivcarry26, randomdivcarry27;
    wire randomdivcarry28, randomdivcarry29, randomdivcarry30, randomdivcarry31, randomdivcarry32;
    wire [63:0] divmux0, divmux1, divmux2, divmux3, divmux4, divmux5, divmux6, divmux7, divmux8, divmux9, divmux10, divmux11, divmux12, divmux13, divmux14;
    wire [63:0] divmux15, divmux16, divmux17, divmux18, divmux19, divmux20, divmux21, divmux22, divmux23, divmux24, divmux25, divmux26, divmux27, divmux28;
    wire [63:0] divmux29, divmux30, divmux31;
    wire [63:0] divsigzero2, divsigone2, divsigzero3, divsigone3, divsigzero4, divsigone4;
    wire [63:0] divsigzero5, divsigzero6, divsigzero7, divsigzero8, divsigzero9, divsigzero10, divsigzero11, divsigzero12, divsigzero13, divsigzero14;
    wire [63:0] divsigzero15, divsigzero16, divsigzero17, divsigzero18, divsigzero19, divsigzero20, divsigzero21, divsigzero22, divsigzero23;
    wire [63:0] divsigzero24, divsigzero25, divsigzero26, divsigzero27, divsigzero28, divsigzero29, divsigzero30, divsigzero31;
    wire [63:0] divsigone5, divsigone6, divsigone7, divsigone8, divsigone9, divsigone10, divsigone11, divsigone12, divsigone13, divsigone14, divsigone15;
    wire [63:0] divsigone16, divsigone17, divsigone18, divsigone19, divsigone20, divsigone21, divsigone22, divsigone23, divsigone24, divsigone25, divsigone26;
    wire [63:0] divsigone27, divsigone28, divsigone29, divsigone30, divsigone31;

    assign divfirst[63:32] = 32'b00000000000000000000000000000000;
    assign divfirst[31:0] = divisor[31:0];

    //Start of division algorithm
    leftshift64 shifter1(divfirst, shifteddivfirst);
    b_negater neg1(dividend, divnegate1);
    cla_adder firstdiv(divtrial1, shifteddivfirst[63:32], divnegate1, wesubtract, randomdivcarry1);
    assign divsigzero0[63:32] = divtrial1[31:0];
    assign divsigzero0[31:1] = shifteddivfirst[31:1];
    assign divsigzero0[0] = 1'b1;
    assign divsigone0[63:1] = shifteddivfirst[63:1];
    assign divsigone0[0] = 1'b0;
    mux_264 multiplexer1(divmux0, divtrial1[31], divsigzero0, divsigone0);

    leftshift64 shifter2(divmux0, shifteddivsecond);
    cla_adder div2(divtrial2, shifteddivsecond[63:32], divnegate1, wesubtract, randomdivcarry2);
    assign divsigzero1[63:32] = divtrial2[31:0];
    assign divsigzero1[31:1] = shifteddivsecond[31:1];
    assign divsigzero1[0] = 1'b1;  
    assign divsigone1[63:1] = shifteddivsecond[63:1];
    assign divsigone1[0] = 1'b0;
    mux_264 multiplexer2(divmux1, divtrial2[31], divsigzero1, divsigone1);

    leftshift64 shifter3(divmux1, shifteddivthird);
    cla_adder div3(divtrial3, shifteddivthird[63:32], divnegate1, wesubtract, randomdivcarry3);
    assign divsigzero2[63:32] = divtrial3[31:0];
    assign divsigzero2[31:1] = shifteddivthird[31:1];
    assign divsigzero2[0] = 1'b1;
    assign divsigone2[63:1] = shifteddivthird[63:1];
    assign divsigone2[0] = 1'b0;
    mux_264 multiplexer3(divmux2, divtrial3[31], divsigzero2, divsigone2);

    leftshift64 shifter4(divmux2, shifteddivfourth);
    cla_adder div4(divtrial4, shifteddivfourth[63:32], divnegate1, wesubtract, randomdivcarry4);
    assign divsigzero3[63:32] = divtrial4[31:0];
    assign divsigzero3[31:1] = shifteddivfourth[31:1];
    assign divsigzero3[0] = 1'b1;
    assign divsigone3[63:1] = shifteddivfourth[63:1];
    assign divsigone3[0] = 1'b0;
    mux_264 multiplexer4(divmux3, divtrial4[31], divsigzero3, divsigone3);

    leftshift64 shifter5(divmux3, shifteddivfifth);
    cla_adder div5(divtrial5, shifteddivfifth[63:32], divnegate1, wesubtract, randomdivcarry5);
    assign divsigzero4[63:32] = divtrial5[31:0];
    assign divsigzero4[31:1] = shifteddivfifth[31:1];
    assign divsigzero4[0] = 1'b1;
    assign divsigone4[63:1] = shifteddivfifth[63:1];
    assign divsigone4[0] = 1'b0;
    mux_264 multiplexer5(divmux4, divtrial5[31], divsigzero4, divsigone4);

    leftshift64 shifter6(divmux4, shifteddivsixth);
    cla_adder div6(divtrial6, shifteddivsixth[63:32], divnegate1, wesubtract, randomdivcarry6);
    assign divsigzero5[63:32] = divtrial6[31:0];
    assign divsigzero5[31:1] = shifteddivsixth[31:1];
    assign divsigzero5[0] = 1'b1;
    assign divsigone5[63:1] = shifteddivsixth[63:1];
    assign divsigone5[0] = 1'b0;
    mux_264 multiplexer6(divmux5, divtrial6[31], divsigzero5, divsigone5);

    leftshift64 shifter7(divmux5, shifteddivseventh);
    cla_adder div7(divtrial7, shifteddivseventh[63:32], divnegate1, wesubtract, randomdivcarry7);
    assign divsigzero6[63:32] = divtrial7[31:0];
    assign divsigzero6[31:1] = shifteddivseventh[31:1];
    assign divsigzero6[0] = 1'b1;
    assign divsigone6[63:1] = shifteddivseventh[63:1];
    assign divsigone6[0] = 1'b0;
    mux_264 multiplexer7(divmux6, divtrial7[31], divsigzero6, divsigone6);

    leftshift64 shifter8(divmux6, shifteddiveighth);
    cla_adder div8(divtrial8, shifteddiveighth[63:32], divnegate1, wesubtract, randomdivcarry8);
    assign divsigzero7[63:32] = divtrial8[31:0];
    assign divsigzero7[31:1] = shifteddiveighth[31:1];
    assign divsigzero7[0] = 1'b1;
    assign divsigone7[63:1] = shifteddiveighth[63:1];
    assign divsigone7[0] = 1'b0;
    mux_264 multiplexer8(divmux7, divtrial8[31], divsigzero7, divsigone7);

    leftshift64 shifter9(divmux7, shifteddivninth);
    cla_adder div9(divtrial9, shifteddivninth[63:32], divnegate1, wesubtract, randomdivcarry9);
    assign divsigzero8[63:32] = divtrial9[31:0];
    assign divsigzero8[31:1] = shifteddivninth[31:1];
    assign divsigzero8[0] = 1'b1;
    assign divsigone8[63:1] = shifteddivninth[63:1];
    assign divsigone8[0] = 1'b0;
    mux_264 multiplexer9(divmux8, divtrial9[31], divsigzero8, divsigone8);

    leftshift64 shifter10(divmux8, shifteddivtenth);
    cla_adder div10(divtrial10, shifteddivtenth[63:32], divnegate1, wesubtract, randomdivcarry10);
    assign divsigzero9[63:32] = divtrial10[31:0];
    assign divsigzero9[31:1] = shifteddivtenth[31:1];
    assign divsigzero9[0] = 1'b1;
    assign divsigone9[63:1] = shifteddivtenth[63:1];
    assign divsigone9[0] = 1'b0;
    mux_264 multiplexer10(divmux9, divtrial10[31], divsigzero9, divsigone9);

    leftshift64 shifter11(divmux9, shifteddiv11);
    cla_adder div11(divtrial11, shifteddiv11[63:32], divnegate1, wesubtract, randomdivcarry11);
    assign divsigzero10[63:32] = divtrial11[31:0];
    assign divsigzero10[31:1] = shifteddiv11[31:1];
    assign divsigzero10[0] = 1'b1;
    assign divsigone10[63:1] = shifteddiv11[63:1];
    assign divsigone10[0] = 1'b0;
    mux_264 multiplexer11(divmux10, divtrial11[31], divsigzero10, divsigone10);

    leftshift64 shifter12(divmux10, shifteddiv12);
    cla_adder div12(divtrial12, shifteddiv12[63:32], divnegate1, wesubtract, randomdivcarry12);
    assign divsigzero11[63:32] = divtrial12[31:0];
    assign divsigzero11[31:1] = shifteddiv12[31:1];
    assign divsigzero11[0] = 1'b1;
    assign divsigone11[63:1] = shifteddiv12[63:1];
    assign divsigone11[0] = 1'b0;
    mux_264 multiplexer12(divmux11, divtrial12[31], divsigzero11, divsigone11);

    leftshift64 shifter13(divmux11, shifteddiv13);
    cla_adder div13(divtrial13, shifteddiv13[63:32], divnegate1, wesubtract, randomdivcarry13);
    assign divsigzero12[63:32] = divtrial13[31:0];
    assign divsigzero12[31:1] = shifteddiv13[31:1];
    assign divsigzero12[0] = 1'b1;
    assign divsigone12[63:1] = shifteddiv13[63:1];
    assign divsigone12[0] = 1'b0;
    mux_264 multiplexer13(divmux12, divtrial13[31], divsigzero12, divsigone12);

    leftshift64 shifter14(divmux12, shifteddiv14);
    cla_adder div14(divtrial14, shifteddiv14[63:32], divnegate1, wesubtract, randomdivcarry14);
    assign divsigzero13[63:32] = divtrial14[31:0];
    assign divsigzero13[31:1] = shifteddiv14[31:1];
    assign divsigzero13[0] = 1'b1;
    assign divsigone13[63:1] = shifteddiv14[63:1];
    assign divsigone13[0] = 1'b0;
    mux_264 multiplexer14(divmux13, divtrial14[31], divsigzero13, divsigone13);

    leftshift64 shifter15(divmux13, shifteddiv15);
    cla_adder div15(divtrial15, shifteddiv15[63:32], divnegate1, wesubtract, randomdivcarry15);
    assign divsigzero14[63:32] = divtrial15[31:0];
    assign divsigzero14[31:1] = shifteddiv15[31:1];
    assign divsigzero14[0] = 1'b1;
    assign divsigone14[63:1] = shifteddiv15[63:1];
    assign divsigone14[0] = 1'b0;
    mux_264 multiplexer15(divmux14, divtrial15[31], divsigzero14, divsigone14);

    leftshift64 shifter16(divmux14, shifteddiv16);
    cla_adder div16(divtrial16, shifteddiv16[63:32], divnegate1, wesubtract, randomdivcarry16);
    assign divsigzero15[63:32] = divtrial16[31:0];
    assign divsigzero15[31:1] = shifteddiv16[31:1];
    assign divsigzero15[0] = 1'b1;
    assign divsigone15[63:1] = shifteddiv16[63:1];
    assign divsigone15[0] = 1'b0;
    mux_264 multiplexer16(divmux15, divtrial16[31], divsigzero15, divsigone15);

    leftshift64 shifter17(divmux15, shifteddiv17);
    cla_adder div17(divtrial17, shifteddiv17[63:32], divnegate1, wesubtract, randomdivcarry17);
    assign divsigzero16[63:32] = divtrial17[31:0];
    assign divsigzero16[31:1] = shifteddiv17[31:1];
    assign divsigzero16[0] = 1'b1;
    assign divsigone16[63:1] = shifteddiv17[63:1];
    assign divsigone16[0] = 1'b0;
    mux_264 multiplexer17(divmux16, divtrial17[31], divsigzero16, divsigone16);

    leftshift64 shifter18(divmux16, shifteddiv18);
    cla_adder div18(divtrial18, shifteddiv18[63:32], divnegate1, wesubtract, randomdivcarry18);
    assign divsigzero17[63:32] = divtrial18[31:0];
    assign divsigzero17[31:1] = shifteddiv18[31:1];
    assign divsigzero17[0] = 1'b1;
    assign divsigone17[63:1] = shifteddiv18[63:1];
    assign divsigone17[0] = 1'b0;
    mux_264 multiplexer18(divmux17, divtrial18[31], divsigzero17, divsigone17);

    leftshift64 shifter19(divmux17, shifteddiv19);
    cla_adder div19(divtrial19, shifteddiv19[63:32], divnegate1, wesubtract, randomdivcarry19);
    assign divsigzero18[63:32] = divtrial19[31:0];
    assign divsigzero18[31:1] = shifteddiv19[31:1];
    assign divsigzero18[0] = 1'b1;
    assign divsigone18[63:1] = shifteddiv19[63:1];
    assign divsigone18[0] = 1'b0;
    mux_264 multiplexer19(divmux18, divtrial19[31], divsigzero18, divsigone18);

    leftshift64 shifter20(divmux18, shifteddiv20);
    cla_adder div20(divtrial20, shifteddiv20[63:32], divnegate1, wesubtract, randomdivcarry20);
    assign divsigzero19[63:32] = divtrial20[31:0];
    assign divsigzero19[31:1] = shifteddiv20[31:1];
    assign divsigzero19[0] = 1'b1;
    assign divsigone19[63:1] = shifteddiv20[63:1];
    assign divsigone19[0] = 1'b0;
    mux_264 multiplexer20(divmux19, divtrial20[31], divsigzero19, divsigone19);

    leftshift64 shifter21(divmux19, shifteddiv21);
    cla_adder div21(divtrial21, shifteddiv21[63:32], divnegate1, wesubtract, randomdivcarry21);
    assign divsigzero20[63:32] = divtrial21[31:0];
    assign divsigzero20[31:1] = shifteddiv21[31:1];
    assign divsigzero20[0] = 1'b1;
    assign divsigone20[63:1] = shifteddiv21[63:1];
    assign divsigone20[0] = 1'b0;
    mux_264 multiplexer21(divmux20, divtrial21[31], divsigzero20, divsigone20);

    leftshift64 shifter22(divmux20, shifteddiv22);
    cla_adder div22(divtrial22, shifteddiv22[63:32], divnegate1, wesubtract, randomdivcarry22);
    assign divsigzero21[63:32] = divtrial22[31:0];
    assign divsigzero21[31:1] = shifteddiv22[31:1];
    assign divsigzero21[0] = 1'b1;
    assign divsigone21[63:1] = shifteddiv22[63:1];
    assign divsigone21[0] = 1'b0;
    mux_264 multiplexer22(divmux21, divtrial22[31], divsigzero21, divsigone21);

    leftshift64 shifter23(divmux21, shifteddiv23);
    cla_adder div23(divtrial23, shifteddiv23[63:32], divnegate1, wesubtract, randomdivcarry23);
    assign divsigzero22[63:32] = divtrial23[31:0];
    assign divsigzero22[31:1] = shifteddiv23[31:1];
    assign divsigzero22[0] = 1'b1;
    assign divsigone22[63:1] = shifteddiv23[63:1];
    assign divsigone22[0] = 1'b0;
    mux_264 multiplexer23(divmux22, divtrial23[31], divsigzero22, divsigone22);

    leftshift64 shifter24(divmux22, shifteddiv24);
    cla_adder div24(divtrial24, shifteddiv24[63:32], divnegate1, wesubtract, randomdivcarry24);
    assign divsigzero23[63:32] = divtrial24[31:0];
    assign divsigzero23[31:1] = shifteddiv24[31:1];
    assign divsigzero23[0] = 1'b1;
    assign divsigone23[63:1] = shifteddiv24[63:1];
    assign divsigone23[0] = 1'b0;
    mux_264 multiplexer24(divmux23, divtrial24[31], divsigzero23, divsigone23);

    leftshift64 shifter25(divmux23, shifteddiv25);
    cla_adder div25(divtrial25, shifteddiv25[63:32], divnegate1, wesubtract, randomdivcarry25);
    assign divsigzero24[63:32] = divtrial25[31:0];
    assign divsigzero24[31:1] = shifteddiv25[31:1];
    assign divsigzero24[0] = 1'b1;
    assign divsigone24[63:1] = shifteddiv25[63:1];
    assign divsigone24[0] = 1'b0;
    mux_264 multiplexer25(divmux24, divtrial25[31], divsigzero24, divsigone24);

    leftshift64 shifter26(divmux24, shifteddiv26);
    cla_adder div26(divtrial26, shifteddiv26[63:32], divnegate1, wesubtract, randomdivcarry26);
    assign divsigzero25[63:32] = divtrial26[31:0];
    assign divsigzero25[31:1] = shifteddiv26[31:1];
    assign divsigzero25[0] = 1'b1;
    assign divsigone25[63:1] = shifteddiv26[63:1];
    assign divsigone25[0] = 1'b0;
    mux_264 multiplexer26(divmux25, divtrial26[31], divsigzero25, divsigone25);

    leftshift64 shifter27(divmux25, shifteddiv27);
    cla_adder div27(divtrial27, shifteddiv27[63:32], divnegate1, wesubtract, randomdivcarry27);
    assign divsigzero26[63:32] = divtrial27[31:0];
    assign divsigzero26[31:1] = shifteddiv27[31:1];
    assign divsigzero26[0] = 1'b1;
    assign divsigone26[63:1] = shifteddiv27[63:1];
    assign divsigone26[0] = 1'b0;
    mux_264 multiplexer27(divmux26, divtrial27[31], divsigzero26, divsigone26);

    leftshift64 shifter28(divmux26, shifteddiv28);
    cla_adder div28(divtrial28, shifteddiv28[63:32], divnegate1, wesubtract, randomdivcarry28);
    assign divsigzero27[63:32] = divtrial28[31:0];
    assign divsigzero27[31:1] = shifteddiv28[31:1];
    assign divsigzero27[0] = 1'b1;
    assign divsigone27[63:1] = shifteddiv28[63:1];
    assign divsigone27[0] = 1'b0;
    mux_264 multiplexer28(divmux27, divtrial28[31], divsigzero27, divsigone27);

    leftshift64 shifter29(divmux27, shifteddiv29);
    cla_adder div29(divtrial29, shifteddiv29[63:32], divnegate1, wesubtract, randomdivcarry29);
    assign divsigzero28[63:32] = divtrial29[31:0];
    assign divsigzero28[31:1] = shifteddiv29[31:1];
    assign divsigzero28[0] = 1'b1;
    assign divsigone28[63:1] = shifteddiv29[63:1];
    assign divsigone28[0] = 1'b0;
    mux_264 multiplexer29(divmux28, divtrial29[31], divsigzero28, divsigone28);

    leftshift64 shifter30(divmux28, shifteddiv30);
    cla_adder div30(divtrial30, shifteddiv30[63:32], divnegate1, wesubtract, randomdivcarry30);
    assign divsigzero29[63:32] = divtrial30[31:0];
    assign divsigzero29[31:1] = shifteddiv30[31:1];
    assign divsigzero29[0] = 1'b1;
    assign divsigone29[63:1] = shifteddiv30[63:1];
    assign divsigone29[0] = 1'b0;
    mux_264 multiplexer30(divmux29, divtrial30[31], divsigzero29, divsigone29);

    leftshift64 shifter31(divmux29, shifteddiv31);
    cla_adder div31(divtrial31, shifteddiv31[63:32], divnegate1, wesubtract, randomdivcarry31);
    assign divsigzero30[63:32] = divtrial31[31:0];
    assign divsigzero30[31:1] = shifteddiv31[31:1];
    assign divsigzero30[0] = 1'b1;
    assign divsigone30[63:1] = shifteddiv31[63:1];
    assign divsigone30[0] = 1'b0;
    mux_264 multiplexer31(divmux30, divtrial31[31], divsigzero30, divsigone30);

    leftshift64 shifter32(divmux30, shifteddiv32);
    cla_adder div32(divtrial32, shifteddiv32[63:32], divnegate1, wesubtract, randomdivcarry32);
    assign divsigzero31[63:32] = divtrial32[31:0];
    assign divsigzero31[31:1] = shifteddiv32[31:1];
    assign divsigzero31[0] = 1'b1;
    assign divsigone31[63:1] = shifteddiv32[63:1];
    assign divsigone31[0] = 1'b0;
    mux_264 multiplexer32(divmux31, divtrial32[31], divsigzero31, divsigone31);

    wire [1:0] negselector;
    wire [31:0] mux4neg, finaldivanswer1, firstcarry1, holdervariable;
    wire secondcarry1;
    wire randomcarrying;
    assign firstcarry1[31:0] = 32'b00000000000000000000000000000001;
    assign secondcarry1 = 1'b0;
    assign negselector[1] = data_operandA[31];
    assign negselector[0] = data_operandB[31];
    b_negater neg8(divmux31[31:0], mux4neg);
    cla_adder finaldivanswer(finaldivanswer1, mux4neg, firstcarry1, secondcarry1, randomcarrying);
    mux_432 isitnegative(holdervariable, negselector, divmux31[31:0], finaldivanswer1, finaldivanswer1, divmux31[31:0]);
    wire isbzerowire;
    onebitcomparediv isbzero(isbzerowire, data_operandB);
    wire [31:0] allzeros, holdervariable2;
    assign allzeros[31:0] = 32'b00000000000000000000000000000000;
    mux_2 ifbzero(holdervariable2, isbzerowire, holdervariable, allzeros);








    wire finalout0, finalout1, finalout2, finalout3, finalout4;
    wire weisready;
    wire weisready2;
    wire exception;
    assign exception = 1'b0;
    assign weisready2 = 1'b1;
    wire rester;
    assign rester = 1'b1;
    wire [3:0] counting1;
    wire counting10;
    wire counting11;
    wire counting12;
    wire counting13;


    //How the data_resultRDY signal is asserted. Waits for the counter to go to 11111 (32).
    counter finalCounting(weisready2, clock, finalout0, finalout1, finalout2, finalout3, finalout4);




    and finaland(data_resultRDY, finalout0, finalout1, finalout2, finalout3, finalout4); 
    
    


endmodule

module productshifterfinal(beforeShift, afterShift, weready);

    input [63:0] beforeShift;
    output [63:0] afterShift;
    output weready;

    assign weready = 1'b0;

    wire mostSignificantBit;

    assign mostSignificantBit = beforeShift[63];

    oneright shifter(afterShift, beforeShift, mostSignificantBit);

endmodule


module productshifter(beforeShift, afterShift);

    input [63:0] beforeShift;
    output [63:0] afterShift;

    wire mostSignificantBit;

    assign mostSignificantBit = beforeShift[63];

    oneright shifter(afterShift, beforeShift, mostSignificantBit);

endmodule


module oneright(out, Aop4, msb4);
    input[63:0] Aop4;
    input msb4;
    output[63:0] out;

    assign out[63] = msb4;
    assign out[62:0] = Aop4[63:1];

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

module leftshift64(inner, outer);
    input [63:0] inner;
    output [63:0] outer;

    assign outer[63:1] = inner[62:0];
    assign outer[0] = 1'b0;


endmodule

//This is the control algo for the multiplier. It  decides whether to add/subtract a multiplicand and whether to "do nothing"
module control_algo(controlbits, output1);
    input[1:0] controlbits;
    output [1:0] output1;
    wire [1:0] w1, w2, w3, w4;

    assign w1[0] = 1'b0;
    assign w1[1] = 1'b0;

    assign w2[0] = 1'b1;
    assign w2[1] = 1'b0;

    assign w3[0] = 1'b1;
    assign w3[1] = 1'b1;

    assign w4[0] = 1'b0;
    assign w4[1] = 1'b0;
    
    mux_4 muxer1(output1, controlbits, w1, w2, w3, w4);



endmodule

//Carry lookahead adder from ALU assignment
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
    input in0, in1, in2, in3, in4, in5, in6, in7;
    output out;
    wire w1, w2;
    mux_41 top_first(w1, select[1:0], in0, in1, in2, in3);
    mux_41 bottom_first(w2, select[1:0], in4, in5, in6, in7);
    mux_21 second_mux2(out, select[2], w1, w2);
endmodule

module mux_4(out, select, in0, in1, in2, in3);
    input [1:0] select;
    input [1:0] in0, in1, in2, in3;
    output [1:0] out;
    wire [1:0] w1, w2;
    mux_2_special first_top(w1, select[0], in0, in1);
    mux_2_special first_bottom(w2, select[0], in2, in3);
    mux_2_special second(out, select[1], w1, w2);
endmodule

module mux_41(out, select, in0, in1, in2, in3);
    input [1:0] select;
    input in0, in1, in2, in3;
    output out;
    wire w1, w2;
    mux_21 first_top(w1, select[0], in0, in1);
    mux_21 first_bottom(w2, select[0], in2, in3);
    mux_21 second(out, select[1], w1, w2);
endmodule

module mux_432(out, select, in0, in1, in2, in3);
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

module mux_2_special(out, select, in0, in1);
    input select;
    input [1:0] in0, in1;
    output [1:0] out;
    assign out = select ? in1 : in0;

endmodule

module mux_21(out, select, in0, in1);
    input select;
    input in0, in1;
    output out;
    assign out = select ? in1 : in0;

endmodule

module mux_264(out, select, in0, in1);
    input select;
    input [63:0] in0, in1;
    output [63:0] out;
    assign out = select ? in1 : in0;

endmodule

//This module is used to bitwise negate binary numbers. Used in converting numbers from positive to negative and vice versa
module b_negater(nin, nout);
    input [31:0] nin;
    output [31:0] nout;

    wire bNegate0, bNegate1, bNegate2, bNegate3, bNegate4, bNegate5, bNegate6, bNegate7, bNegate8, bNegate9, bNegate10, bNegate11;
    wire bNegate12, bNegate13, bNegate14, bNegate15, bNegate16, bNegate17, bNegate18, bNegate19, bNegate20, bNegate21;
    wire bNegate22, bNegate23, bNegate24, bNegate25, bNegate26, bNegate27, bNegate28, bNegate29, bNegate30, bNegate31;

    not negatingB0(bNegate0, nin[0]);
    not negatingB1(bNegate1, nin[1]);
    not negatingB2(bNegate2, nin[2]);
    not negatingB3(bNegate3, nin[3]);
    not negatingB4(bNegate4, nin[4]);
    not negatingB5(bNegate5, nin[5]);
    not negatingB6(bNegate6, nin[6]);
    not negatingB7(bNegate7, nin[7]);
    not negatingB8(bNegate8, nin[8]);
    not negatingB9(bNegate9, nin[9]);
    not negatingB10(bNegate10, nin[10]);
    not negatingB11(bNegate11, nin[11]);
    not negatingB12(bNegate12, nin[12]);
    not negatingB13(bNegate13, nin[13]);
    not negatingB14(bNegate14, nin[14]);
    not negatingB15(bNegate15, nin[15]);
    not negatingB16(bNegate16, nin[16]);
    not negatingB17(bNegate17, nin[17]);
    not negatingB18(bNegate18, nin[18]);
    not negatingB19(bNegate19, nin[19]);
    not negatingB20(bNegate20, nin[20]);
    not negatingB21(bNegate21, nin[21]);
    not negatingB22(bNegate22, nin[22]);
    not negatingB23(bNegate23, nin[23]);
    not negatingB24(bNegate24, nin[24]);
    not negatingB25(bNegate25, nin[25]);
    not negatingB26(bNegate26, nin[26]);
    not negatingB27(bNegate27, nin[27]);
    not negatingB28(bNegate28, nin[28]);
    not negatingB29(bNegate29, nin[29]);
    not negatingB30(bNegate30, nin[30]);
    not negatingB31(bNegate31, nin[31]);

    assign nout[0] = bNegate0;
    assign nout[1] = bNegate1;
    assign nout[2] = bNegate2;
    assign nout[3] = bNegate3;
    assign nout[4] = bNegate4;
    assign nout[5] = bNegate5;
    assign nout[6] = bNegate6;
    assign nout[7] = bNegate7;
    assign nout[8] = bNegate8;
    assign nout[9] = bNegate9;
    assign nout[10] = bNegate10;
    assign nout[11] = bNegate11;
    assign nout[12] = bNegate12;
    assign nout[13] = bNegate13;
    assign nout[14] = bNegate14;
    assign nout[15] = bNegate15;
    assign nout[16] = bNegate16;
    assign nout[17] = bNegate17;
    assign nout[18] = bNegate18;
    assign nout[19] = bNegate19;
    assign nout[20] = bNegate20;
    assign nout[21] = bNegate21;
    assign nout[22] = bNegate22;
    assign nout[23] = bNegate23;
    assign nout[24] = bNegate24;
    assign nout[25] = bNegate25;
    assign nout[26] = bNegate26;
    assign nout[27] = bNegate27;
    assign nout[28] = bNegate28;
    assign nout[29] = bNegate29;
    assign nout[30] = bNegate30;
    assign nout[31] = bNegate31;

endmodule

module dffe_ref (q, d, clk, en, clr);
   
   //Inputs
   input clk, en, clr;
   input d;
   
   //Internal wire
   wire clr;

   //Output
   output q;
   
   //Register
   reg q;


   //Intialize q to 0
   initial
   begin
       q = 1'b0;
   end

   //Set value of q on positive edge of the clock or clear
   always @(posedge clk) begin
       //If clear is high, set q to 0
        if (en) begin
           q <= d;
       end
   end
endmodule

//T flip flop module uses the provided dffe module to implement a t flip flop
module tflipflop(clk, t, q);
    input clk, t;
    output q;
    wire tnot, and1, and2, or1, en, clr;
    wire finalAnswer1, finalAnswerNot;
    assign en = 1'b1;
    assign clr = 1'b0;

    not nott(tnot, t);
    not nott2(finalAnswerNot, finalAnswer1);
    and andit1(and1, tnot, finalAnswer1);
    and andit2(and2, t, finalAnswerNot);
    or orit1(or1, and1, and2);




    dffe_ref one(finalAnswer1, or1, clk, en, clr);

    assign q = finalAnswer1;


endmodule

//This counter counts to 31 and then resets to zero

module counter(tinput, clk, out0, out1, out2, out3, out4);
    input tinput, clk;
    output out0, out1, out2, out3, out4;
    wire q0, q1, q2, q3, q4, andder1, andder2, andder3;
    wire q0not, q1not, q2not, q3not, q4not;


    tflipflop flipflop1(clk, tinput, out0);
    tflipflop flipflop2(clk, out0, out1);
    and and43(andder1, out0, out1);
    tflipflop flipflop3(clk, andder1, out2);
    and and44(andder2, out0, out1, out2);
    tflipflop flipflop4(clk, andder2, out3);
    and and45(andder3, out0, out1, out2, out3);
    tflipflop flipflop5(clk, andder3, out4);


endmodule

module onebitcompare(out, a, b);
    input [31:0] a;
    input b;
    output out;
    wire and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17;
    wire and18, and19, and20, and21, and22, and23, and24, and25, and26, and27, and28, and29, and30, and31, and32;
    wire finalplease;

    xnor xnor1(and1, a[31], b);
    xnor xnor2(and2, a[30], b);
    xnor xnor3(and3, a[29], b);
    xnor xnor4(and4, a[28], b);
    xnor xnor5(and5, a[27], b);
    xnor xnor6(and6, a[26], b);
    xnor xnor7(and7, a[25], b);
    xnor xnor8(and8, a[24], b);
    xnor xnor9(and9, a[23], b);
    xnor xnor10(and10, a[22], b);
    xnor xnor11(and11, a[21], b);
    xnor xnor12(and12, a[20], b);
    xnor xnor13(and13, a[19], b);
    xnor xnor14(and14, a[18], b);
    xnor xnor15(and15, a[17], b);
    xnor xnor16(and16, a[16], b);
    xnor xnor17(and17, a[15], b);
    xnor xnor18(and18, a[14], b);
    xnor xnor19(and19, a[13], b);
    xnor xnor20(and20, a[12], b);
    xnor xnor21(and21, a[11], b);
    xnor xnor22(and22, a[10], b);
    xnor xnor23(and23, a[9], b);
    xnor xnor24(and24, a[8], b);
    xnor xnor25(and25, a[7], b);
    xnor xnor26(and26, a[6], b);
    xnor xnor27(and27, a[5], b);
    xnor xnor28(and28, a[4], b);
    xnor xnor29(and29, a[3], b);
    xnor xnor30(and30, a[2], b);
    xnor xnor31(and31, a[1], b);
    xnor xnor32(and32, a[0], b);
    
    and and33(finalplease, and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17, and18, and19, and20, and21, and22, and23, and24, and25, and26, and27, and28, and29, and30, and31, and32);
    not finalnotplease(out, finalplease);

endmodule

module onebitcomparediv(out, a);
    input [31:0] a;
    output out;
    wire and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17, and18, and19, and20, and21;
    wire and22, and23, and24, and25, and26, and27, and28, and29, and30, and31, and32;


    wire comparebit;
    assign comparebit = 1'b0;

    nor nor1(and1, a[31], comparebit);
    nor nor2(and2, a[30], comparebit);
    nor nor3(and3, a[29], comparebit);
    nor nor4(and4, a[28], comparebit);
    nor nor5(and5, a[27], comparebit);
    nor nor6(and6, a[26], comparebit);
    nor nor7(and7, a[25], comparebit);
    nor nor8(and8, a[24], comparebit);
    nor nor9(and9, a[23], comparebit);
    nor nor10(and10, a[22], comparebit);
    nor nor11(and11, a[21], comparebit);
    nor nor12(and12, a[20], comparebit);
    nor nor13(and13, a[19], comparebit);
    nor nor14(and14, a[18], comparebit);
    nor nor15(and15, a[17], comparebit);
    nor nor16(and16, a[16], comparebit);
    nor nor17(and17, a[15], comparebit);
    nor nor18(and18, a[14], comparebit);
    nor nor19(and19, a[13], comparebit);
    nor nor20(and20, a[12], comparebit);
    nor nor21(and21, a[11], comparebit);
    nor nor22(and22, a[10], comparebit);
    nor nor23(and23, a[9], comparebit);
    nor nor24(and24, a[8], comparebit);
    nor nor25(and25, a[7], comparebit);
    nor nor26(and26, a[6], comparebit);
    nor nor27(and27, a[5], comparebit);
    nor nor28(and28, a[4], comparebit);
    nor nor29(and29, a[3], comparebit);
    nor nor30(and30, a[2], comparebit);
    nor nor31(and31, a[1], comparebit);
    nor nor32(and32, a[0], comparebit);

    and finalandit(out, and1, and2, and3, and4, and5, and6, and7, and8, and9, and10, and11, and12, and13, and14, and15, and16, and17, and18, and19, and20, and21, and22, and23, and24, and25, and26, and27, and28, and29, and30, and31, and32);


endmodule

module wenegative(opA, opB, outA, outB);
    input [31:0] opA, opB;
    output [31:0] outA, outB;
    wire [31:0] negatefirst, negatesecond, negatethird, negatefourth;
    wire [31:0] carryinginfirst;
    wire carryinginsecond;
    wire randomcarryout, randomcarryout1;

    assign carryinginfirst[31:0] = 32'b00000000000000000000000000000001;
    assign carryinginsecond = 1'b0;

    b_negater negateit(opA, negatefirst);
    cla_adder addingfirst(negatesecond, negatefirst, carryinginfirst, carryinginsecond, randomcarryout);

    b_negater negateitup(opB, negatethird);
    cla_adder addingsecond(negatefourth, negatethird, carryinginfirst, carryinginsecond, randomcarryout1);

    mux_2 choose1(outA, opA[31], opA, negatesecond);
    mux_2 choose2(outB, opB[31], opB, negatefourth);
    

endmodule

module b_negater64(nin, nout);
    input [63:0] nin;
    output [63:0] nout;

endmodule

module srlatch(r, s, clk, out);
    input r, s, clk;
    output out;
    wire firstandw, secondandw, finalq, finalqnot;

    and firstand(firstandw, r, clk);
    and secondand(secondandw, s, clk);

    nor firstnor(finalq, firstandw, finalqnot);
    nor secondnor(finalqnot, finalq, secondandw);
    assign out = finalq;


endmodule