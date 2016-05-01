import csv
import mysql.connector

cnx = mysql.connector.connect(user='root',password='mishra', database='FOV')
cursor = cnx.cursor()

with open('Health_Xpd.csv', 'rb') as f:
	reader = csv.reader(f, delimiter=',')
	d={}
	for i in range(0,56):
		d[1960+i]=[]
	#print dict.keys()
	for row in reader:
		for i in range(0,56):	
			subdict={}
			#li=[]
			#subdict['CountryName']=row[0]
			subdict['CountryCode']=row[1]
			subdict['IndicatorCode']=row[3]
			subdict['YearValue']=row[i+4]     
			 #1960 is at 4th index of row 1961 at 5th and so on
			#li.append(subdict)
			d[1960+i].append(subdict)

	#print dict.items()
	"""for k in d:
		print k,d[k]"""

for k in d:
	length=len(d[k])
	for i in range(0,length):
		#for l in d[k]:
		add_q=("INSERT INTO Data (COUNTRY_CODE,INDICATOR_CODE,YEAR,YEAR_VALUE) VALUES (%(CountryCode)s,%(IndicatorCode)s, %(Year)s,%(YearValue)s )")
		data={'CountryCode':d[k][i]['CountryCode'],'IndicatorCode':d[k][i]['IndicatorCode'],'Year':k,'YearValue':d[k][i]['YearValue']}
		cursor.execute(add_q,data)
		cnx.commit()

cursor.close()
cnx.close()
#'CountryName':d[k][i][0],
#%(CountryName)s,
#'Year':k,
#,'YearValue':d[k][i]['YearValue']
