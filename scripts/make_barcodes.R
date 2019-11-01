dat <- read.table("barcode_info.csv", header=F, sep=",")
require(Biostrings)
dna <- DNAStringSet(dat[,3])
comp <- complement(dna)
dat$comp <- as.vector(matrix(comp))
require("stringi")
dat$rev_comp <- stri_reverse(dat$comp)

possible <- expand.grid(dat[1:24,3], dat[25:40,3])
barcodes1 <- paste(possible[,1], "+", possible[,2], sep="")
barcodes2 <- paste(possible[,2], "+", possible[,1], sep="")
write.table(barcodes1, file="possible_barcodes1.txt", col.names=F, row.names=F, quote=F)
write.table(barcodes2, file="possible_barcodes2.txt", col.names=F, row.names=F, quote=F)

possible <- expand.grid(dat[1:24,"rev_comp"], dat[25:40,"rev_comp"])
barcodes1 <- paste(possible[,1], "+", possible[,2], sep="")
barcodes2 <- paste(possible[,2], "+", possible[,1], sep="")
write.table(barcodes1, file="possible_barcodes3.txt", col.names=F, row.names=F, quote=F) # This is correct
write.table(barcodes2, file="possible_barcodes4.txt", col.names=F, row.names=F, quote=F)

# barcode2well
possible <- expand.grid(dat[1:24,"rev_comp"], dat[25:40,"rev_comp"])
barcodes <- paste(possible[,1], "+", possible[,2], sep="")
possible <- expand.grid(dat[1:24,5], dat[25:40,5])
wells <- paste(possible[,1], possible[,2], sep="")
out <- cbind(barcodes, wells)
write.table(out, "Barcodes2Wells.out")

