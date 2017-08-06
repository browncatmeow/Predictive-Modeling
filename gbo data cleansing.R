library(data.table)
gbodata <- fread('/Users/wt/Downloads/Time Survey.csv’)

firstlvldata <- gbodata[, .SD, .SDcols = names(gbodata) %like% "first_level_time_"]

firstlvldataretro <- grep('retrofitted',names(firstlvldata),value=TRUE)

rlvt_nonretro_cols <- gsub("_retrofitted","", firstlvldataretro)

firstlvldata[,c(rlvt_nonretro_cols):=NULL]
