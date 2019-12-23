# import site packages
import pandas as pd
# import numpy as np

# load data census acre data
cesus_ag = pd.read_csv("F:/crop_test/acre_data.csv", thousands=",")
# replace (D) and (Z) to nan
cesus_ag['VALUE'] = cesus_ag['VALUE'].str.replace(r"\(D\)", "np.nan")
cesus_ag['VALUE'] = cesus_ag['VALUE'].str.replace(r"\(Z\)", "np.nan")
# remove comma deliminator
cesus_ag['VALUE'] = (pd.to_numeric(cesus_ag.VALUE.str.split(',').str.join(''), errors='coerce'))
print(cesus_ag)
# check column type
print(list(cesus_ag.columns.values))
# change column name COMMODITY_DESC to Name_in_Census to have common column to merge
cesus_ag = cesus_ag.rename(columns={"COMMODITY_DESC": "Name_in_Census"})
# print(list(cesus_ag.columns.values))
cesus_ag.to_csv("data_cens_ag.csv")
# load crosswalk csv
cross_walk = pd.read_csv("F:/crop_test/ULUT_Data_Source_Summary_crosswalk.csv")
# remove duplicate from crosswalk table
cross_walk.drop_duplicates(subset='Name_in_Census', inplace=True)
# if you want to check save as csv
# cross_walk.to_csv("cross_walk.csv")
# print(cross_walk)
# define column to merge
col = ['Name_in_Census']
# merge dfs based on defined column
# merged = cesus_ag.join(cross_walk.set_index(col), on=col)
merged = pd.merge(cesus_ag, cross_walk, on='Name_in_Census', how='right')
# merged = cesus_ag.join(cross_walk.set_index('Name_in_Census'), on='Name_in_Census')
merged.to_csv("output_merge.csv", index=False)
# aggregated acre
sum_df = merged.groupby(['Concat Location', 'Name_in_Census', 'Reclass Category']).agg({'VALUE': lambda x: x.sum(skipna=True)})

print(sum_df)
# save final output
sum_df.to_csv("final_merge.csv")