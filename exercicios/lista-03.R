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

# Criando variável Etario
Dataset_Insetos <- within(Dataset_Insetos, {
  Etario <- Recode(Idade, '0:30=0; 30:1000=1', as.factor=TRUE, to.value="=",
                   interval=":", separator=";")
})

# Criando variável Cura
Dataset_Insetos <- within(Dataset_Insetos, {
  Cura <- Recode(Recup, '0:20="Rápida"; 20:40="Normal"; 40:60="Lenta"', 
                 as.factor=TRUE, to.value="=", interval=":", separator=";")
})

# Criando tabela dupla entrada l=Etario c=Coag

library(abind, pos=17)
local({
  .Table <- xtabs(~Etario+Coag, data=Dataset_Insetos)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})

# Criando uma tabela de dupla entrada com l=Cura e c=Tratamento

local({
  .Table <- xtabs(~Cura+Tratam, data=Dataset_Insetos)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})
