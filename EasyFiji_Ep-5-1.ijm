/*
 * title: IF makeup_Exp001
 * author: Easy Fiji
 * created: 2022 11 11
 * last update: 2022 11 11
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
open(dirIn+"ch1.tif");
Input=getTitle();
print("Input image: "+Input);
//1st crop
run("Specify...", "width=[5] height=[5] centered scaled");
roiManager("Add");
roiManager("Show All with labels");
//save roi
roiManager("select", 0);
roiManager("Rename", "5micron");
saveAs ("roi", dirIn + "5micron.roi");
/////////////////////////////////////////////////////////////////////////
run("Close All");
//
print("Macro Finish");	
print("----------------------------------------------------");