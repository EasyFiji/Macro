/*
 * title: IF makeup_Exp001
 * author: Easy Fiji
 * created: 2022 11 11
 * last update: 2022 11 11
 * version: 1
 */

print("-----------------------------------");
print("START");
roiManager("Reset");
//
run("Close All");
//Assign the folder
dirIn=getDirectory("Choose the input directory");
dirOut=getDirectory("Choose the output directory");
//Open file 
open(dirIn+"IF_2D_4ch_m.tif");
Input=getTitle();
print("Input image: "+Input);
//1st crop
run("Specify...", "width=[5] height=[5] centered scaled");
roiManager("Add");
roiManager("Show All with labels");
//save roi
roiManager("select", 0);
roiManager("Set Color", "white");
roiManager("Set Line Width", 5);
roiManager("Rename", "5micron");
saveAs ("roi", dirIn + "5micron.roi");
/////////////////////////////////////////////////////////////////////////
//make crop
selectWindow(Input);
roiManager("select", 0);
//Duplicate
run("Duplicate...", "duplicate");
saveAs("Tiff", dirIn+"IF_c1.tif");
Input_c1=getTitle();
//////Save each channel as RGB format///////////////////////////////////////////////////////////////
//ch1
selectWindow(Input_c1);
Stack.setActiveChannels("1000");
run("RGB Color");
saveAs("Tiff", dirOut+"ch1_c1.tif");
close();
//ch2
selectWindow(Input_c1);
Stack.setActiveChannels("0100");
run("RGB Color");
saveAs("Tiff", dirOut+"ch2_c1.tif");
close();
//ch3
selectWindow(Input_c1);
Stack.setActiveChannels("0010");
run("RGB Color");
saveAs("Tiff", dirOut+"ch3_c1.tif");
close();
//ch4
selectWindow(Input_c1);
Stack.setActiveChannels("0001");
run("RGB Color");
saveAs("Tiff", dirOut+"ch4_c1.tif");
close();
//////Draw Roi ///////////////////////////////////////////////////////////////
//ch1
selectWindow(Input);
Stack.setActiveChannels("1000");
run("RGB Color");
roiManager("select", 0);
run("Draw", "slice");
saveAs("Tiff", dirOut+"ch1_.tif");
close();
//ch2
selectWindow(Input);
Stack.setActiveChannels("0100");
run("RGB Color");
roiManager("select", 0);
run("Draw", "slice");
saveAs("Tiff", dirOut+"ch2_.tif");
close();
//ch3
selectWindow(Input);
Stack.setActiveChannels("0010");
run("RGB Color");
roiManager("select", 0);
run("Draw", "slice");
saveAs("Tiff", dirOut+"ch3_.tif");
close();
//ch4
selectWindow(Input);
Stack.setActiveChannels("0001");
run("RGB Color");
roiManager("select", 0);
run("Draw", "slice");
saveAs("Tiff", dirOut+"ch4_.tif");
close();
////////////////////////////////////////////////////////////
run("Close All");
//
print("Macro Finish");	
print("----------------------------------------------------");