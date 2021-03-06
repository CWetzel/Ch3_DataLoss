#=================================================
#
#  Selectivity plot
#
#=================================================

drive = "C:"
run.name = "Ass_Freq"
LH = 'rockfish'
# Source in the parameters
github = TRUE
git.wd = "C:/Users/Chantell.Wetzel/Documents/GitHub/Ch3_DataLoss/"

selex.fxn <- function(a){
	#Double Normal Selectivity
  	startbin <- 1
  	peak <- fsp1[a]
  	upselex <- exp(fsp3)
  	downselex <- exp(fsp4)
  	final <- fsp6
	
  	point1 <- 1 / (1 + exp(-fsp5)) 
  	t1min <- exp(-((len.step[startbin] + 1) - peak)^2 / upselex)
  	peak2 <- peak + 2 + (0.99 * (len.step[length(len.step)] + 1) - peak - 2) / (1 + exp(-fsp2[a]))
  	point2 <- 1 / (1 + exp(-final))
  	t2min <- exp(-((len.step[length(len.step)] + 1) - peak2)^2 / downselex)
  	t1 <- len.step + 1 - peak
  	t2 <- len.step + 1 - peak2
  	join1 <- 1 / (1 + exp(-(20 / (1 + abs(t1))) * t1))
  	join2 <- 1 / (1 + exp(-(20 / (1 + abs(t2))) * t2))
  	asc <- point1 + (1 - point1) * (exp(-t1^2 / upselex) - t1min) / (1 - t1min)
  	if (fsp5 <= -999) { asc <-  exp(-(t1^2) / upselex)}
  	dsc <- 1 +(point2-1)*(exp(-t2^2 / downselex) - 1) / (t2min - 1)
  	if (fsp6 <- -999) { dsc <- exp(-(t2^2) / downselex)}
	
  	select.out <- asc * (1-join1) + join1 * (1 - join2 + dsc * join2) 
  	return(select.out)
}


N = 50
ds.vec = 1:4 # 4 option fixed asym, fixed, dome, tv asym, tv dome
selec <- array(NA, dim = c(length(ds.vec), length(len.step), N))


for (a in 1: length(ds.vec)){
	source(paste(git.wd, run.name, "/functions/LH_parameter_values.R", sep=""))
	fsp2.start  <- fsp2
	# Load the seeds
	load(paste("C:/PhD/Chapter3/seed_list",sep="")) 
	select.seed   <- as.numeric(seed.list[[1]][,"spare1"])
	select.sd   <- ifelse(a>2, 0.05, 0)
	dome.sd     <- ifelse(a>2, 0.20, 0)

	for (b in 1:N){
		set.seed(select.seed[N])
		select.err     <- rnorm(N, 0, select.sd)
		fsp1           <- round(fsp1.start*exp(-0.5*select.sd*select.sd + select.err),0)
		if (a == 4 || a == 2)  { fsp1 <- round((fsp1.start + selec.adj)*exp(-0.5*select.sd*select.sd + select.err),0) }   	
    	fsp2           <- sample(x = c(-3, fsp2.start), size = 100, replace = T, prob = c(0,1))
    	select.err     <- rnorm(N, 0, dome.sd)
    	if (a == 4 || a == 2) { fsp2 <- round((fsp2 + dome.adj)*exp(-0.5*dome.sd*dome.sd + select.err), 1) }

		selec[a,,b] <- selex.fxn(a = b)
	}
}




par(mfrow = c(1,3))
plot(len.step, selec[1,,1], type = 'l')
lines(len.step, selec[2,,1], type = 'l')
plot(len.step, selec[3,,1], type = 'l')
for(b in 2:N){
	lines(len.step, selec[3,,b])
}
plot(len.step, selec[4,,1], type = 'l')
for(b in 2:N){
	lines(len.step, selec[4,,b])
}