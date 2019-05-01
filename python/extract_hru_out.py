# -*- coding: utf-8 -*-
"""
Created on Tue Apr 30 15:35:03 2019

@author: SSinnath
"""
import os
import pandas
#import numpy as np
#set directory 
os.chdir('C:/Users/SSinnath/Research/swat/swatdel/Scenarios/Default/TxtInOut')

df = pandas.read_csv('output.hru', delimiter=r"\s+",skiprows=range(0, 9),header=None, dtype=str,encoding='latin1',index_col=False,names= ['LULC','HRU','GIS','SUB','MGT','MONAREA','PRECIP','SNOFALL','SNOMELT','IRR',
                 'PET','ET','SW_INIT','SW_END','PERC','GW_RCHG','DA_RCHG','REVAP','SA_IRR','DA_IRR','SA_ST',
                 'DA_ST','SURQ_GEN','SURQ_CNT','TLOSS','LATQ','GW_Q','WYLD','DAILYCN','TMP_AV','TMP_MX',
                 'TMP_MN','SOL_TMP','SOLAR','SYLD','USLE','N_APP','P_APP','NAUTO','PAUTO','NGRZ','PGRZ',
                 'NCFRT','PCFRT','NRAIN','NFIX','F-MN','A-MN','A-SN','F-MP','AO-LP','L-AP','A-SP','DNIT',
                 'NUP','PUP','ORGN','ORGP','SEDP','NSURQ','NLATQ','NO3L','NO3GW','SOLP','P_GW','W_STRS',
                 'TMP_STRS','N_STRS','P_STRS','BIOM','LAI','YLD','BACTP','BACTLP',
                'WTAB','WTABELO','SNO_HRU','CMUP_KGH','CMTOT_KGH','QTILE','TNO3','LNO3','GW_Q_D','LATQ_CNT','TVAP'] )
df.head(3)
df['Mon'], df['Area']= map(df['MONAREA'].str.slice, [ 0, 4], [5, 14])
dfhru=df.apply(pandas.to_numeric, errors='ignore', downcast='float')
print (dfhru.dtypes)

cols = [0,1,3,5,69,70,71, 85, 86]
df_yield = dfhru[dfhru.columns[cols]]
df_yield.head(3)

#extract corn hrus
corn=df_yield.loc[df_yield['LULC'] == 'CORN']

#extract et for specific hru
co_et = [0,1,3,5,11, 85, 86]
df_et = dfhru[dfhru.columns[co_et]]
df_et.head(3)
et=df_et.loc[df_et['HRU'] == 5.0]

#open hru and saveinto df
#    for _ in range(8):
#        next(f)
#    for line in f:
        #cols = ['LULC','HRU','GIS','SUB','MGT','MON','AREA','PRECIP','SNOFALL','SNOMELT','IRR',
                 #'PET','ET','SW_INIT','SW_END','PERC','GW_RCHG','DA_RCHG','REVAP','SA_IRR','DA_IRR','SA_ST',
                 #'DA_ST','SURQ_GEN','SURQ_CNT','TLOSS','LATQ','GW_Q','WYLD','DAILYCN','TMP_AV','TMP_MX',
                 #'TMP_MN','SOL_TMP','SOLAR','SYLD','USLE','N_APP','P_APP','NAUTO','PAUTO','NGRZ','PGRZ',
                 #'NCFRT','PCFRT','NRAIN','NFIX','F-MN','A-MN','A-SN','F-MP','AO-LP','L-AP','A-SP','DNIT',
                 #'NUP','PUP','ORGN','ORGP','SEDP','NSURQ','NLATQ','NO3L','NO3GW','SOLP','P_GW','W_STRS',
                 #'TMP_STRS','N_STRS','P_STRS','BIOM','LAI','YLD','BACTP','BACTLP',
                # 'WTAB','WTABELO','SNO_HRU','CMUP_KGH','CMTOT_KGH','QTILE','TNO3','LNO3','GW_Q_D','LATQ_CNT','TVAP']
        #reader =csv.reader(f, delimiter=" ")
#df = pandas.read_csv('output.hru', delimiter=r"\s+",skiprows=range(0, 9),header=None,encoding='latin1',index_col=False,names= ['LULC','HRU','GIS','SUB','MGT','MON','AREA','PRECIP','SNOFALL','SNOMELT','IRR',
#                 'PET','ET','SW_INIT','SW_END','PERC','GW_RCHG','DA_RCHG','REVAP','SA_IRR','DA_IRR','SA_ST',
#                 'DA_ST','SURQ_GEN','SURQ_CNT','TLOSS','LATQ','GW_Q','WYLD','DAILYCN','TMP_AV','TMP_MX',
#                 'TMP_MN','SOL_TMP','SOLAR','SYLD','USLE','N_APP','P_APP','NAUTO','PAUTO','NGRZ','PGRZ',
#                 'NCFRT','PCFRT','NRAIN','NFIX','F-MN','A-MN','A-SN','F-MP','AO-LP','L-AP','A-SP','DNIT',
#                 'NUP','PUP','ORGN','ORGP','SEDP','NSURQ','NLATQ','NO3L','NO3GW','SOLP','P_GW','W_STRS',
#                 'TMP_STRS','N_STRS','P_STRS','BIOM','LAI','YLD','BACTP','BACTLP',
#                'WTAB','WTABELO','SNO_HRU','CMUP_KGH','CMTOT_KGH','QTILE','TNO3','LNO3','GW_Q_D','LATQ_CNT','TVAP'],dtype={'LULC': np.object,'HRU': np.int64,'GIS': np.int64,'SUB': np.int64,'MGT': np.int64,'MON': np.int64,'AREA': np.float64,'PRECIP': np.float64,'SNOFALL': np.float64,'SNOMELT': np.float64,'IRR': np.float64,
#                 'PET': np.float64,'ET': np.float64,'SW_INIT': np.float64,'SW_END': np.float64,'PERC': np.float64,'GW_RCHG': np.float64,'DA_RCHG': np.float64,'REVAP': np.float64,'SA_IRR': np.float64,'DA_IRR': np.float64,'SA_ST': np.float64,
#                 'DA_ST': np.float64,'SURQ_GEN': np.float64,'SURQ_CNT': np.float64,'TLOSS': np.float64,'LATQ': np.float64,'GW_Q': np.float64,'WYLD': np.float64,'DAILYCN': np.float64,'TMP_AV': np.float64,'TMP_MX': np.float64,
#                 'TMP_MN': np.float64,'SOL_TMP': np.float64,'SOLAR': np.float64,'SYLD': np.float64,'USLE': np.float64,'N_APP': np.float64,'P_APP': np.float64,'NAUTO': np.float64,'PAUTO': np.float64,'NGRZ': np.float64,'PGRZ': np.float64,
#                 'NCFRT': np.float64,'PCFRT': np.float64,'NRAIN': np.float64,'NFIX': np.float64,'F-MN': np.float64,'A-MN': np.float64,'A-SN': np.float64,'F-MP': np.float64,'AO-LP': np.float64,'L-AP': np.float64,'A-SP': np.float64,'DNIT': np.float64,
#                 'NUP': np.float64,'PUP': np.float64,'ORGN': np.float64,'ORGP': np.float64,'SEDP': np.float64,'NSURQ': np.float64,'NLATQ': np.float64,'NO3L': np.float64,'NO3GW': np.float64,'SOLP': np.float64,'P_GW': np.float64,'W_STRS': np.float64,
#                 'TMP_STRS': np.float64,'N_STRS': np.float64,'P_STRS': np.float64,'BIOM': np.float64,'LAI': np.float64,'YLD': np.float64,'BACTP': np.float64,'BACTLP': np.float64,
#                'WTAB': np.float64,'WTABELO': np.float64,'SNO_HRU': np.float64,'CMUP_KGH': np.float64,'CMTOT_KGH': np.float64,'QTILE': np.float64,'TNO3': np.float64,'LNO3': np.float64,'GW_Q_D': np.float64,'LATQ_CNT': np.float64,'TVAP': np.float64})
