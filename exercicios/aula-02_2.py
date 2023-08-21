import pandas as pd
dict = {'Aeolus': 0.582, 'Barton Hill': 0.417, 'Graphite': 0.42, 'Hibernia': 0.429, 'Williams Hotel': 0.196, 'Williams Preserve': 0.162}
cvs = pd.Series(dict)
cvs_percentual = cvs*100
cvs_percentual = cvs_percentual.sort_values()
print(cvs_percentual)