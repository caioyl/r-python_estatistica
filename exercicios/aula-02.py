desvio_padrao = {'Aeolus':0.071,'Barton Hill':0.070,'Graphite':0.074,'Hibernia':0.069,'Williams Hotel':0.035,'Williams Preserve':0.042}
media = {'Aeolus':0.122,'Barton Hill':0.168,'Graphite':0.176,'Hibernia':0.161,'Williams Hotel':0.179,'Williams Preserve':0.259}
coeficientes_de_variacao = {'Aeolus':0,'Barton Hill':0,'Graphite':0,'Hibernia':0,'Williams Hotel':0, 'Williams Preserve':0}
for i in media.keys():
    coeficiente_variacao = desvio_padrao[i] / media[i]
    coeficientes_de_variacao[i] = coeficiente_variacao
print(coeficientes_de_variacao)
