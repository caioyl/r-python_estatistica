library(Rcmdr)
Dataset_Morcegos <- readXL("C:/Users/caioy/Documents/GitHub/r-python_estatistica/dados/Morcegos_Cheng.xlsx", rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)
Dataset_Morcegos
numSummary(Dataset_Morcegos[,"porct.gordura", drop=FALSE], groups=Dataset_Morcegos$local, statistics=c("mean","sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))