/*
 * title: IF makeup_Exp001
 * author: Easy Fiji
 * created: 2022 4 2
 * last update: 2022 4 2
 * version: 1
 */
print("-----------------------------------");
print("START");
//
 run("Close All");
//Assign the folder
dirIn=getDirectory("Choose the input directory");
dirOut=getDirectory("Choose the output directory");
//Open file 
open(dirIn+"IF_2D_4ch.tif");
Input=getTitle();
print("Input image: "+Input);
//change color & brightness
Stack.setDisplayMode("color");
Stack.setChannel(1);
run("Magenta");
setMinAndMax(210, 1585);
Stack.setChannel(2);
run("Green");
setMinAndMax(181, 1333);
Stack.setChannel(3);
run("Red");
setMinAndMax(89, 1349);
Stack.setChannel(4);
run("Grays");
setMinAndMax(120, 354);
//save modified image
selectWindow(Input);
Stack.setDisplayMode("composite");
saveAs("Tiff", dirIn+ "IF_2D_4ch_m.tif");
Input_m=getTitle();
//////Save each channel as RGB format///////////////////////////////////////////////////////////////
//ch1
selectWindow(Input_m);
Stack.setActiveChannels("1000");
run("RGB Color");
saveAs("Tiff", dirOut+"ch1.tif");
close();
//ch2
selectWindow(Input_m);
Stack.setActiveChannels("0100");
run("RGB Color");
saveAs("Tiff", dirOut+"ch2.tif");
close();
//ch3
selectWindow(Input_m);
Stack.setActiveChannels("0010");
run("RGB Color");
saveAs("Tiff", dirOut+"ch3.tif");
close();
//ch4
selectWindow(Input_m);
Stack.setActiveChannels("0001");
run("RGB Color");
saveAs("Tiff", dirOut+"ch4.tif");
close();
//ch1+ch2
selectWindow(Input_m);
Stack.setActiveChannels("1100");
run("RGB Color");
saveAs("Tiff", dirOut+"ch1-ch2.tif");
close();
//ch2+ch3
selectWindow(Input_m);
Stack.setActiveChannels("0110");
run("RGB Color");
saveAs("Tiff", dirOut+"ch2-ch3.tif");
close();
//ch1+ch2+ch3+ch4
selectWindow(Input_m);
Stack.setActiveChannels("1111");
run("RGB Color");
saveAs("Tiff", dirOut+"all.tif");
close();
/////////////////////////////////////////////////////////////////////////
run("Close All");
//
print("Macro Finish");	
print("----------------------------------------------------");