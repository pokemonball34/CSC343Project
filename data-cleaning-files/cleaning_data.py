from os import name
from typing import final
import pandas as pd
import math
# from pandas.core.dtypes.missing import notnull
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

# READING THE FILE
# empRate_df = pd.read_csv(
#     "CSC343Project\data-cleaning-files\Employment Rate (Toronto Residents).csv")
# # df_2019 = empRate_df.loc[:]
# # df_2020 = empRate_df.iloc[1]
# # df_2021 = empRate_df.iloc[2]

# # print(df_2019)
# #
# january_df = empRate_df['January']
# february_df = empRate_df['February']
# march_df = empRate_df['March']
# april_df = empRate_df['April']
# may_df = empRate_df['May']
# june_df = empRate_df['June']
# july_df = empRate_df['July']
# august_df = empRate_df['August']
# september_df = empRate_df['September']
# october_df = empRate_df['October']
# november_df = empRate_df['November']
# december_df = empRate_df['December']
# print(january_df)
# # monthly_df = pd.DataFrame(
# #     {'month': ['January'], 'year': ['hello'], 'value': [2]})
# # print(monthly_df)
# # df_list = [january_df, february_df, march_df, april_df, may_df, june_df,
# #            july_df, august_df, september_df, october_df, november_df, december_df]

# final_df = pd.DataFrame()
# # years = [2019, 2020, 2021]
# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = empRate_df.loc[i]

#     january = year_row['January']
#     february = year_row['February']
#     march = year_row['March']
#     april = year_row['April']
#     may = year_row['May']
#     june = year_row['June']
#     july = year_row['July']
#     august = year_row['August']
#     september = year_row['September']
#     october = year_row['October']
#     november = year_row['November']
#     december = year_row['December']

#     months = [january, february, march, april, may, june,
#               july, august, september, october, november, december]
# #   january_float = float(row[x])
#     # print(january)
#     for month_value in months:
#         value = month_value
#         if(type(month_value) == str):
#             value = float(value[x])
#         monthly_df = pd.DataFrame(
#             {'month': ['January'], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('toronto-employment-rate-data.csv', index=False, header=False)

# print(january_df)
# print(february_df)
# print(march_df)
# print(april_df)
# print(may_df)
# print(june_df)
# print(july_df)
# print(august_df)
# print(september_df)
# print(october_df)
# print(november_df)
# print(december_df)
# print(math.isnan(december_df[2]))

# # print(empRate_df.head)
# # for year in years:
# #     df_2019 = pd.DataFrame({'month': month, 'year': 2019, 'emp-rate': rate} for name in names))

# for month in df_list:

#     for row in month:
#         # try:
#         #     miles = float(input("How many miles can you walk? "))
#         # except ValueError:
#         #     print("That is not a valid number of miles")
#         if (type(row) == str):
#             x = slice(4)
#             to_float = float(row[x])
#     # df_2019=pd.DataFrame({'month': month, 'year': 2019, 'emp-rate': rate} for name in names))

#     monthly_dfs.append(
# if (math.isnan(x)):
#     print(True)
# if empRate_df.at[2, 'June'] == 'nan':
#     empRate_df.at[2, 'June'] == 'NULL'
# print(empRate_df)

# ward_df = pd.read_csv('CSC343Project\originals\City-Wards-Data.csv')
# names = ward_df['AREA_NAME']
# names.to_csv('CSC343Project\cleaned\ward-data.csv', index=False, header=False)


#     print(element)
# for element in year_row['January']:
#     print(element)
# if(type(element) == str):
#     element = float(element[x])
#     print(element)
# monthly_df = pd.DataFrame(
#     {'month': 'January', 'year': year_row['Year'], 'value': element})
# monthly_dfs.append(monthly_df)
# for element in year_row['February']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'February', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['March']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'March', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['April']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'April', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['May']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'May', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['June']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'June', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['July']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'July', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['August']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'August', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# for element in year_row['September']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'September', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)
# for element in year_row['October']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'October', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)
# for element in year_row['November']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'November', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)
# for element in year_row['December']:
#     if(type(element) == str):
#         element = float(row[x])
#     monthly_df = pd.DataFrame(
#         {'month': 'December', 'year': year_row['Year'], 'value': element})
#     monthly_dfs.append(monthly_df)

# if (type(row) == str):
#     x = slice(4)
#     to_float = float(row[x])
# # CHECK FOR 2021
# if (year_row['Year'] == '2021 Acutal'):
#     if(year_row)


# CLEANING EMPLOYED CITY OF TORONTO RESIDENTS (000's).csv

# numEmployedTorontoResidents = pd.read_csv(
#     "CSC343Project\data-cleaning-files\Employed City of Toronto Residents (000's).csv")

# # january_df = numEmployedTorontoResidents['Jan']
# # february_df = numEmployedTorontoResidents['Feb']
# # march_df = numEmployedTorontoResidents['Mar']
# # april_df = numEmployedTorontoResidents['Apr']
# # may_df = numEmployedTorontoResidents['May']
# # june_df = numEmployedTorontoResidents['Jun']
# # july_df = numEmployedTorontoResidents['Jul']
# # august_df = numEmployedTorontoResidents['Aug']
# # september_df = numEmployedTorontoResidents['Sep']
# # october_df = numEmployedTorontoResidents['Oct']
# # november_df = numEmployedTorontoResidents['Nov']
# # december_df = numEmployedTorontoResidents['Dec']
# # monthly_df = pd.DataFrame(
# #     {'month': ['January'], 'year': ['hello'], 'value': [2]})
# # print(monthly_df)
# # df_list = [january_df, february_df, march_df, april_df, may_df, june_df,
# #            july_df, august_df, september_df, october_df, november_df, december_df]

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numEmployedTorontoResidents.loc[i]

#     january = year_row['Jun']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value) * 1000
#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('employed-toronto-residents-data.csv',
#                 index=False, header=False)


# CLEANING Average Actual Hours at Main Job (worked in reference week).csv

# avgHoursAtMainJobDf = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Average Actual Hours at Main Job (worked in reference week).csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = avgHoursAtMainJobDf.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('avg-actual-hours-at-main-job-data.csv',
#                 index=False, header=False)

# CLEANING NUMBER OF BUSINESS BANKRUPTCIES
# numBusBankruptcies = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Number of Business Bankruptcies (Ontario) .csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numBusBankruptcies.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value)

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/number-of-business-bankruptcies-data.csv',
#                 index=False, header=False)


# CLEANING NUMBER OF BUSINESS LICENCES RENEWED
# numBusLicencesRenewed = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Number of Business Licences Renewed .csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numBusLicencesRenewed.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value)

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/number-of-business-licences-renewed-data.csv',
#                 index=False, header=False)

# CLEANING NUMBER OF EI Beneficiaries
# numEIBeneficiaries = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Number of Employment Insurance (E.I.) Beneficiaries .csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numEIBeneficiaries.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value)

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/number-of-EI-beneficiaries-data.csv',
#                 index=False, header=False)


# # CLEANING NUMBER OF HOME SALES TORONTO
# numHomeSales = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Number of Home Sales (City of Toronto).csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numHomeSales.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value)

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/number-of-toronto-home-sales-data.csv',
#                 index=False, header=False)

# CLEANING NUMBER OF NEW BUSINESS LICENCES ISSUED
# numBusinessLicencesIssued = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Number of New Business Licences Issued .csv")

# yearly_dfs = []
# x = slice(4)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = numBusinessLicencesIssued.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) != float):
#             value = float(value)
#             if(math.isnan(value)):
#                 value = 0
#         if(type(value) == float):
#             value = int(value)

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/number-of-new-business-licences-issued.csv',
#                 index=False, header=False)


# CLEANING PERCENTAGE OF SELF EMPLOYED TORONTO
# percentageSelfEmployed = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Percentage who are Self-Employed (Toronto Residents).csv")

# yearly_dfs = []
# x = slice(4)
# y = slice(3)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = percentageSelfEmployed.loc[i]

#     january = year_row['Jan']
#     february = year_row['Feb']
#     march = year_row['Mar']
#     april = year_row['Apr']
#     may = year_row['May']
#     june = year_row['Jun']
#     july = year_row['Jul']
#     august = year_row['Aug']
#     september = year_row['Sep']
#     october = year_row['Oct']
#     november = year_row['Nov']
#     december = year_row['Dec']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == str):
#             value = value[x]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         # if(type(value) != float):
#         #     value = float(value)
#         #     if(math.isnan(value)):
#         #         value = 0

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/percentage-self-employed-toronto-data.csv',
#                 index=False, header=False)


# CLEANING PERCENTAGE OF VACANT OFFICE SPACE TORONTO
# percentageVacantOfficeSpace = pd.read_csv(
#     "CSC343Project/data-cleaning-files/Percentage of Vacant Office Space .csv")

# yearly_dfs = []
# x = slice(4)
# y = slice(3)

# for i in range(0, 3):
#     monthly_dfs = []
#     year_row = percentageVacantOfficeSpace.loc[i]

#     january = year_row['Q1']
#     february = year_row['Q1']
#     march = year_row['Q1']
#     april = year_row['Q2']
#     may = year_row['Q2']
#     june = year_row['Q2']
#     july = year_row['Q3']
#     august = year_row['Q3']
#     september = year_row['Q3']
#     october = year_row['Q4']
#     november = year_row['Q4']
#     december = year_row['Q4']

#     months = [[january, 'January'], [february, 'February'], [march, 'March'], [april, 'April'], [may, 'May'], [june, 'June'],
#               [july, 'July'], [august, 'August'], [september, 'September'], [october, 'October'], [november, 'November'], [december, 'December']]
# #
#     for month_value in months:
#         month = month_value[1]
#         value = month_value[0]
#         if(type(value) == str):
#             if len(value) > 4:
#                 value = value[x]
#             else:
#                 value = value[y]
#         if(type(value) == float):
#             if(math.isnan(value)):
#                 value = 0
#         # if(type(value) != float):
#         #     value = float(value)
#         #     if(math.isnan(value)):
#         #         value = 0

#         monthly_df = pd.DataFrame(
#             {'month': [month], 'year': [year_row['Year'][x]], 'value': [value]})
#         monthly_dfs.append(monthly_df)

#     year_df = pd.concat(monthly_dfs, ignore_index=True)
#     yearly_dfs.append(year_df)

# final_df = pd.concat(yearly_dfs, ignore_index=True)
# final_df.to_csv('CSC343Project/cleaned/percentage-vacant-office-space-toronto-data.csv',
#                 index=False, header=False)


employmentRate = pd.read_csv(
    "CSC343Project/cleaned/toronto-employment-rate-data.csv")
numOfEmployedCityOfTorontoResidents = pd.read_csv(
    "CSC343Project/cleaned/employed-toronto-residents-000s-data.csv")
avgHoursAtMainJob = pd.read_csv(
    "CSC343Project/cleaned/avg-actual-hours-at-main-job-data.csv")
percentageOfSelfEmployedTorontoResidents = pd.read_csv(
    "CSC343Project/cleaned/percentage-self-employed-toronto-data.csv")
percentageOfVacantOfficeSpace = pd.read_csv(
    "CSC343Project/cleaned/percentage-vacant-office-space-toronto-data.csv")
numOfEIBeneficiaries = pd.read_csv(
    "CSC343Project/cleaned/number-of-EI-beneficiaries-data.csv")
numOfBusinessLicencesRenewed = pd.read_csv(
    "CSC343Project/cleaned/number-of-business-licences-renewed-data.csv")
numOfNewBusinessLicencesIssued = pd.read_csv(
    "CSC343Project/cleaned/number-of-new-business-licences-issued-data.csv")
numOfTorontoHomesSold = pd.read_csv(
    "CSC343Project/cleaned/number-of-toronto-home-sales-data.csv")

numOfBusincessBankruptcies = pd.read_csv(
    "CSC343Project/cleaned/number-of-business-bankruptcies-data.csv")
output1 = pd.merge(employmentRate, numOfEmployedCityOfTorontoResidents,
                   on=['Year', 'Month'])
output2 = pd.merge(output1, avgHoursAtMainJob,
                   on=['Year', 'Month'])
output3 = pd.merge(output2, percentageOfSelfEmployedTorontoResidents,
                   on=['Year', 'Month'])
output4 = pd.merge(output3, percentageOfVacantOfficeSpace,
                   on=['Year', 'Month'])
output5 = pd.merge(output4, numOfEIBeneficiaries,
                   on=['Year', 'Month'])
output6 = pd.merge(output5, numOfBusinessLicencesRenewed,
                   on=['Year', 'Month'])
output7 = pd.merge(output6, numOfBusincessBankruptcies,
                   on=['Year', 'Month'])
output8 = pd.merge(output7, numOfNewBusinessLicencesIssued,
                   on=['Year', 'Month'])
output9 = pd.merge(output8, numOfTorontoHomesSold,
                   on=['Year', 'Month'])


output9.to_csv(
    'CSC343Project/cleaned/sample-data/toronto-stats-data.csv', index=False)
