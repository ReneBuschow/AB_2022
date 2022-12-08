
// profile n length



dir = getDirectory("Choose a Folder");
print(dir);
setForegroundColor(255, 255, 255);
image=getFileList(dir);

for(k=0;k<image.length;k++)
{ 
	
	open(dir+image[k]);
	name=getTitle();
	setTool("freeline");
	setSlice(2);
	waitForUser("Please add Profile");
	roiManager("Add");
	roiManager("Deselect");
	roiManager("Save", ""+dir+name+"profile_RoiSet.zip");	
	selectWindow(name);
	roiManager("Select", 0);

	
// get profiles	
	setSlice(1);
	profile = getProfile();
  	for (i=0; i<profile.length; i++)
      setResult("CH1", i, profile[i]);
	  updateResults;

	  
	setSlice(2);
  	profile = getProfile();
  	for (i=0; i<profile.length; i++)
      setResult("CH2", i, profile[i]);
	  updateResults;

	setSlice(3);
  	profile = getProfile();
  	for (i=0; i<profile.length; i++)
      setResult("CH3", i, profile[i]);
	  updateResults;

	
				selectWindow("Results");
				saveAs("Text", ""+dir+name+"_profile.txt");
				run("Clear Results");
				
				roiManager("Select", 0);
				roiManager("Measure");
				selectWindow("Results");
				saveAs("Text", ""+dir+name+"_length.txt");
				run("Clear Results");



roiManager("Delete");


name=getTitle();
selectWindow(name);
run("Duplicate...", "title=mask duplicate channels=2");
selectWindow("mask");
run("Smooth");
run("Smooth");
run("Smooth");
run("Sharpen");
run("Sharpen");
run("Sharpen");
run("Smooth");
run("Smooth");
run("Smooth");
run("Smooth");
run("Smooth");
run("Smooth");
run("Smooth");
run("Smooth");


run("Subtract Background...", "rolling=150 light sliding");
setOption("BlackBackground", false);
setAutoThreshold("Triangle");
run("Convert to Mask");
run("Fill Holes");
run("Open");
run("Analyze Particles...", "size=10000-10000000 exclude clear include summarize add");

selectWindow("mask");	
close();

selectWindow(name);
run("Set Measurements...", "area mean standard modal perimeter shape feret's redirect=None decimal=3");
roiManager("Select", 0);
roiManager("Measure");
selectWindow("Results");
saveAs("Text", ""+dir+name+"_morph.txt");
run("Clear Results");

roiManager("Select", 0);

Roi.getBounds(rx, ry, width, height); 
			row = 0; 

			for(y=ry; y<ry+height; y++)	{ 
    			for(x=rx; x<rx+width; x++) { 
        			if(Roi.contains(x, y)==1) 	{ 
        				setResult("X", row, x); 
            			setResult("Y", row, y); 
            			setSlice(1);
            			setResult("Value1", row, getPixel(x, y)); 
            			setSlice(2);
						setResult("Value2", row, getPixel(x, y));
						setSlice(3); 
						setResult("Value3", row, getPixel(x, y)); 

            			row++; 
												} 
    										} 
										} 
			selectWindow("Results");
			saveAs("Text", ""+dir+name+"_pix.txt");
        	run("Clear Results");


	roiManager("Deselect");
	roiManager("Save", ""+dir+name+"structure_RoiSet.zip");	

roiManager("Delete");
selectWindow(name);
close();

}
