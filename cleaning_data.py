import pandas as pd
# CLEANING WARDS
ward_df = pd.read_csv('CSC343Project\originals\City-Wards-Data.csv')
names = ward_df['AREA_NAME']
names.to_csv('CSC343Project\cleaned\ward-data.csv', index=False, header=False)


ward_df = pd.read_csv('CSC343Project\originals\City-Wards-Data.csv')
names = ward_df['AREA_NAME']
names.to_csv('CSC343Project\cleaned\ward-data.csv', index=False, header=False)
