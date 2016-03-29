############################################################################################
# Routine developpee par C. Schmechtig 
# To read metadata file
#
# March 2016 : Read Coriolis Metadata file 
#############################################################################################

library(ncdf)

# nc File
file_in_metadata="../DATA/6901032_meta.nc"

# Open nc File
nc_file=open.ncdf(file_in_metadata,readunlim=FALSE)

################################################################
### We get lists
################################################################
# Get the list of the sensors
SENSOR=get.var.ncdf(nc_file,"SENSOR")

# Get the SN of the sensors
SENSOR_SERIAL_NO=get.var.ncdf(nc_file,"SENSOR_SERIAL_NO")

# Get the list of the PARAMETERS
PARAMETER=get.var.ncdf(nc_file,"PARAMETER")

# Get the PREDEPLOYMENT CALIB EQUATION
PREDEPLOYMENT_CALIB_EQUATION=get.var.ncdf(nc_file,"PREDEPLOYMENT_CALIB_EQUATION")

# Get the PREDEPLOYMENT CALIB COEFFICIENT
PREDEPLOYMENT_CALIB_COEFFICIENT=get.var.ncdf(nc_file,"PREDEPLOYMENT_CALIB_COEFFICIENT")

# Get the PREDEPLOYMENT CALIB COMMENT
PREDEPLOYMENT_CALIB_COMMENT=get.var.ncdf(nc_file,"PREDEPLOYMENT_CALIB_COMMENT")

######################################################################
### We get specific information for a specific parameter
### Here CHLA
######################################################################

# Get the Index of the ECO3 sensor
id_SENSOR_ECO3=which(SENSOR=="FLUOROMETER_CHLA                ")

# Get the SN of the ECO3 sensor
SENSOR_SERIAL_NO_ECO3=SENSOR_SERIAL_NO[id_SENSOR_ECO3]

# Get the Index of the CHLA PARAMETER
id_PARAMETER_CHLA=which(PARAMETER=="CHLA                                                            ")

# Get the calibration equation for the CHLA
PREDEPLOYMENT_CALIB_EQUATION_CHLA=PREDEPLOYMENT_CALIB_EQUATION[id_PARAMETER_CHLA]

# Get the calibration coefficient for the CHLA
PREDEPLOYMENT_CALIB_COEFFICIENT_CHLA=PREDEPLOYMENT_CALIB_COEFFICIENT[id_PARAMETER_CHLA]

# Get the calibration COMMENT for the CHLA
PREDEPLOYMENT_CALIB_COMMENT_CHLA=PREDEPLOYMENT_CALIB_COMMENT[id_PARAMETER_CHLA]


