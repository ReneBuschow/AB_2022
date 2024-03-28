Dear reader, 

within our here installed github project directory. We publish the code generated to solve our specific questions. You can download and modify the published code as desired given the citation of the person who generated it:
René Buschow, Imaging Core Facility, Max Planck Institut for Molecular Genetics, 14195 Berlin - Germany, buschow@molgen.mpg.de, 0049 30 8413 1663. 
Please also cite the Perosn who inspired, alpha-beta-gamma-tested and utilized it Dr. Adriano Bolondi.

DEMO-Data: Raw Image data for fish analysis (28112023_20x_2x_Fgf17_Irx5_96h_TLS.czi) as well as pixelwise expression/morphometrics/profiles (Explant_TLS_C4_after.czi) 
can be found here https://nc.molgen.mpg.de/cloud/index.php/apps/files/?dir=/&fileid=295070. NOTE: The here shared data is its original .czi format without any compression or modification. Thereby we would like to enable the reader to have acces also on the meta data (detector settings, resolutions, and way more). If the reader has trouble downloading, opening accesing these please just contact René.

We are ready and happy to share way more raw data, but please be aware/prepared that many of our experiments are imaging based and therefore often exceeed 10,20... gb. 
We have the the infrastructure to share it over own online repositories but our data policy is encouraging us to better archive data than cloud share it on a long term. But feel free to contact René or Adriano for more.

#### FIJI/imagej
Version: The code was generated in FIJI v1.53 and v1.54f, the creator of the code used base functionalities therefore it should work in almost all version. 
System Requirements: The scripts were generated under Windows 10 but should work under Linux & MAC as well (not tested).

Installation: Copy or open Code in any ImageJ/FIJI instance

221125_profile_n_morph.ijm / image analysis generates data for morphometrics, intensity quantification, profile plots and pixel based xy-smoothscatter 

### R ### 
Version: The code was generated in R v3.5.1 and 4.0.2. However, the creator of the code used base functionalities with as few special packages as possible. 

System Requirements: The scripts were generated under Windows 10 but should work under Linux & MAC as well (not tested). 

Installation: Copy the, or open Code in R 

221130_smooth_scatter_from_individuals.R / statistics xy-smoothscatter plot relates to 221125_profile_n_morph.ijm

221130_smooth_scatter_from_plate.R / statistics xy-smoothscatter plot relates to 221125_profile_n_morph.ijm

231201_r_script_smoothScatter_FISH.R / statistics xy-smoothscatter plot realtes to AB_231127_fish_v2.czias (below)


### ZEN ### 
Version: The here uploaded ZEN Image analysis setting was generated under ZEN blue version 3.1,3.2 and 3.4 (licensed by Zeiss Germany), exclusively windows.
System Requirements: For testing pupose you can download (Zeiss.com) and get a two month trial license for ZEN and its 
related image analysis, intellesis and OAD module or buy it.

Installation:  Simply import the .czias file into the image analysis module apply to data and get results. 

AB_221122_stembryo.czias / image analysis morphometrics

AB_231127_fish_v2.czias / image analysis transcript quantification

Some of the here implemented analysis strategies utilized neuronal network models to classify pixel groups. To run those the reader requires additonal modules namely the ZEN Intellesis module (also free testable)

IG-250520_bf_only_v3_ai.czias/ image analysis morphometrics

1cc68bff-5685-426e-a525-57f8d2730b0a.xml & 2c6ffef5-2412-4ab3-8637-50bc9c2a55a6.model / intellesis model
	
To streamline our worksflows use custome macro/batch function for automated processing our data. Here we have a short snippet that runs thorugh folders with imaging z-stack data and produces Max-Intensity-Projection.

RB_mip_projector.czmac / batch function



