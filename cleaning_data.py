from typing import final
import pandas as pd
########################################################
# CLEANING WARDS
ward_df = pd.read_csv('originals\City-Wards-Data.csv')
names = pd.concat([ward_df['AREA_NAME']])


final_df = pd.DataFrame(columns=list('AB'))
years = [2019, 2020, 2021]

# final_df = pd.concat([pd.DataFrame([name, 2019])for name in names], [pd.DataFrame([name, 2020])for name in names], [pd.DataFrame([name, 2021])for name in names],
#                      ignore_index=True)
for year in years:
    for name in names:
        final_df = final_df.append([name, year])


final_df.to_csv('ward-data.csv',
                index=False, header=False)

print(names)

# CLEANING EMPLOYMENT RATE
empRate_df = pd.read_csv("originals\Employment Rate (Toronto Residents).csv")
for row in empRate_df:
    for col in row:
        print(col)
# ward_df = pd.read_csv('CSC343Project\originals\City-Wards-Data.csv')
# names = ward_df['AREA_NAME']
# names.to_csv('CSC343Project\cleaned\ward-data.csv', index=False, header=False)
