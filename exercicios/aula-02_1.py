# Exercício 1

import pandas as pd
import shutil

# Item (b)

desvio_padrao = {'Aeolus':0.071,'Barton Hill':0.070,'Graphite':0.074,'Hibernia':0.069,'Williams Hotel':0.035,'Williams Preserve':0.042}
media = {'Aeolus':0.122,'Barton Hill':0.168,'Graphite':0.176,'Hibernia':0.161,'Williams Hotel':0.179,'Williams Preserve':0.259}
coeficientes_de_variacao = {'Aeolus':0,'Barton Hill':0,'Graphite':0,'Hibernia':0,'Williams Hotel':0, 'Williams Preserve':0}
for i in media.keys():
    coeficiente_variacao = desvio_padrao[i] / media[i]
    coeficientes_de_variacao[i] = round(coeficiente_variacao,3)
cvs = pd.Series(coeficientes_de_variacao)
cvs_percentual = cvs*100
cvs_percentual_ordenados = cvs_percentual.sort_values()
print(cvs_percentual_ordenados)

# Item (c)
Q1 = 0.067
Q3 = 0.164
LS = Q3 + 1.5 * (Q3 - Q1)
LI = Q1 - 1.5 * (Q3 - Q1)
print(LS)
print(LI)

# Exercício 2

# Item (a)

# Cálculo das frequências relativas
# print(h/base*100) = fr (em %)

# Primeira fr
print('Primeira fr',(0.685*0.05)*100)
fr1 = (0.685*0.05)
# f
print('f1',fr1*555)

# Segunda fr
print('Segunda fr',(4.631*(0.15-0.05))*100)
fr2 = 4.631*(0.15-0.05)
# f2
print('f2',fr2*555)

# Porcentagem acumulada
print('Porcentagem acumulada',3.43+46.31)

# Terceira fr
print('Terceira fr',(4.252*(0.2-0.15))*100)
fr3 = 4.252*(0.2-0.15)

# f3
print('f3',fr3*555)

# Porcentagem acumulada
print('Porcentagem acumulada',49.74 + 21.26)

# Quarta fr
print('Quarta fr',(2.45*(0.3-0.2))*100)
fr4 = 2.45*(0.3-0.2)

# f4
print('f4',fr4*555)

# Porcentagem acumulada
print('Porcentagem acumulada',71+24.50)

# Quinta fr
print('Quinta fr',(0.829*(0.35-0.3))*100)
fr5 = 0.829*(0.35-0.3)

# f5
print('f5',fr5*555)

# Porcentagem acumulada
print('Porcentagem acumulada',95.5+4.14)

# Sexta fr
print('Sexta fr',(0.072*(0.4-0.35))*100)
fr6 = 0.072*(0.4-0.35)

# f6
print('f6',fr6*555)

# Porcentagem acumulada
print('Porcentagem acumulada',99.64+0.36)

# prova
print(19+257+118+136+23+2)

# Q3 aproximado
# 4% representa x% de 24,50%. x% de 0,1 = y. 0,2 + y = q3 aproximado
x = (4/24.50) * 100
y = 0.1633*0.1
q3 = 0.2 + 0.0163

#Exercício 4

# Item (a)

dados = 'https://github.com/caioyl/r-python_estatistica/raw/main/dados/Morcegos_Cheng.xlsx'
df = pd.read_excel(dados)

valor_minimo = df.min()
valor_maximo = df.max()

df_novo = df.groupby('dias')
#Todos os mínimos
print(df.groupby('dias').min())

#Todos os máximos
print(df.groupby('dias').max())

# Calcular os limites inferior e superior usando IQR
q1 = df_novo.quantile(0.25)
q3 = df_novo.quantile(0.75)
iqr = q3 - q1

# Criando Series com os limites
lower_limit = q1 - 1.5 * iqr
upper_limit = q3 + 1.5 * iqr

lower_limit.rename(columns={'porct.gordura': 'limite inferior'}, inplace=True)
upper_limit.rename(columns={'porct.gordura': 'limite superior'}, inplace=True)
lower_limit.drop(columns=['ano'], inplace=True)
upper_limit.drop(columns=['ano'], inplace=True)
# print(upper_limit)
#print(lower_limit)

valor_minimo = df_novo.min()
valor_maximo = df_novo.max()

df_limites = pd.concat([lower_limit, upper_limit],axis=1)
print(df_limites)