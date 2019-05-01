#import packages					  
import os
import glob
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
# use your path
path =r'L:\Priv\WEB\HMS\Precip_Compare_Manuscript\Data\36yr_HMS_Ecoregion\data_without_metadata' 
#Create dataframe using pandas and import all csvs
df = pd.concat([pd.read_csv(f, sep=',') for f in glob.glob(path + "/*.csv")],ignore_index=True)
#view df
df
#replace -999 with NaN
cols = ["Date","ncei","daymet","gldas","nldas","ecoregion"]
df[cols] = df[cols].replace({'-1.00E+04':np.nan, -10000.0:np.nan})
#plotcheck
df.plot(x='Date',y='ncei')
plt.show()
#import mean.absolue error
from sklearn.metrics import mean_absolute_error
dna=df.dropna(axis=0)
mean_absolute_error("ncei", "daymet")
#this is not working
df.groupby(["ecoregion"])[["ncei", "daymet","gldas","nldas"]].mean_absolute_error()
#mean is working
df.groupby(["ecoregion"])[["ncei", "daymet","gldas","nldas"]].mean()
