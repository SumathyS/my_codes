# import site packages
import pandas as pd
# import numpy as np

# load data census acre data
census_ag_2017 = pd.read_csv("F:/crop_test/crop_gp_census_2017_clean.csv", thousands=",")
# replace (D) and (Z) to nan
census_ag_2017['VALUE'] = census_ag_2017['VALUE'].str.replace(r"\(D\)", "np.nan")
census_ag_2017['VALUE'] = census_ag_2017['VALUE'].str.replace(r"\(Z\)", "np.nan")
# remove comma deliminator
census_ag_2017['VALUE'] = (pd.to_numeric(census_ag_2017.VALUE.str.split(',').str.join(''), errors='coerce'))
print(census_ag_2017)
# check column type
print(list(census_ag_2017.columns.values))
# change column name COMMODITY_DESC to Name_in_Census to have common column to merge
census_ag_2017 = census_ag_2017.rename(columns={"COMMODITY_DESC": "Name_in_Census"})
# print(list(census_ag_2017.columns.values))
census_ag_2017.to_csv("data_cens_ag_2017.csv")
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
# merged = census_ag_2017.join(cross_walk.set_index(col), on=col)
merged = pd.merge(census_ag_2017, cross_walk, on='Name_in_Census', how='right')
# merged = census_ag_2017.join(cross_walk.set_index('Name_in_Census'), on='Name_in_Census')
merged.to_csv("output_merge_2017.csv", index=False)
# aggregated acre
sum_df = merged.groupby(['Concat Location', 'Name_in_Census', 'Reclass Category']).agg({'VALUE': lambda x: x.sum(skipna=True)})

print(sum_df)
# save final output
sum_df.to_csv("final_merge_2017.csv")