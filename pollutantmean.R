pollutantmean <- function(directory, pollutant, id = 1:332) {
  df <- data.frame(row.names = cbind("Date","sulfate","nitrate","ID"))  
  for (i in id) {
    dir = ""
    dir = paste(getwd(),directory,sep="/")
    if (i < 10) {      
      dir = paste(dir,"/00",i,".csv",sep="")
      table = read.csv(dir, header=TRUE)
    }
    else if (i < 100) {            
      dir = paste(dir,"/0",i,".csv",sep="")
      table = read.csv(dir, header=TRUE)
    }
      
    else {      
      dir = paste(dir,"/",i,".csv",sep="")
      table = read.csv(dir, header=TRUE)
    }      
    df = rbind(df, table)
  }
  if(pollutant != "nitrate" && pollutant != "sulfate") {    
    print("incorrect element")
    pollutemean = NULL
  }    
  else{
    pollutemean = mean(df[[pollutant]], na.rm = TRUE)    
  }
  print(sprintf("%.3f",pollutemean))
}