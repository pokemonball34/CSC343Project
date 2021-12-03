import pandas as pd
import numpy as np
import glob

# Companies Table
col_list = ['Category', 'Licence No.', 'Operating Name', 'Licence Address Line 1', 'Cancel Date']
col_names = {
    "Category": "companyType",
    "Licence No.": "companyID",
    "Operating Name": "companyName",
    "Licence Address Line 1": "address",
    "Cancel Date": "closeDate"
}
com_data = pd.read_csv('Datasets/business_licences.csv', usecols=col_list)
com_data = com_data.rename(columns=col_names)
com_data['address'] = com_data['address'].astype(str)
com_data['address'] = com_data['address'].str.lower()
com_data.drop_duplicates(subset="companyName", inplace=True)
com_data.dropna(subset=["companyName"], inplace=True)
com_data.dropna(subset=["address"], inplace=True)


# Company Type to Sector ID Dictionary
categoryToSectorID = {
    "PRIVATE TRANSPORTATION COMPANY": 485,
    "TAXICAB BROKER": 485,
    "LIMOUSINE SERVICE COMPANY": 485,
    "TAXICAB OPERATOR": 485,
    "PRIVATE PARKING ENFORCEMENT AGENCY": 812,
    "SHORT TERM RENTAL COMPANY": 721,
    "DRIVING SCHOOL OPERATOR (B)": 611,
    'DRIVE-SELF RENTAL OWNER': 532,
    'HOLISTIC CENTRE': 621,
    'ADULT ENTERTAINMENT CLUB': 711,
    'PLACE OF AMUSEMENT': 713,
    'BILLIARD HALL': 713,
    'TEMPORARY SIGN PROVIDER': 561,
    'BODY RUB PARLOUR': 812,
    'BOWLING HOUSE': 713,
    'BOATS FOR HIRE': 532,
    'CARNIVAL': 713,
    'CIRCUS': 711,
    'SMOKE SHOP': 453,
    'RETAIL STORE (FOOD)': 445,
    'PERSONAL SERVICES SETTINGS': 812,
    'LAUNDRY': 812,
    'VAPOUR PRODUCT RETAILER': 453,
    'MOTOR VEHICLE RACING': 711,
    'THEATRE': 711,
    'PRECIOUS METAL SHOP': 418,
    'PAWN SHOP': 453,
    'PET SHOP': 453,
    'BATH HOUSE': 812,
    'PUBLIC GARAGE': 812,
    'AUTO SERVICE STATION': 811,
    'PUBLIC HALL': 913,
    'EATING ESTABLISHMENT': 722,
    'SECOND HAND SHOP': 453,
    'SECOND HAND SALVAGE YARD': 415,
    'SECOND HAND SALVAGE SHOP': 415,
    'COMMERCIAL PARKING LOT': 812,
    'SWIMMING POOL': 561,
    'PAYDAY LOAN': 522,
    'CLOTHING DROP BOX OPERATOR': 448,
    'ENTERTAINMENT ESTABLISHMENT/NIGHTCLUB': 722,
    'TEMPORARY SIGN - A-FRAME': 238,
    'TEMPORARY SIGN - MOBILE': 238,
    'TEMPORARY SIGN - NEW DEVELOPMENT': 238,
    'TEMPORARY SIGN - GROUND-MOUNTED': 238,
    'TEMPORARY SIGN - PORTABLE': 238,
    'PERMANENT FIREWORKS VENDOR': 418,
    'TEMPORARY FIREWORKS VENDOR (UNDER 25 KG)': 418,
    'TEMPORARY FIREWORKS VENDOR (OVER 25 KG)': 418,
    'TEMPORARY LEASE FIREWORKS VENDOR': 418,
    'TEMPORARY MOBILE FIREWORKS VENDOR': 418,
    'CLOTHING DROP BOX LOCATION PERMIT': 448,
    'SIDEWALK VENDING': 454,
    'MOBILE VENDING (FOOD TRUCK)': 722,
    'CURBLANE VENDING': 454,
    'MOBILE VENDING (ICE CREAM TRUCK)': 722,
    'SIDEWALK CAFE': 722,
    'MARKETING DISPLAY': 541,
    'HAWKER/PEDLAR ON FOOT': 722,
    'TRANSIENT TRADER': 448,
    'INSULATION INSTALLER': 238,
    'BUILDING CLEANER': 561,
    'ADVERTISING': 541,
    'AUCTIONEER': 561,
    'BILL DISTRIBUTOR': 522,
    'BUILDING RENOVATOR': 236,
    'CHIMNEY REPAIRMAN': 561,
    'DRAIN CONTRACTOR': 238,
    'DRAIN LAYER': 238,
    'HEATING CONTRACTOR': 238,
    'PLUMBING & HEATING CONTRACTOR': 238,
    'DRIVEWAY PAVING CONTRACTOR': 238,
    'PLUMBING CONTRACTOR': 238,
    'MASTER PLUMBER': 238,
    'MASTER HEATING INSTALLER': 238,
    'TORONTO TAXICAB OWNER': 485,
    'TAXICAB OWNER': 485,
    'LIMOUSINE OWNER': 485,
    'TOW TRUCK OWNER': 488,
    'DRIVING INSTRUCTOR (V)': 611,
    'DRIVING SCHOOL OPERATOR (V)': 611,
    'MOTORIZED REFRESHMENT VEHICLE OWNER': 722,
    'PEDICAB OWNER': 485,
    'HAWKER/PEDLAR WITH MOTOR VEHICLE': 722,
    'HAWKER/PEDLAR WITH PUSH CART': 722,
    'COLLECTOR OF SECOND HAND GOODS': 453,
    'NON-MOTORIZED REFRESHMENT VEHICLE OWNER': 722
}

# Importing the Addresses to Wards table
address_frame = pd.read_csv('address-data.csv', dtype={'address': str, 'wardName': str})
address_frame['address'] = address_frame['address'].str.lower()

# Putting it all together
com_data = pd.merge(com_data, address_frame, how='left', on='address')
com_data['companyID'] = range(1, len(com_data) + 1)
com_data['numOfEmployees'] = ''
com_data['sectorID'] = com_data['companyType'].map(categoryToSectorID)
com_data.drop(columns=['companyType', 'address'], inplace=True)
print(list(com_data))
print(com_data.get('wardName').drop_duplicates())

com_data.to_csv('company-data.csv', index=False, header=False)



