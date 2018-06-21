read_CTD <- function(file_in_C) {

filenc_C=nc_open(file_in_C,readunlim=FALSE,write=FALSE)

### Raw data

PSAL=ncvar_get(filenc_C,"PSAL")
TEMP=ncvar_get(filenc_C,"TEMP")
PRES=ncvar_get(filenc_C,"PRES")

PSAL_QC=ncvar_get(filenc_C,"PSAL_QC")
TEMP_QC=ncvar_get(filenc_C,"TEMP_QC")
PRES_QC=ncvar_get(filenc_C,"PRES_QC")

### Adjusted data 

PSAL_ADJUSTED=ncvar_get(filenc_C,"PSAL_ADJUSTED")
TEMP_ADJUSTED=ncvar_get(filenc_C,"TEMP_ADJUSTED")
PRES_ADJUSTED=ncvar_get(filenc_C,"PRES_ADJUSTED")

PSAL_ADJUSTED_QC=ncvar_get(filenc_C,"PSAL_ADJUSTED_QC")
TEMP_ADJUSTED_QC=ncvar_get(filenc_C,"TEMP_ADJUSTED_QC")
PRES_ADJUSTED_QC=ncvar_get(filenc_C,"PRES_ADJUSTED_QC")

#### CTD is always the 1st profile of the nc 

PSAL_CTD=PSAL[,1]
TEMP_CTD=TEMP[,1]
PRES_CTD=PRES[,1]

#### Get the QC 
#### 0:no QC, 1:Good, 2:Probably Good, 3:Probably Bad, 4:Bad, 5:Changed, 8:interpolated 
PSAL_CTD_QC=PSAL_QC[1]
TEMP_CTD_QC=TEMP_QC[1]
PRES_CTD_QC=PRES_QC[1]


##### Return
result=(list(PRES=PRES_CTD,PSAL=PSAL_CTD,TEMP=TEMP_CTD,PRES_QC=PRES_CTD_QC,PSAL_QC=PSAL_CTD_QC,TEMP_QC=TEMP_CTD_QC))

return(result)
}
