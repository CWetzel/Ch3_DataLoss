#########################################################
##         Load all Required Functions                 ##
##         Written by:  Chantel Wetzel                 ##
##              Date: 4-18-2014                        ##
#########################################################


if (github == FALSE) {
#Life-History Parameters ============================================================
source(paste(drive,"/PhD/Chapter3/code/functions/LH_parameter_values.R",sep=""))

#Data Scenarios======================================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Data_Scenarios.R",sep=""))

#Seed Function=======================================================================
#source(paste(drive,"/PhD/Chapter3/code/functions/Get_Seed.R",sep=""))

#Lengths Function====================================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Multinom_Lengths.R",sep=""))

#Ages Funciton=======================================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Multinom_Ages.R",sep=""))

#Survey Function=====================================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Do_Survey.R",sep=""))

#Report File Summary Function =======================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Rep_Summary.R",sep=""))

#SS File Writer Function ============================================================
source(paste(drive,"/PhD/Chapter3/code/functions/SS_File_Writer.R",sep=""))

#Report File Summary Function =======================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Get_Biology.R",sep=""))

#Overfished Selectivity Function =======================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Overfished_Selex.R",sep=""))

#Sampling ==================================================================
source(paste(drive,"/PhD/Chapter3/code/functions/Get_Samp.R",sep=""))

#Storage Arrays========================================================================
#source(paste(drive,"/PhD/Chapter3/code/functions/Arrays.R",sep=""))
}

if (github == TRUE) {
temp.drive = drive; drive = "C:"
#Life-History Parameters ============================================================
source(paste(drive, git.wd, "/functions/LH_parameter_values.R",sep=""))

#Data Scenarios======================================================================
source(paste(drive, git.wd, "/functions/Data_Scenarios.R",sep=""))

#Seed Function=======================================================================
source(paste(drive, git.wd, "/functions/Get_Seed.R",sep=""))

#Lengths Function====================================================================
source(paste(drive, git.wd, "/functions/Multinom_Lengths.R",sep=""))

#Ages Funciton=======================================================================
source(paste(drive, git.wd, "/functions/Multinom_Ages.R",sep=""))

#Survey Function=====================================================================
source(paste(drive, git.wd, "/functions/Do_Survey.R",sep=""))

#Report File Summary Function =======================================================
source(paste(drive, git.wd, "/functions/Rep_Summary.R",sep=""))

#SS File Writer Function ============================================================
source(paste(drive, git.wd, "/functions/SS_File_Writer.R",sep=""))

#Report File Summary Function =======================================================
source(paste(drive, git.wd, "/functions/Get_Biology.R",sep=""))

#Overfished Selectivity Function =======================================================
source(paste(drive, git.wd, "/functions/Overfished_Selex.R",sep=""))

#Comp Samples =======================================================
source(paste(drive, git.wd, "/functions/Get_Samps.R",sep=""))

#Storage Arrays========================================================================
source(paste(drive, git.wd, "/functions/Arrays.R",sep=""))

drive = temp.drive
}