import pandas as pd
## import numpy as np
import dask
import dask.dataframe as dd
# path_to_sample = r'F:\census2017\qs.sample.txt'
# sample = dd.read_csv(path_to_sample, sep='\t')
# print(df.head(5))
#for col in sample.columns:
#    print(col)

# read file
path_to_file = r'F:\census2017\qs.census2017\qs.census2017.txt'

#column_header = ['SOURCE_DESC', 'SECTOR_DESC', 'GROUP_DESC', 'COMMODITY_DESC', 'CLASS_DESC', 'PRODN_PRACTICE_DESC',
#                                      'UTIL_PRACTICE_DESC', 'STATISTICCAT_DESC', 'UNIT_DESC', 'SHORT_DESC', 'DOMAIN_DESC', 'DOMAINCAT_DESC', 'AGG_LEVEL_DESC',
#                                      'STATE_ANSI', 'STATE_FIPS_CODE', 'STATE_ALPHA', 'STATE_NAME', 'ASD_CODE', 'ASD_DESC', 'COUNTY_ANSI', 'COUNTY_CODE',
#                                      'COUNTY_NAME', 'REGION_DESC', 'ZIP_5', 'WATERSHED_CODE', 'WATERSHED_DESC', 'CONGR_DISTRICT_CODE', 'COUNTRY_CODE',
#                                      'COUNTRY_NAME', 'LOCATION_DESC', 'YEAR', 'FREQ_DESC', 'BEGIN_CODE', 'END_CODE', 'REFERENCE_PERIOD_DESC', 'WEEK_ENDING',
#                                      'LOAD_TIME', 'VALUE', 'CV_%']
# import census qs.census2017.txt file into df
# if we need column_header add header=None, names=column_header
censusag2017_all = dd.read_csv(path_to_file, sep='\t', dtype={'SOURCE_DESC': 'object', 'SECTOR_DESC': 'object', 'GROUP_DESC': 'object', 'COMMODITY_DESC': 'object', 'CLASS_DESC': 'object', 'PRODN_PRACTICE_DESC': 'object',
                                      'UTIL_PRACTICE_DESC': 'object', 'STATISTICCAT_DESC': 'object', 'UNIT_DESC':'object', 'SHORT_DESC': 'object', 'DOMAIN_DESC': 'object', 'DOMAINCAT_DESC': 'object', 'AGG_LEVEL_DESC': 'object',
                                     'STATE_ANSI': 'int64', 'STATE_FIPS_CODE': 'int64', 'STATE_ALPHA': 'object', 'STATE_NAME': 'object', 'ASD_CODE': 'int64', 'ASD_DESC': 'object', 'COUNTY_ANSI': 'int64', 'COUNTY_CODE': 'int64',
                                     'COUNTY_NAME': 'object', 'REGION_DESC': 'float64', 'ZIP_5': 'float64', 'WATERSHED_CODE': 'int64', 'WATERSHED_DESC': 'float64', 'CONGR_DISTRICT_CODE': 'float64', 'COUNTRY_CODE': 'int64',
                                      'COUNTRY_NAME': 'object', 'LOCATION_DESC': 'object', 'YEAR': 'int64', 'FREQ_DESC': 'object', 'BEGIN_CODE': 'int64', 'END_CODE': 'int64', 'REFERENCE_PERIOD_DESC': 'object', 'WEEK_ENDING': 'float64',
                                      'LOAD_TIME': 'object', 'VALUE': 'object', 'CV_%': 'object'})
# print column name
for col in censusag2017_all.columns:
    print(col)
# print data type
print(censusag2017_all.head())
#df = censusag2017_all[censusag2017_all.SECTOR_DESC == 'CROPS']
#print(df.dtypes)
#censusag2017_all.SECTOR_DESC.unique().compute()
#censusag2017_all["SECTOR_DESC"].unique(split_out=10).to_parquet(...)
#s = dd.read_parquet(...)
#for item in s.iteritems():
 #   ...