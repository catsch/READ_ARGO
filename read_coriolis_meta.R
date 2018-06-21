############################################################################################
# Routine developpee par C. Schmechtig 
#
# June 2018 : Use this routine to read metadata file
#############################################################################################

library(ncdf4)
library(stringr) ### manipulate char string 


#############################################################################################
# 1. OPEN the metadata file
#############################################################################################

# File meta 
file_in_meta="/home/schmechtig/TRAITEMENT_FLOTTEUR/ANTOINE/DATA_MANAGEMENT/RT/DATA/6901032/6901032_meta.nc"

# Open the file 
filenc_meta=nc_open(file_in_meta,readunlim=FALSE,write=FALSE)

##############################################################################################
# 2. you want to know everything about the SENSORs mounted on float
##############################################################################################
SENSOR=ncvar_get(filenc_meta,"SENSOR")
SENSOR_MAKER=ncvar_get(filenc_meta,"SENSOR_MAKER")
SENSOR_MODEL=ncvar_get(filenc_meta,"SENSOR_MODEL")
SENSOR_SERIAL_NO=ncvar_get(filenc_meta,"SENSOR_SERIAL_NO")

for (i in 1:length(SENSOR)) {
print(str_trim(SENSOR[i]))
print(str_trim(SENSOR_MAKER[i]))
print(str_trim(SENSOR_MODEL[i]))
print(str_trim(SENSOR_SERIAL_NO[i]))
}

##############################################################################################
# 3. you want to know what Parameters are in the file 
##############################################################################################
# you ll get all the parameter that are in the file 
PARAMETER=ncvar_get(filenc_meta,"PARAMETER")
print(str_trim(PARAMETER))

### For example we are interested in information related to CHLA 
i_param_chla=grep(pattern="CHLA",PARAMETER)

##############################################################################################
# 4. you want to know everything about the calibration 
##############################################################################################
PREDEPLOYMENT_CALIB_EQUATION=ncvar_get(filenc_meta,"PREDEPLOYMENT_CALIB_EQUATION")
PREDEPLOYMENT_CALIB_COEFFICIENT=ncvar_get(filenc_meta,"PREDEPLOYMENT_CALIB_COEFFICIENT")
PREDEPLOYMENT_CALIB_COMMENT=ncvar_get(filenc_meta,"PREDEPLOYMENT_CALIB_COMMENT")

for (i in 1:length(i_param_chla)) {
print(PARAMETER[i_param_chla[i]])
print(str_trim(PREDEPLOYMENT_CALIB_EQUATION[i_param_chla[i]]))
print(str_trim(PREDEPLOYMENT_CALIB_COEFFICIENT[i_param_chla[i]]))
print(str_trim(PREDEPLOYMENT_CALIB_COMMENT[i_param_chla[i]]))

}

