library(data.table)
gbodata <- fread('./Downloads/Time Survey.csv')
subregion <- data.frame(sub_region = c('AUNZ','AUNZ','GRCN','GRCN','GRCN','IN','JP','KR','SEA','SEA','SEA','SEA','SEA','SEA','SEA'), service_country = c('AU','NZ','CN','HK','TW','IN','JP','KR','ID','MY','PH','PK','TH','SG','VN'), stringsAsFactors = FALSE)
gbodatamodified <- merge(gbodata, subregion, by.x="country",by.y = "service_country", all.x=TRUE)
common_cols <- names(gbodata[,1:13, with = FALSE])
common_cols <- c(common_cols[1:6],'sub_region',common_cols[7:13])
gbodatamodified[,c(common_cols)]
firstlvldata_colnames <- names(gbodatamodified[, .SD, .SDcols = names(gbodatamodified) %like% "first_level_time_"])
firstlvldataretro_colnames <- names(gbodatamodified[, .SD, .SDcols = names(gbodatamodified) %like% "first_level_time_" & names(gbodatamodified) %like% "_retrofitted"])
nonretro_cols_to_delete <-gsub('_retrofitted','',firstlvldataretro_colnames)
gbodatamodified[,c(nonretro_cols_to_delete):=NULL]



