import pandas as pd

# read file
path_to_file = r'F:\crop_test\census_2017.csv'

# use chunk size 10000
c_size = 10000

crop_gp_2017 = pd.read_csv(path_to_file, sep=',', chunksize=c_size, index_col=0)
mask_list = []  # append each chunk df here

for crop_chunk in crop_gp_2017:
    # print(crop_chunk.head())
    chunk_field_crops = crop_chunk[(crop_chunk['GROUP_DESC'] == 'FIELD CROPS') &
                                   (crop_chunk['STATISTICCAT_DESC'] == 'AREA HARVESTED')]
    mask_list.append(chunk_field_crops)
    chunk_vegetables = crop_chunk[(crop_chunk['GROUP_DESC'] == 'VEGETABLES') &
                                  (crop_chunk['UTIL_PRACTICE_DESC'] == 'ALL UTILIZATION PRACTICES') &
                                  (crop_chunk['STATISTICCAT_DESC'] == 'AREA HARVESTED')]
    mask_list.append(chunk_vegetables)
    chunk_fruit_tree_nuts = crop_chunk[(crop_chunk['GROUP_DESC'] == 'FRUIT & TREE NUTS') &
                                       (crop_chunk['UTIL_PRACTICE_DESC'] == 'ALL UTILIZATION PRACTICES') &
                                       (crop_chunk['STATISTICCAT_DESC'] == 'AREA GROWN') |
                                       (crop_chunk['STATISTICCAT_DESC'] == 'AREA BEARING & NON-BEARING')]
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
mask_concat.to_csv("crop_gp_census_2017.csv")


