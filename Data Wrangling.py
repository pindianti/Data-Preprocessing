#Data wrangling adalah proses transformasi data ‘mentah’ menjadi format siap pakai dalam analisis. 
#Data wrangling dapat berupa: filtering, combining, reshaping, dealing with missing value, dan lainnya
 
  import numpy as np
  import pandas as pd

#SUBSET VARIABLE
#input data
  hrdata = pd.read_excel("HRDataset.xlsx")
  hrdata.head()
#select column that where choose
  hrdata.GenderID
  hrdata['GenderID']
#select multiple column
  hrdata[['MaritaStatusID', 'Pay Rate', 'Days Employed']].head()
#Select row with regex
  hrdata.filter(regex = '^11', axis = 0)
#column contain regex expression
  hrdata[hrdata["Employee Name"].str.contains('\Donald')]

#SUMMARIZE DATA
#count number of rows with each unique value of variable
  hrdata["Position"].value_counts()
#basic statistics for each columns
  hrdata.describe()

#HANDLE MISSING DATA
#na dapat dihapus dengan fungsi df.dropna()
#imputing dengan suatu nilai, df.fillna(value). nilainya dapat berupa nilai obyektif, mean, median, atau modus 
#read data with missing value
  missing_values = ["na", "NA", "-", "NULL"]
  hrdata = pd.read_excel("HRDataset.xlsx", na_values = missing_values)
#checking null value
  hrdata.isnull().any()
#checking NA value
  hrdata.isna().any()
#total missing value
  hrdata.isna().sum()
#Copy data frame
  hrdata = hrdata.copy()
  hrdata["Pay Rate"]
