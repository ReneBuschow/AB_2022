
##################### require libraries section

library(rgl)
library(RColorBrewer)
library(grdevice)
library(plotly)
###################### END 
           ###########



###################### working directory and base_data



base_data<-"ZOI.csv"
base_name <-substring(base_data,1,nchar(base_data)-4)

setwd("E:/Adri/231130_analysis/tabels")


### data read in single file
data_raw<-read.csv(base_data, header = FALSE, skip=2, dec=",", sep=";")



identi_1<-1

###################### END 
           ###########

###################### data cleaninig...var data_plot


#data_raw1<-subset(data_raw,data_raw[,25]==1)
#data_raw2<-subset(data_raw1,data_raw1[,37]>=120000)
#data_raw3<-subset(data_raw2,data_raw2[,37]<=280000)
data_plot<-data_raw

######################## END 
            ############


            ############
######################## subsetting tiles/images/scenes... var i 


### specifi subsets



#i<-1

scenes<-unique(data_plot[,identi_1])

for (i in 1:length(scenes))
	{
	data_scene<-subset(data_plot,data_plot[,identi_1]==scenes[i])

######################## END 
 


            ############
######################## plot parameters to added ... var low,lim,xal,yla,zla,main,label,lut

	low_lim	<-0
	hig_lim	<-15
	xla		<-"Mean 488"
	yla		<-"Mean 647"
	zla		<-"z in um"
	main		<-paste(scenes[i],"_",base_name,sep="")
	label		<-base_name
#	main2		<-paste(scenes[i],images[j],sep="")
#	lut		<-colorRampPalette(c("white","blue","cyan","green","yellow"))
	lut		<-colorRampPalette(c("white","cyan","green","white"))



######################## END
 
######norm block



	xnorm<-c(2,3,5,6,4,7.5,4,5)
	ynorm<-c(3,2.5,4,2,4,9,9.8,5)

scenes<-unique(data_plot[,identi_1])

data_scene1<-subset(data_plot,data_plot[,identi_1]==scenes[1])
data_scene1[,5]<-data_scene1[,5]/xnorm[1]
data_scene1[,6]<-data_scene1[,6]/xnorm[1]


data_scene2<-subset(data_plot,data_plot[,identi_1]==scenes[2])
data_scene2[,5]<-data_scene2[,5]/xnorm[2]
data_scene2[,6]<-data_scene2[,6]/xnorm[2]


data_scene3<-subset(data_plot,data_plot[,identi_1]==scenes[3])
data_scene3[,5]<-data_scene3[,5]/xnorm[3]
data_scene3[,6]<-data_scene3[,6]/xnorm[3]


data_scene4<-subset(data_plot,data_plot[,identi_1]==scenes[4])
data_scene4[,5]<-data_scene4[,5]/xnorm[4]
data_scene4[,6]<-data_scene4[,6]/xnorm[4]


data_scene5<-subset(data_plot,data_plot[,identi_1]==scenes[5])
data_scene5[,5]<-data_scene5[,5]/xnorm[5]
data_scene5[,6]<-data_scene5[,6]/xnorm[5]


data_scene6<-subset(data_plot,data_plot[,identi_1]==scenes[6])
data_scene6[,5]<-data_scene6[,5]/xnorm[6]
data_scene6[,6]<-data_scene6[,6]/xnorm[6]


data_scene7<-subset(data_plot,data_plot[,identi_1]==scenes[7])
data_scene7[,5]<-data_scene7[,5]/xnorm[7]
data_scene7[,6]<-data_scene7[,6]/xnorm[7]




one<-rbind(data_scene1,data_scene2,data_scene3,data_scene4,data_scene5)

two<-rbind(data_scene6,data_scene7)

########

scenes<-unique(data_plot[,identi_1])

for (i in 1:length(scenes))
	{
	data_scene<-subset(data_plot,data_plot[,identi_1]==scenes[i])
	main		<-paste(scenes[i],"_",base_name,sep="")

            ############
######################## parameters to check ... var par_1:n

	par_1<-one[,5]
	par_2<-one[,6]
	par_3<-data_scene[,7]
	par_4<-data_scene[,8]
	par_5<-data_scene[,9]
	par_6<-data_scene[,10]

######################## END
 










            ############
######################## 2 Dimensions Smooth Scatter

	#par_1<-data_scene7[,5]
	#par_2<-data_scene7[,6]



	### Smooth parameters
#	xnorm<-c(2,3,5,6,4,7.5,4,5)
#	ynorm<-c(3,2.5,4,2,4,9,9.8,5)
	band<-0.075
	bins<-150
###


	par_1<-one[,5]
	par_2<-one[,6]
	
	pdf(paste(label,"_",main,"raw_first5_smooth_pool_one_norm_blure.pdf",sep=""),width = 10, height = 10)
#	lut		<-colorRampPalette(c("white","blue","white","red","white"))
	lut		<-colorRampPalette(c("white","blue","cyan","green","yellow"))
				#par(bg = 'black', fg = 'white')
				smoothScatter(par_1,par_2,xlab=xla,ylab=yla,xlim=c(0,2),ylim=c(0,2),main=main,
				bandwidth=band,
				nbin=bins,
				transformation=function(x)x^1.5,
				colramp = lut)
				#grid(nx = NULL, ny = NULL,
				#lty = 2,      # Grid line type
			      #col = "gray", # Grid line color
			      #lwd = 2)  
	dev.off()




	par_1<-two[,5]
	par_2<-two[,6]

	
	pdf(paste(label,"_",main,"raw_last_smooth_pool_two_norm_rainbow.pdf",sep=""),width = 10, height = 10)
	lut		<-colorRampPalette(c("white","blue","white","red","white"))
				#par(bg = 'black', fg = 'white')
				smoothScatter(par_1,par_2,xlab=xla,ylab=yla,xlim=c(0.5,1.5),ylim=c(0,3),main=main,
				bandwidth=band,
				nbin=bins,
				transformation=function(x)x^1.5,
				colramp = lut)
				#grid(nx = NULL, ny = NULL,
				#lty = 2,      # Grid line type
			      #col = "gray", # Grid line color
			      #lwd = 2)  
	dev.off()










}

