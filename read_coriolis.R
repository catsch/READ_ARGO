############################################################################################
# Routine developpee par C. Schmechtig 
#
# June 2018 : Use this routine to get data from B and C Files  
#############################################################################################

library(ncdf4)
require(oce)
library(stringr) ### manipulate char string 

source("./read_CTD.R")
source("./read_BFILE.R")


#############################################################################################
# 1. OPEN the files
#############################################################################################
###### to change to read all files on order to perform DM in it 
# File B
file_in_B="/home/schmechtig/TRAITEMENT_FLOTTEUR/ANTOINE/DATA_MANAGEMENT/RT/DATA/6901032/BR6901032_002.nc"

# File C (could be D or R)
file_in_C="/home/schmechtig/TRAITEMENT_FLOTTEUR/ANTOINE/DATA_MANAGEMENT/RT/DATA/6901032/D6901032_002.nc"

# Open the file 
filenc_B=nc_open(file_in_B,readunlim=FALSE,write=FALSE)

##################################################
#### 1. Get CTD Data from the Netcdf C File 
##################################################

CTD=read_CTD(file_in_C)

# we get	: CTD$PRES 
#  			: CTD$PSAL 
#			: CTD$TEMP
#			: CTD$PRES_QC
#			: CTD$PSAL_QC
#			: CTD$TEMP_QC


##################################################
#### 2. Get BGC data from the B File
##################################################

B_FILE=read_BFILE(filenc_B)





