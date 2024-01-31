# setup
library(readxl)
library(kableExtra)
library(magrittr)
library(stringr)
library(dplyr)
library(reactable)
library(purrr)

medium = 4
large = 8
column_width <- function(kable_input,column,width=1,units=4) {
  #' Wrapper of column_spec to adjust a column width in em units
  #' @param column Index of column to adjust
  #' @param width Multiplier
  #' @param units How many ems is 1 unit?
  column_spec(kable_input,column,width=paste0(as.character(units * width),"em"))
}

reactable2 <- function(x,striped=T,searchable=T,filterable=T,pagination=F,sortNALast=T,...) {
  #' Set new defaults for reactable

  reactable(x,
            defaultColDef=colDef(
              minWidth=35,
              align='left',
              sortNALast=sortNALast
            ),
            striped=striped,
            searchable=searchable,
            filterable=filterable,
            pagination=pagination,
            ...)
}

kable2 <- function(x,widths="default",...) {
  #' Set new defaults for kable
  #' @param widths Custom width styles
  #' @calls column_width

  tb <- knitr::kable(x,
                     align = 'l',
                     booktabs = TRUE,
                     ...) %>%
    kableExtra::kable_styling(latex_options="striped")

  if (widths=="twocolumn") {
    tb <- tb %>%
      column_width(1) %>%
      column_width(2, width = large)
  }

  return(tb)
}

read_table <- function(fp,sheet) {
  #' Read in a table and wrap long file names
  #' @param fp File path where the table is stored
  #' @param sheet Sheet of the Excel where the table is stored

  tb <- read_excel(fp,sheet=sheet)

  if ("File Name" %in% names(tb)) {
    tb[,"File Name"] <- unlist(map(tb[,"File Name"],
                                   # find at least 6 underscore-separated phrases
                                   ~gsub("((.*_){6,})((.*_){2,})",
                                         # force wrapped string
                                         "\\1\n\\3",
                                         .)))
  }

  if (any(grepl("Rate",names(tb)))) {
    nm <- names(tb)[grepl("Rate",names(tb))]
    tb[,nm] <- unlist(map(tb[,nm],
                          # make into percentage
                          ~paste0(round(.*100,1),"%")))
  }

  return(tb)
}
