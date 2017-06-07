### If you use Linux, its important install XML y RCurl.
### How? Run this code in console.
####sudo apt-get install libcurl4-openssl-dev
####sudo apt-get install libxml2-dev

# If you can't. Try installing:
#* deb: libssl-dev (Debian, Ubuntu, etc)
#* rpm: openssl-devel (Fedora, CentOS, RHEL)
#* csw: libssl_dev (Solaris)
#* brew: openssl@1.1 (Mac OSX)

install.packages("taxize") ## Install the package 'Taxize'.

#also installing the dependencies ‘openssl’, ‘rentrez’, 
#‘solrium’, ‘httr’, ‘bold’, ‘rotl’, ‘ritis’, 'httr', 
# 'xml2', ' rredlist', 'worrms', 'natserv'.

library(taxize)

### A little example to check that Taxize was well installed and works perfectly.
database<-gnr_datasources() ##All the database to use.
names_resolved <- gnr_resolve(names = c("Speothos venaticus", "Pteuronura brasilensis", "Panthera tigres"), canonical= TRUE) ## Save the corrected names with all databases in the vector 'names_resolved'.
names_resolved_GBIF <- gnr_resolve(names = c("Speothos venaticus", "Pteuronura brasilensis", "Panthera tigres"), canonical= TRUE, data_source_ids = 11) ##Save the corrected names only with the database GBIF in the vector 'names_resolved_GBIF'.

#### Other example with more nomes of species.
Database <- read.csv("~/Database.csv")#Upload the file.
sp<-as.data.frame(Database) 
sp_resolved_GBIF <- gnr_resolve(sp, canonical= FALSE, data_source_ids = 11) #Save the corrected names only with the database GBIF in the vector 'sp_resolved_GBIF'.
sp_resolved <- gnr_resolve(sp, canonical= FALSE) ###### Save the corrected names with all databases in the vector 'sp_resolved'.

out_file <- write.csv(sp_resolved_GBIF, file = "datanew.csv")
