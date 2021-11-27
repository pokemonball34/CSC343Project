from os import name
from typing import final
import pandas as pd
from pandas.core.dtypes.missing import notnull
########################################################
# CLEANING WARDS
# ward_df = pd.read_csv('originals\City-Wards-Data.csv')
# names = ward_df['AREA_NAME']

# final_df = names
# df1 = pd.DataFrame({'name':name,'year': 2019} for name in names)
# df2 = pd.DataFrame({'name':name,'year': 2020} for name in names)
# df3 = pd.DataFrame({'name':name,'year': 2021} for name in names)

# final_df = pd.concat([df1, df2, df3], ignore_index=True)

# final_df.to_csv('ward-data.csv',
#                 index=False, header=False)

# CLEANING EMPLOYMENT RATE
empRate_df = pd.read_csv("originals\Employment Rate (Toronto Residents).csv")
january_df = empRate_df['January']
february_df = empRate_df['February']
march_df = empRate_df['March']
april_df = empRate_df['April']
may_df = empRate_df['May']
june_df = empRate_df['June']
july_df = empRate_df['July']
august_df = empRate_df['August']
sept_df = empRate_df['September']
october_df = empRate_df['October']
november_df = empRate_df['November']
december_df = empRate_df['December']


# print(january_df)
# print(empRate_df.head)
final_df = pd.DataFrame()
monthly_dfs = []
for col in empRate_df.iloc[:, [1,2,3,4,5,6,7,8,9,10,11,12]]:
    for row in col:
        if empRate_df.at[2, 'June'] == 'nan':
            empRate_df.at[2, 'June'] == 'NULL'
        final_df = pd.concat([pd.DataFrame({'month': empRate_df.at[2, [col]]})])
# print(empRate_df)      

final_df.csv('employment-rate-data.csv', index=False, header=False)
# ward_df = pd.read_csv('CSC343Project\originals\City-Wards-Data.csv')
# names = ward_df['AREA_NAME']
# names.to_csv('CSC343Project\cleaned\ward-data.csv', index=False, header=False)
