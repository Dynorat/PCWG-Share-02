ExpandErrorByWSDF <-function(df.in,
                             sheets){
  # create empty DF
  df.out <- data.frame(correction = factor(x=character(),
                                           levels = sheets),
                       x.min = double(),
                       x.max = double(),
                       data.count = double(),
                       error.name = factor(x=character(),
                                           levels = c("NME","NMAE")),
                       error.val = double(),
                       stringsAsFactors=FALSE)
  df.out <-rbind(df.out,
                 data.frame(correction = factor(x=df.in$sheet.name,
                                                levels = sheets),
                            CSVToRange(df.in$bin),
                            data.count = CSVToNumericVector(df.in$data.count),
                            error.name = "NME",
                            error.val = CSVToNumericVector(df.in$NME),
                            stringsAsFactors=FALSE),
                 data.frame(correction = factor(x=df.in$sheet.name,
                                                levels = sheets),
                            CSVToRange(df.in$bin),
                            data.count = CSVToNumericVector(df.in$data.count),
                            error.name = "NMAE",
                            error.val = CSVToNumericVector(df.in$NMAE),
                            stringsAsFactors=FALSE))
  
  # convert errrors into percentages
  df.out$error.val.pc <- df.out$error.val * 100
  
  return(df.out) 
}