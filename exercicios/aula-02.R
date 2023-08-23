# Carregar as bibliotecas

library(Rcmdr)
library(colorspace)

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

# Histograma classes iguais (frequência)
with(Dataset_Morcegos, Hist(porct.gordura, scale="frequency", breaks="Sturges", col="darkgray"))

# Histograma classes iguais (percentual)
with(Dataset_Morcegos, Hist(porct.gordura, scale="percent", breaks="Sturges", col="darkgray"))

# Histograma classes iguais (densidade)
with(Dataset_Morcegos, Hist(porct.gordura, scale="density", breaks="Sturges", col="darkgray"))

# Boxplot variável y
Boxplot( ~ porct.gordura, data=Dataset_Morcegos, id=list(method="y"))

# Gráfico pizza (Local em porcentagem)
with(Dataset_Morcegos, piechart(local, xlab="", ylab="", main="Porcentagem de dias por local", col=rainbow_hcl(6), scale="percent"))

# Gráfico pizza (Anos em porcentagem)
with(Dataset_Morcegos, piechart(ano, xlab="", ylab="", main="Anos em porcentagem", col=rainbow_hcl(2), 
                                scale="percent"))

# Agrupamento
Dataset_Morcegos <- within(Dataset_Morcegos, {dias <- as.factor(dias)})

# Resumo numérico por dias
numSummary(Dataset_Morcegos[,"porct.gordura", drop=FALSE], groups=Dataset_Morcegos$dias, statistics=c("mean", "sd",
                                                                                                      "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))


