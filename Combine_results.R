###R script to combine results of analyses into a table

graphics.off() 
colors <- c("brown","black","black","black","black","black","black",
            "green","green","green","green",
            "red","red","red","red",
            "blue","blue","blue","blue","blue","blue"
)

bf<-data.frame(V1=seq(-29.9,130.1, by =0.5),stringsAsFactors=F)
temp1<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
temp1$V2<-round(temp1$V1, 1) 

head<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
head$V2<-round(head$V1, 1) 

tail<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
tail$V2<-round(tail$V1, 1) 

temp2<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
t
)

bf<-data.frame(V1=seq(-29.9,130.1, by =0.5),stringsAsFactors=F)
temp1<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
temp1$V2<-round(temp1$V1, 1) 

head<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
head$V2<-round(head$V1, 1) 

tail<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
tail$V2<-round(tail$V1, 1) 

temp2<-data.frame(bf,V2=rep(NA,length(bf[,1]),stringsAsFactors=F))
temp2$V2<-round(temp2$V1, 1) 
analyses<-data.frame(V1=seq(1,30, by =1),stringsAsFactors=F)


range1<-data.frame(V1=seq(0.1,180.1, by =0.5),stringsAsFactors=F)
combLength<-data.frame(range1,V2=rep(NA,length(range1[,1]),stringsAsFactors=F))
combHead<-data.frame(range1,V2=rep(NA, length(range1[,1]),stringsAsFactors=F))
combTail<-data.frame(range1,V2=rep(NA,length(range1[,1]),stringsAsFactors=F))
combHead
aDeclineSlope<-data.frame(stringsAsFactors=F)
aRaiseSlope<-data.frame(stringsAsFactors=F)

my.path <- list("z1.txt","z2.txt","z3.txt","z4.txt","z5.txt","z6.txt","z7.txt","z8.txt","z9.txt","z10.txt",
                "z11.txt","z12.txt","z13.txt","z14.txt","z15.txt","z16.txt","z17.txt","z18.txt","z19.txt","z20.txt")

my.data <- list()
for (z in 1:length(my.path)){
  my.data[[z]] <- read.delim(my.path[[z]],header=F,stringsAsFactors=F)

  kk1<-my.data[[z]]
 s= z+1
 s1=z+2
  for (i in 1:length(range1[,1])){
    combLength[i,s] = kk1[i,7]
    combHead[i,s]=kk1[i,10]
    combTail[i,s]=kk1[i,11]
    
  }

 'Relative minLength'
 analyses[z,2]<-kk1[10,9]
 'A' 
 analyses[z,3]<-kk1[23,9]
 'B' 
 analyses[z,4]<-kk1[24,9]
 'C' 
 analyses[z,5]<-kk1[25,9]
 'D' 
 analyses[z,6]<-kk1[26,9]
 'Initial length in pixels' 
 analyses[z,7]<-kk1[12,9]
 'Blue fluor index'
 analyses[z,8] <- kk1[7,9]
 'Min length index'
 analyses[z,9] <- kk1[8,9]
 'Head index'
 analyses[z,10] <- kk1[28,9]
 'Tail index'
 analyses[z,11] <- kk1[29,9]
'Maximal decrease for 3 min'
 analyses[z,12] <- kk1[32,9]
 'Maximal increase for 3 min'
 analyses[z,13] <- kk1[39,9]
 
'Blue fluorescence normalized - Length'
for(i in 1:length(temp1[,1])){
  for(k in 1:length(kk1[,1])){
          if(temp1[i,2]==kk1[k,13]){
      temp1[i,s1]=kk1[k,7]
        
    }
    else{
    }
  }
}    

'Blue fluorescence normalized - Head'
for(i in 1:length(head[,1])){
  for(k in 1:length(kk1[,1])){
    if(head[i,2]==kk1[k,13]){
      head[i,s1]=kk1[k,10]
      
    }
    else{
    }
  }
}    

'Blue fluorescence normalized - Tail'
for(i in 1:length(tail[,1])){
  for(k in 1:length(kk1[,1])){
    if(tail[i,2]==kk1[k,13]){
      tail[i,s1]=kk1[k,11]
      
    }
    else{
    }
  }
}    

'min Length normalized'
for(i in 1:length(temp2[,1])){
  for(k in 1:length(kk1[,1])){
    if(temp2[i,2]==kk1[k,12]){
      temp2[i,s1]=kk1[k,7]
    }
    else{
    }
  }
}    

'
for (h in 1:15){
  p =h
  n =h+17
  m =h+32
  aDeclineSlope[n,z]=kk1[h,13]
  aRaiseSlope[n,z]=kk1[h,16]
  aDeclineSlope[m,z]=kk1[h,14]
  aRaiseSlope[m,z]=kk1[h,17]
  aDeclineSlope[p,z]=kk1[h,15]
  aRaiseSlope[p,z]=kk1[h,18]
  
}'
}

write.table(analyses, "analyses.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)
write.table(combLength, "combLength.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)
write.table(combHead, "combHead.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)
write.table(combTail, "combTail.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)    
write.table(temp1, "bf.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE) 
write.table(temp2, "mn.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE) 
'write.table(aDeclineSlope, "aDeclineSlope.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)
write.table(aRaiseSlope, "aRaiseSlope.txt", sep = "\t", eol = "\n", row.names = FALSE, col.names = FALSE)'

png("combLength.png")
plot(combLength[,1],combLength[,2], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(0, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+1
lines(combLength[,1],combLength[,t], col = colors[t])
title(main = "Length")
}
png(file = "combLength.png")
dev.off()
graphics.off() 


png("combHead.png")
plot(combHead[,1],combHead[,2], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(0, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+1
  lines(combHead[,1],combHead[,t], col = colors[t])
  title(main = "Head")
}
png(file = "combHead.png")
dev.off()
graphics.off() 

png("combTail.png")
plot(combTail[,1],combTail[,2], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(0, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+1
  lines(combHead[,1],combHead[,t], col = colors[t])
  title(main = "Tail")
}
png(file = "combTail.png")
dev.off()
graphics.off() 

png("bf.png")
plot(temp1[,2],temp1[,3], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(-30, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+2
  t1=t-1
  lines(temp1[,1],temp1[,t], col = colors[t1])
  title(main = "BF start normalized")
}
png(file = "bf.png")
dev.off()
graphics.off() 

png("bf_head.png")
plot(head[,2],head[,3], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(-30, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+2
  t1=t-1
  lines(head[,1],head[,t], col = colors[t1])
  title(main = "BF start normalized _ head")
}
png(file = "bf_head.png")
dev.off()
graphics.off() 

png("bf_tail.png")
plot(tail[,2],tail[,3], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(-30, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+2
  t1=t-1
  lines(tail[,1],tail[,t], col = colors[t1])
  title(main = "BF start normalized _ tail")
}
png(file = "bf_tail.png")
dev.off()
graphics.off() 


png("ml.png")
plot(temp2[,2],temp2[,3], type="n", xlab = "Time, min", ylab = "%, initial length", xlim=c(-30, 160), ylim=c(0, 1.3))
for (aaa in 1:length(my.path)){
  t=aaa+2
  t1=t-1
  lines(temp2[,1],temp2[,t], col = colors[t1])
  title(main = "min Length start normalized")
}
png(file = "ml.png")
dev.off()
graphics.off() 