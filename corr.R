corr <- function(directory, threshold = 0L) {
  original = getwd()
  setwd(paste(getwd(),directory,sep="/"))
  fileDir = list.files()
  dataset = data.frame(row.names = cbind("sulfate","nitrate"))  
  cols = c("sulfate","nitrate")
  correlation = c()  
  for(file in fileDir) {
    temp = read.csv(file, header = TRUE)
    temp = temp[cols]
    temp = na.omit(temp)
    if(nrow(temp) > threshold) {
        correlation = c(correlation, cor(temp$sulfate, temp$nitrate))
    }
  }  
  setwd(original)
  corr = correlation
}