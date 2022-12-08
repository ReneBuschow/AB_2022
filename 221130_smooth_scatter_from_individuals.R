setwd("R:/Data/Adri/221125/221128/plot/TLS_CL")
files<- list.files(pattern="pix")
x_cutoff=10
y_cutoff=20

	for (n in 1:length(files))

		{



data_raw<-read.csv(files[n], header = FALSE, skip=1, dec=",", sep="")

data_plot<-subset(data_raw,data_raw[,4] >=  x_cutoff | data_raw[,6] >=  y_cutoff )


tiff(paste(files[n],".tiff",sep=""),height=500,width=500,units="px")

smoothScatter(data_plot[,4],data_plot[,6],xlab="T-Intensity", nrpoints=0,bandwidth=0.5,ylab="Sox2-Intensity",xlim=c(7,20),ylim=c(18,30),main=files[n])

dev.off()


}

