read_BFILE<-function(filenc_B) {

#### Get the list of parameters in the profile
STATION_PARAMETERS=ncvar_get(filenc_B,"STATION_PARAMETERS")

### GET the dimension 

N_PROF=filenc_B$dim[['N_PROF']]$len

N_PARAM=filenc_B$dim[['N_PARAM']]$len

#### Getting the Vertical sampling scheme 
#### It is a good way to understand why in one file you may have different profiles for 
#### the same parameter : for example you can have pumped and unpumped data 
VERTICAL_SAMPLING_SCHEME=ncvar_get(filenc_B,"VERTICAL_SAMPLING_SCHEME")

### PARAMETER_DATA_MODE is the status of the qualification of the DATA 
# R (RT) 
# A (Adjusted) 
# D (Delayed Mode)
PARAMETER_DATA_MODE=ncvar_get(filenc_B,"PARAMETER_DATA_MODE")

#### PRINT ON SCREEN What parameter is on which profile 
for (i in 1:N_PROF) {
print(paste("profile=",i))
print(str_trim(STATION_PARAMETERS[,i]))
print(paste("With PARAMETER_DATA_MODE=",PARAMETER_DATA_MODE[i]))
print(paste("and VERTICAL SAMPLING SCHEME=",VERTICAL_SAMPLING_SCHEME[i]))
print("************************************************************")
}

### We have N_PROF of PRESSURE profiles !! and N_PROF of CHLA profiles full of NA
PRES=ncvar_get(filenc_B,"PRES")

CHLA=ncvar_get(filenc_B,"CHLA")

CHLA_ADJUSTED=ncvar_get(filenc_B,"CHLA_ADJUSTED")

#### Another Way to access the data :
#### You can also search what is the index of the profile of CHLA

# Stations parameters has a fixed length 64 characters 
CHLA_STRING=str_pad("CHLA",64,"right")

# Find the profile containing CHLA 
index_chla=which(STATION_PARAMETERS == CHLA_STRING, arr.ind=TRUE)

# Profile index of the CHLA 
i_prof_chla=index_chla[,2]
# param index of the chla 
i_param_chla=index_chla[,1]

### PRESSURE FOR CHLA
PRES_CHLA=PRES[,i_prof_chla]
### CHLA without NA
CHLA_CHLA=CHLA[,i_prof_chla]
### CHLA_ADJUSTED 
CHLA_ADJUSTED_CHLA=CHLA_ADJUSTED[,i_prof_chla]


print("Chla profile")
print(paste(PRES_CHLA,CHLA_CHLA,CHLA_ADJUSTED_CHLA))

#### You can be also interested in calibration after deployment 
SCIENTIFIC_CALIB_EQUATION=ncvar_get(filenc_B,"SCIENTIFIC_CALIB_EQUATION")
SCIENTIFIC_CALIB_COEFFICIENT=ncvar_get(filenc_B,"SCIENTIFIC_CALIB_COEFFICIENT")
SCIENTIFIC_CALIB_COMMENT=ncvar_get(filenc_B,"SCIENTIFIC_CALIB_COMMENT")

print("scientific calibration")
print(paste("Equation=",SCIENTIFIC_CALIB_EQUATION[i_param_chla,,i_prof_chla]))
print(paste("Coefficient=",SCIENTIFIC_CALIB_COEFFICIENT[i_param_chla,,i_prof_chla]))
print(paste("Comment=",SCIENTIFIC_CALIB_COMMENT[i_param_chla,,i_prof_chla]))
}
