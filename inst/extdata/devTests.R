#..........................
# Check with releases of GCAM
#..........................
library(gcamextractor);library(dplyr); library(rgcam)

# List of params in gcamextractor
params <- gcamextractor::params; params

# Check
# rgcam::localDBConn("C:/gcam/gcam-v6.0-Windows-Release-Package/output/","database_basexdb")

paramsSelect_i=(gcamextractor::map_param_query %>% dplyr::filter(group=="diagnostic"))$param; paramsSelect_i
length(paramsSelect_i)

# GCAM 6.0
data <- readgcam(gcamdatabase = "C:/gcam/gcam-v6.0-Windows-Release-Package/output/database_basexdb",
                 folder = "test_gcamv6p0",
                 paramsSelect = "All",
                 saveData = F)
# GCAM 5.4
data <- readgcam(gcamdatabase = "C:/gcam/gcam-v5.4-Windows-Release-Package/output/database_basexdb",
                 folder = "test_gcamv5p4",
                 paramsSelect = paramsSelect_i[23],
                 saveData = F)

#..........................
# EXAMPLE FOR DOCS - gcamextractor - rchart - rmap
#..........................
library(gcamextractor); library(rmap); library(rchart)

# List of params in gcamextractor
params <- gcamextractor::params; params

# Extract Data
data <- readgcam(gcamdatabase = "C:/gcam/gcam_v5p3_seasia/output/database_basexdb_seasia_breakout_cities_OFF",
                 paramsSelect = c("pop","elecByTechTWh"),
                 folder = "test_folder")

# View extracted data
names(data)
head(data$dataAggParam)
head(data$dataAggClass1)

# Filter population data to specific countries and years
data_chart <- data$dataAggClass1 %>%
                dplyr::filter(subRegion %in% c("Argentina", "Colombia"))

# Plot data with rchart
charts <- rchart::chart(data_chart)


# Prep Data
data_map <- data$dataAggClass1 %>%
  dplyr::filter(x %in% c("2015"))

# Plot with rmap
maps <- rmap::map(data_map,
                  underLayer = rmap::mapCountries,
                  background = T)


#----------------------
# Test Proj file
#----------------------

library(gcamextractor); library(rmap); library(rchart)
df <- gcamextractor::readgcam(dataProjFile = gcamextractor::example_gcamv54_argentina_colombia_2025_proj)


#----------------------
# Test Proj file
#----------------------
library(gcamextractor); library(rmap); library(rchart)

data <- readgcam(gcamdatabase = "C:/gcam/gcam-v5.4-Windows-Release-Package/output/database_basexdb",
                 paramsSelect = c("watWithdrawBySec"),
                 folder = "example_gcam_annual_2022")


data$dataAggClass1$class%>%unique()
data_map <- data$dataAggClass1 %>%
  dplyr::filter(x %in% c(2015))

maps <- rmap::map(data_map%>%filter(param=="elecByTechTWh"))


#----------------------
# CERF Debug
#----------------------

library(gcamextractor); library(dplyr)

# List of params in gcamextractor
params <- gcamextractor::params; params

#gcamdatabase_i = "C:/Z/models/GCAMVersions/gcam-usa-im3/output/database_SSP5"
#gcamdata_folder_i = "C:/Z/models/GCAMVersions/gcam-usa-im3/input/gcamdata"
#rgcam::localDBConn("C:/Z/models/GCAMVersions/gcam-usa-im3/output","database_SSP5")
gcamdatabase_i = "/Users/thur961/godeeep/gcam-central-net-zero/output/database_basexdb"
gcamdata_folder_i = "/Users/thur961/godeeep/gcam-central-net-zero/GCAMUSA_GODEEEP/input/gcamdata"
rgcam::localDBConn("/Users/thur961/godeeep/gcam-central-net-zero/output","database_basexdb")
reReadData_i = F
#dataProjFile_i = "C:/Z/models/gcamextractor/cerf/dataProj_cerf.proj"
dataProjFile_i = 'dataProj-cerf-godeeep.proj'
regionsSelect_i = c("United States")
paramsSelect_i = c("cerf")
folder_i="cerf-godeeep"

dataGCAM <- readgcam(reReadData = reReadData_i,
                     gcamdatabase = gcamdatabase_i,
                     gcamdata_folder = gcamdata_folder_i,
                     dataProjFile = dataProjFile_i,
                     regionsSelect = regionsSelect_i,
                     paramsSelect = paramsSelect_i,
                     folder = folder_i)

reReadData = reReadData_i
reReadData = F
gcamdatabase = gcamdatabase_i
gcamdata_folder = gcamdata_folder_i
dataProjFile = dataProjFile_i
regionsSelect = regionsSelect_i
paramsSelect = paramsSelect_i
folder = folder_i
queryFile=NULL
scenOrigNames = "All"
scenNewNames = NULL


# List of params in gcamextractor for GO
params <- gcamextractor::data_params; params

gcamdatabase_i = "C:/Z/models/GCAMVersions/gcam-usa-im3/output/database_SSP5"
rgcam::localDBConn("C:/Z/models/GCAMVersions/gcam-usa-im3/output","database_SSP5")
reReadData_i = F
dataProjFile_i = "dataProj_go.proj"
regionsSelect_i = NULL
paramsSelect_i = "go"
folder_i="go"

dataGCAM <- readgcam(reReadData = reReadData_i,
                     gcamdatabase = gcamdatabase_i,
                     dataProjFile = dataProjFile_i,
                     regionsSelect = regionsSelect_i,
                     paramsSelect = paramsSelect_i,
                     folder = folder_i)

reReadData = reReadData_i
reReadData = F
gcamdatabase = gcamdatabase_i
gcamdata_folder = gcamdata_folder_i
dataProjFile = dataProjFile_i
regionsSelect = regionsSelect_i
paramsSelect = paramsSelect_i
folder = folder_i
queryFile=NULL

# Test "emissNonCO2BySector"
params <- gcamextractor::data_params; params

gcamdatabase_i = "C:/Z/models/GCAMVersions/gcam-usa-im3/output/database_SSP5"
rgcam::localDBConn("C:/Z/models/GCAMVersions/gcam-usa-im3/output","database_SSP5")
reReadData_i = T
dataProjFile_i = "dataProj_testNonCO2"
regionsSelect_i = NULL
paramsSelect_i = "emissNonCO2BySector"
folder_i="testNonCO2"


dataGCAM <- readgcam(reReadData = reReadData_i,
                     maxMemory = "2g",
                     gcamdatabase = gcamdatabase_i,
                     dataProjFile = dataProjFile_i,
                     regionsSelect = regionsSelect_i,
                     paramsSelect = paramsSelect_i,
                     folder = folder_i)

(dataGCAM$dataAll %>% dplyr::filter(param=="emissNonCO2BySector"))$subRegion%>%unique()



dataProj.proj <- rgcam::addScenario(conn = rgcam::localDBConn("C:/Z/models/GCAMVersions/gcam-usa-im3/output",
                                                              "database_SSP5",
                                                              migabble = T,
                                                              maxMemory = "1g"),
                                    proj = gsub("//","/",paste(getwd(), "/", "dataProj.proj", sep = "")),
                                    scenario = "SSP5",
                                    queryFile = gsub("//","/",paste("C:/Z/models/gcamextractor/testNonCO2",
                                                                    "/subSetQueries.xml", sep = "")))

dataProjLoaded <- rgcam::loadProject(gsub("//","/",paste(getwd(), "/", "dataProj.proj", sep = "")))


# Check For PIC

rgcam::localDBConn( "/pic/projects/im3/gcamusa/gcam-usa-im3/output/",
                    "database_Ref_RCP8p5_NORESM_5trail_delta_applied2015",
                   migabble = T,
                   maxMemory = "8g")

dataProj.proj <- rgcam::addScenario(conn = rgcam::localDBConn("/pic/projects/im3/gcamusa/gcam-usa-im3/output/",
                                                              "database_Ref_RCP8p5_NORESM_5trail_delta_applied2015",
                                                              migabble = T,
                                                              maxMemory = "8g"),
                                    proj = gsub("//","/",paste(getwd(), "/", "dataProj.proj", sep = "")),
                                    scenario = "Ref_RCP8p5_NORESM_5trail_delta_applied2015",
                                    queryFile = gsub("//","/",paste("/pic/projects/im3/gcamusa/diagnostics/outputs_runoff_GCMs_5trail_delta",
                                                                    "/subSetQueries.xml", sep = "")))

dataProjLoaded <- rgcam::loadProject(gsub("//","/",paste(getwd(), "/", "dataProj.proj", sep = "")))

# Check for Yang Ou db
library(gcamextractor)
gcamdatabase_i = "C:/Z/models/tests/database_basexdb"
rgcam::localDBConn("C:/Z/models/tests","database_basexdb")
reReadData_i = T
dataProjFile_i = "dataProj_yang_test.proj"
regionsSelect_i = NULL
paramsSelect_i = c("electricity")
folder_i="yang_test"

dataGCAM <- readgcam(reReadData = reReadData_i,
                     gcamdatabase = gcamdatabase_i,
                     dataProjFile = dataProjFile_i,
                     regionsSelect = regionsSelect_i,
                     paramsSelect = paramsSelect_i,
                     folder = folder_i)

# Check for im3
library(gcamextractor)
library(dplyr)
gcamdatabase_i = "/Users/thur961/godeeep/gcam-central-net-zero/output/database_basexdb"
gcamdata_folder_i = "/Users/thur961/godeeep/gcam-central-net-zero/GCAMUSA_GODEEEP/input/gcamdata"
rgcam::localDBConn("/Users/thur961/godeeep/gcam-central-net-zero/output","database_basexdb")
reReadData_i = T
dataProjFile_i = "dataProj_cerf.proj"
regionsSelect_i = c("United States")
paramsSelect_i = c("cerf")
folder_i="cerf-godeeep"

dataGCAM <- gcamextractor::readgcam(reReadData = reReadData_i,
                     gcamdatabase = gcamdatabase_i,
                     gcamdata_folder = gcamdata_folder_i,
                     dataProjFile = dataProjFile_i,
                     regionsSelect = regionsSelect_i,
                     paramsSelect = paramsSelect_i,
                     folder = folder_i)


# reReadData = T
# gcamdatabase = gcamdatabase_i
# gcamdata_folder = gcamdata_folder_i
# dataProjFile = dataProjFile_i
# regionsSelect = regionsSelect_i
# paramsSelect = paramsSelect_i
# folder = folder_i
# queryFile=NULL
# scenOrigNames = "All"
# scenNewNames = NULL





