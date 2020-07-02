import pandas as pd
import numpy as np
import datetime
# import csv
# import dask.dataframe as dd
import os
import sys

# read file
path_to_file = r'C:\Users\SSINNATH\OneDrive - Environmental Protection Agency (EPA)\Documents\Census\census2017\qs.census2017\qs.census2017.txt'
#path_to_file = r'E:\census2017\qs.census2017\qs.sample.txt'
# use chunk size 500
c_size = 10000

census_2017 = pd.read_csv(path_to_file, sep='\t', chunksize=c_size)
# print
#print(census_2017.head())
# for chunk in census_2017:
    # chunk.to_csv("census2017.csv")

# load the big file in smaller chunks
# for census_chunk in pd.read_csv(path_to_file, sep='\t', chunksize=c_size):
start_time = datetime.datetime.now()
print ("Start Time: " + start_time.ctime())
# Get date
today = datetime.datetime.today()
date = today.strftime('%Y%m%d')
#    print(census_chunk.shape)
chunk_list = []  # append each chunk df here
for chunk in census_2017:
    #chunk = chunk[chunk.SOURCE_DESC.isin(['CENSUS']) & chunk.SECTOR_DESC.isin(['CROPS']) & chunk.PRODN_PRACTICE_DESC.isin(['ALL PRODUCTION PRACTICES']) | chunk.PRODN_PRACTICE_DESC.isin(['IN THE OPEN'])& chunk.UNIT_DESC.isin(['ACRES']) | chunk.UNIT_DESC.isin(['OPERATIONS'])&
     #             chunk.DOMAIN_DESC.isin(['TOTAL']) & chunk.DOMAINCAT_DESC.isin(['NOT SPECIFIED'])& chunk.GROUP_DESC.isin(['FIELD CROPS']) | chunk.GROUP_DESC.isin(['VEGETABLES']) | chunk.GROUP_DESC.isin(['FRUIT & TREE NUTS'])]
    chunk = chunk[((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'ACRES')&
                  (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED')& (chunk['GROUP_DESC'] == 'FIELD CROPS'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'ACRES')  &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FIELD CROPS'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'ACRES')&
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') &  (chunk['GROUP_DESC'] == 'VEGETABLES'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') &  (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'ACRES')  &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'VEGETABLES'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'ACRES') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FRUIT & TREE NUTS'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'ACRES')  &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FRUIT & TREE NUTS'))|
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FIELD CROPS')) |
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FIELD CROPS')) |
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'VEGETABLES')) |
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'VEGETABLES')) |
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'ALL PRODUCTION PRACTICES') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FRUIT & TREE NUTS')) |
                  ((chunk['SOURCE_DESC'] == 'CENSUS') & (chunk['SECTOR_DESC'] == 'CROPS') & (chunk['PRODN_PRACTICE_DESC'] == 'IN THE OPEN') & (chunk['UNIT_DESC'] == 'OPERATIONS') &
                   (chunk['DOMAIN_DESC'] == 'TOTAL') & (chunk['DOMAINCAT_DESC'] == 'NOT SPECIFIED') & (chunk['GROUP_DESC'] == 'FRUIT & TREE NUTS'))]

    #chunk=chunk.query('(SOURCE_DESC == "CENSUS") & (SECTOR_DESC == "CROPS") & (PRODN_PRACTICE_DESC == "ALL PRODUCTION PRACTICES") & (PRODN_PRACTICE_DESC=="IN THE OPEN") & (UNIT_DESC == "ACRES"|"OPERATIONS") & (DOMAIN_DESC == "TOTAL") & (DOMAINCAT_DESC =="NOT SPECIFIED") & (GROUP_DESC =="FIELD CROPS")')
# Once the data filtering is done, append the chunk to list
    chunk_list.append(chunk)
# concat the list into dataframe
    df_concat = pd.concat(chunk_list, axis=0)

# print column name
    for col in df_concat.columns:
        print(col)
# print data type
    print(df_concat.head())
# print to csv
df_concat.to_csv(r"C:\Users\SSINNATH\OneDrive - Environmental Protection Agency (EPA)\Documents\Census\census2017\census_2017.csv")

end = datetime.datetime.now()
print( "End Time: " + end.ctime())
elapsed = end - start_time
print ("Elapsed  Time: " + str(elapsed))