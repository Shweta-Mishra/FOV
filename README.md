# FOV
Analysis of World Bank dataset

Task 1: Parsing data nad storing the result in mysql database. DUMP20160502.sql is the sql script.The DataFiles folder contains all the four csv data files downloaded from http://data.worldbank.org/indicator. erdiagram.pdf file shows the er diagram of the schema. We have four tables Country_data having the Country_Code and Country_Name, the table INDICATOR_TABLE has the indicator_code and Indicator name.The table data has the country_code,indicator_code,Year,expenditure value for that year.The Script folder has all the scripts written to do the task.
DataExtraction.py Script first reads all the data of csv file into a dictionary then after establishing the connection with 
mySql inserts the data of dictionary into tables . In the DataExtraction.py we can read different csv file by changing the name in open('file.csv') statement and the data of all the files will be stored in the database. CountryMetadata.py  stores the country  in the Country_data.
Task 2: For KMeans Clustering I have used numpy and sklearn python library. And the result of clustering is stored in Cluster_data table. The data is divided into 4 clusters and the table shows which Country code falls in which cluster. 
