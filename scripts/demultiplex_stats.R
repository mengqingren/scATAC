stats <- read.table("Summary_Stats.txt", header=T)
stats$NoMatchCell + stats$Ambig+stats$Out == stats$In
stats$Prop_recog = 1-stats$NoMatchCell/stats$In
stats$Est_Err_Rate = 1-(stats$Exact/(stats$Exact+stats$Mismatch+stats$Ambig))^(1/16)
write.table(stats,"Summary_Stats.csv", col.names=T, row.names=F, quote=F, sep=",")
