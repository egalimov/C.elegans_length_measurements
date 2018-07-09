##‘R script to analyse changes in body length in worms killed with tBOOH

graphics.off()
saveplot <- c("g1.png","g2.png","g3.png","g4.png","g5.png","g6.png","g7.png","g8.png","g9.png","g10.png",
              "g11.png","g12.png","g13.png","g14.png","g15.png","g16.png","g17.png","g18.png","g19.png","g20.png") 

savetable <- c("z1.txt","z2.txt","z3.txt","z4.txt","z5.txt","z6.txt","z7.txt","z8.txt","z9.txt","z10.txt",
               "z11.txt","z12.txt","z13.txt","z14.txt","z15.txt","z16.txt","z17.txt","z18.txt","z19.txt","z20.txt") 

my.path <- list("d1.txt", "d2.txt", "d3.txt", "d4.txt", "d5.txt", "d6.txt", "d7.txt", "d8.txt", "d9.txt", "d10.txt", 
                "d11.txt", "d12.txt", "d13.txt", "d14.txt", "d15.txt", "d16.txt", "d17.txt", "d18.txt", "d19.txt","d20.txt")  

my.data <- list()
for (z in 1:length(my.path)){
  my.data[[z]] <- read.delim(my.path[[z]],header=F,stringsAsFactors=F)
  mm1<-my.data[[z]]
  range<-data.frame(V1=seq(1,nrow(mm1), by =5),stringsAsFactors=F)
  
  qq1<-data.frame(range,V2=rep(NA,length(range[,1]),stringsAsFactors=F))
  'time/10'
  qq1$V2 <- qq1$V1/10

  for(i in 1:length(range[,1])){
    for(k in 1:length(mm1[,1])){
      if(range[i,1]==mm1[k,1]){
        qq1[i,3]=mm1[k,2]
        qq1[i,4]=mm1[k,3]
        qq1[i,5]=mm1[k,4]
      }
      else{
      }
    }
  }        
  
  'length of a worm'
  qq1$V6 <- qq1$V4 - qq1$V3  
  'relative length of a worm'
  qq1$V7 <- qq1$V6/qq1[1,6]    
  'relative for fluorescence'
  qq1$V8 <- qq1$V5/qq1[1,6]   
  'analyses data'
  qq1[1,9] <- min(qq1$V3)     
  qq1[2,9] <- max(qq1$V3)
  qq1[3,9] <- qq1[2,9] - qq1[1,9]
  qq1[4,9] <- min(qq1$V4)
  qq1[5,9] <- max(qq1$V4)
  qq1[6,9] <- qq1[5,9] - qq1[4,9]
  'index nachalo Blue Fluor '
  qq1[7,9] <- qq1[min(which(qq1$V5>0)),2]
  'index for min Length'
  qq1[8,9] <- qq1[which.min(qq1$V6),2]
  'Head'
  qq1$V10 <- (qq1$V4-qq1[4,9])/qq1[6,9]
  'Tail'
  qq1$V11 <- (qq1[2,9]-qq1$V3)/qq1[3,9]
  'Relative minLength'
  qq1[10,9] <- min(qq1$V7)
  'Initial length in pixels'
  qq1[12,9] <- qq1[1,6]
  'X Normalized for minLengtqqh'
  qq1$V12 <- qq1$V2 - qq1[8,9] + 0.1
  'X Normalized for Blue Fluor start'
  qq1$V13 <- qq1$V2 - qq1[7,9] + 0.1
  'Index head min'
  qq1[28,9] <- qq1[which.min(qq1$V10),2]
  'Index tail min'
  qq1[29,9] <- qq1[which.min(qq1$V11),2]
  
  bx <- which.min(qq1$V7)
  
  'index for min LENGTH'
  qq1[17,9] <- qq1[bx,2]
  qq1[18,9] <- qq1[bx,7]
  
  '1_A_0.5_of A'
  for (uu1 in 1:length(qq1[,1])){
    if(qq1[uu1,2]<qq1[17,9]){
      qq1[uu1,14]=qq1[uu1,7]}
    else{
      qq1[uu1,14]=10}
  }
  ax <- 1-((1 - qq1[18,9])/2)
  ww <- which.min(abs(qq1$V14 - ax)) 
  
  'ax <- 1-((1 - qq1[18,9])/2)
  ww <- which.min(qq1$V7 > ax)'
  qq1[14,9] <- qq1[ww,2]
  qq1[15,9] <- qq1[ww,7]
  
  '2_D_0.5_of D'
  cx <- qq1[203,7]-((qq1[203,7]-qq1[18,9])/2)
  for (uu in 1:length(qq1[,1])){
    if(qq1[uu,2]>qq1[17,9]){
      qq1[uu,15]=qq1[uu,7]}
    else{
      qq1[uu,15]=10}
  }
  ww2 <- which.min(abs(qq1$V15 - cx)) 
  'ww2 <- which(qq1$V14 < cx)
  ww3 <- max(ww2)'
  qq1[20,9] <- qq1[ww2,2]
  qq1[21,9] <- qq1[ww2,7]
  
  'A'
  qq1[23,9] <- qq1[1,7]-qq1[18,9]
  'B'
  qq1[24,9] <- (qq1[18,9]-qq1[15,9])/(qq1[17,9]-qq1[14,9])
  'C'
  qq1[25,9] <- (qq1[21,9]-qq1[18,9])/(qq1[20,9]-qq1[17,9])
  'D'
  qq1[26,9] <- (qq1[21,9]-qq1[18,9])*2
  
 
 for (u3 in 1:length(qq1[,1])){
   if(u3>190){
     qq1[u3,16]=0}
   else{
     qq1[u3,16]=qq1[u3+6,7]-qq1[u3,7]}
 }
   
  maxCD <- which.min(qq1$V16)
  qq1[31,9] <- maxCD
  qq1[32,9] <- min(qq1$V16)/3
  qq1[33,9] <- qq1[maxCD,2]
  qq1[34,9] <- qq1[maxCD,7]
  qq1[35,9] <- qq1[maxCD+6,2]
  qq1[36,9] <- qq1[maxCD+6,7]
 
  maxCU <- which.max(qq1$V16)
  qq1[38,9] <- maxCU
  qq1[39,9] <- max(qq1$V16)/3
  qq1[40,9] <- qq1[maxCU,2]
  qq1[41,9] <- qq1[maxCU,7]
  qq1[42,9] <- qq1[maxCU+6,2]
  qq1[43,9] <- qq1[maxCU+6,7]
   
   
for (i in 1:3){
    if(mm1[i,8]>0){
      qq1[i,14]=mm1[i,8]
      qq1[i,15]=mm1[i,9]
      qq1[i,17]=mm1[i,10]
    }
    if(mm1[i,11]>0){
      qq1[i,18]=mm1[i,11]
      qq1[i,19]=mm1[i,12]
      qq1[i,20]=mm1[i,13]
    }
  }
  write.table(qq1, savetable[z], sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)
  
  png(saveplot[z])
  plot(qq1[,2],qq1[,6], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(0, 130), ylim=c(0, 1.3))
  lines(qq1[,2],qq1[,7], col = "black", lwd=3)
  lines(qq1[,2],qq1[,8], col = "blue")
  lines(qq1[,2],qq1[,10], col = "brown")
  lines(qq1[,2],qq1[,11], col = "green")
  segments(qq1[14,9], qq1[15,9], qq1[17,9], qq1[18,9], col= 'red')
  segments(qq1[17,9], qq1[18,9], qq1[20,9], qq1[21,9], col= 'red')
  segments(qq1[33,9], qq1[34,9], qq1[35,9], qq1[36,9], col= 'orange')
  segments(qq1[40,9], qq1[41,9], qq1[42,9], qq1[43,9], col= 'orange')
  title(main = z)
  legend("bottomright", pch = c(15, 15, 15, 15), 
         col = c("black","blue", "brown", "green", "red"), 
         legend = c("Length", "Blue Fluor", "Head", "Tail", "Approx."))
  legend("bottom", legend = c(qq1[24,9],qq1[25,9]))
  png(file = saveplot[z])
  dev.off()
}
graphics.off()

