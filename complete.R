complete <- function(directory, id = 1:332) {    
  dir = paste(getwd(),"/",directory,"/",sep="")
  df = data.frame(row.names = c("id","nobs"))
  #writeLines("##\t\t\tid\tnobs")
  x = 1L  
  for(i in id) {        
    #disp = paste("##"," ",x,sep="")
    y = 0L
    a = i
    while(a >= 10) {
      a = a / 10
      y = y + 1
    }
    y = 3 - y
    for(j in 1:y) {
      #disp = paste(disp,"\t",sep="")
    }
    #disp = paste(disp,i,sep="")
          
    if(i < 10) {
      file = paste("00",i,".csv",sep="")
    }
    else if(i < 100) {
      file = paste("0",i,".csv",sep="")
    }
    else {
      file = paste(i,".csv",sep="")
    }
    table = read.csv(paste(dir,file,sep=""),header=TRUE)    
    temp = complete.cases(table)          
    table = table$nitrate[temp]
    nobs = length(table)
    df = rbind(df, c(i,nobs))
    y = 0L
    a = nobs
    while(a >= 10) {
      a = a / 10
      y = y + 1
    }
    y = 4 - y
    for(j in 1:y) {
      #disp = paste(disp,"\t",sep="")
    }
    #disp = paste(disp,nobs,sep="")
    
    x = x + 1    
    #writeLines(disp)
  }  
  colnames(df) = c("id","nobs")
  complete = df
}