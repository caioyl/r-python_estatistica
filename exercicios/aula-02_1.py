# Primeira questão

import pandas as pd

# Primeiro item (script R)

# Segundo item

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

# Terceiro item
Q1 = 0.067
Q3 = 0.164
LS = Q3 + 1.5 * (Q3 - Q1)
LI = Q1 - 1.5 * (Q3 - Q1)
print(LS)
print(LI)
