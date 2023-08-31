# Lista 3 - Estatística Descritiva III

# Lendo a primeira planilha

Dataset_Insetos <- 
  readXL("C:/Users/caioy/Documents/GitHub/r-python_estatistica/dados/Aula-3_Casa_Dados_INSETOS.xlsx",
         rownames=FALSE, header=TRUE, na="", sheet="Plan1", stringsAsFactors=TRUE)

# Construção do diagrama de dispersão com reta de regressão linear
scatterplot(Recup~Diag, regLine=TRUE, smooth=FALSE, boxplots=FALSE, 
            xlab="Diag (em horas)", ylab="Recup (em horas)", main="Diag x Recup", 
            data=Dataset_Insetos)
# Ajuste da reta de regressão

scatterplot(Recup~Diag, regLine=TRUE, smooth=FALSE, boxplots=FALSE, 
  xlab="Diag (em horas)", ylab="Recup (em horas)", main="Diag x Recup", 
  data=Dataset_Insetos)

# Coeficientes
RegModel.3 <- lm(Recup~Diag, data=Dataset_Insetos)
summary(RegModel.3)