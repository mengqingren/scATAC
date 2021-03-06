dat <- read.table("Demultiplex_check.out")
dat
head(dat)
hist(dat[,1])
hist(log2(dat[,1]))
hist(log(dat[,1])/log(10))
hist(log(dat[,1])/log(10), col="grey65")
hist(log(dat[,1])/log(10), col="grey65", xlab="Reads/Well (log10)", main="")
png("Demultiplex_check.png", width=5, height=5, units="in", res=300)
hist(log(dat[,1])/log(10), col="grey65", xlab="Reads/Well (log10)", main="")
dev.off()
savehistory("check.R")
