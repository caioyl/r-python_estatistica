# Carregar a biblioteca

library(Rcmdr)

# Leitura do arquivo
Dataset_Morcegos <- readXL("C:/Users/caioy/Documents/GitHub/r-python_estatistica/dados/Morcegos_Cheng.xlsx", 
                           rownames=FALSE, header=TRUE, na="", sheet="Sheet1", stringsAsFactors=TRUE)

# Resumo numérico geral
numSummary(Dataset_Morcegos[,"porct.gordura", drop=FALSE], statistics=c("mean", "sd", "IQR", "quantiles"), 
           quantiles=c(0,.25,.5,.75,1))

# Resumo numérico por grupo
numSummary(Dataset_Morcegos[,"porct.gordura", drop=FALSE], groups=Dataset_Morcegos$local, statistics=c("mean", 
                                                                                                       "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

# Boxplot Aeolus
Boxplot(porct.gordura ~ local, data=Dataset_Morcegos, id=list(method="y"))

