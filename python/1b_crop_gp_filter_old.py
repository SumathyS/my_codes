import pandas as pd
import numpy as np
# read file
path_to_file = r'C:\Users\SSINNATH\OneDrive - Environmental Protection Agency (EPA)\Documents\Census\census2017\census_2017.csv'

# use chunk size 10000
c_size = 10000

crop_gp_2017 = pd.read_csv(path_to_file, sep=',', chunksize=c_size, index_col=0)
mask_list = []  # append each chunk df here

for crop_chunk in crop_gp_2017:
    # print(crop_chunk.head())
    #df[df.risk.isin(['Small', 'Medium', 'High'])]
    chunk_field_crops = crop_chunk[(crop_chunk.GROUP_DESC.isin(['FIELD CROPS']) & crop_chunk.STATISTICCAT_DESC.isin(['AREA HARVESTED']))]
    mask_list.append(chunk_field_crops)
    chunk_vegetables = crop_chunk[(crop_chunk.GROUP_DESC.isin(['VEGETABLES']) &crop_chunk.UTIL_PRACTICE_DESC.isin(['ALL UTILIZATION PRACTICES']) &
                                  crop_chunk.STATISTICCAT_DESC.isin(['AREA HARVESTED']))]
    mask_list.append(chunk_vegetables)
    chunk_fruit_tree_nuts = crop_chunk[(crop_chunk.GROUP_DESC.isin(['FRUIT & TREE NUTS']) &crop_chunk.UTIL_PRACTICE_DESC.isin(['ALL UTILIZATION PRACTICES']) &
                                       crop_chunk.STATISTICCAT_DESC.isin(['AREA GROWN'])) |(crop_chunk.GROUP_DESC.isin(['FRUIT & TREE NUTS']) &
                                       crop_chunk.UTIL_PRACTICE_DESC.isin(['ALL UTILIZATION PRACTICES']) &
                                       crop_chunk.STATISTICCAT_DESC.isin(['AREA BEARING & NON-BEARING'])&~crop_chunk.COMMODITY_DESC.isin(['ORCHARDS']))]
    mask_list.append(chunk_fruit_tree_nuts)


# Once the data filtering is done, append the chunk to list
    # mask_list.append(crop_chunk)
# concat the list into dataframe
    mask_concat = pd.concat(mask_list)

# print column name
# for col in mask_concat.columns:
#    print(col)
# print data type
# print(mask_concat.head())
# print to csv
mask_concat.to_csv(r'C:\Users\SSINNATH\OneDrive - Environmental Protection Agency (EPA)\Documents\Census\census2017\crop_gp_census_2017.csv')


