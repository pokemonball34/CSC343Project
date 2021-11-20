import pandas as pd

# Companies Table
col_list = ['Category', 'Licence No.', 'Operating Name', 'Licence Address Line 3']
col_names = {
    "Category": "companyType",
    "Licence No.": "companyID",
    "Operating Name": "companyName",
    "Licence Address Line 3": "postalCode"
}
com_data = pd.read_csv('Datasets/business_licences.csv', usecols=col_list)
com_data = com_data.rename(columns=col_names)
com_data.drop_duplicates(subset="companyName", inplace=True)
com_data.dropna(subset=["companyName"], inplace=True)
com_data.dropna(subset=["postalCode"], inplace=True)

# Postal Code to Ward Dictionary
codeToWard = {
    "M9N": "York South-Weston",
    "M3J": "Humber River-Black Creek",

}

company = com_data[["companyID", "companyName", "postalCode"]]
company["wardName"] = ""
company["numOfEmployees"] = ""

company.to_csv('company-data.csv', index=False, header=False)





