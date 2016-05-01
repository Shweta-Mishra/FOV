import csv
import mysql.connector

cnx = mysql.connector.connect(user='root',password='mishra', database='FOV')
cursor = cnx.cursor()
with open('Bal_Cash.csv', 'rb') as f:
	reader = csv.reader(f, delimiter=',')
	for row in reader:
		add_q=("INSERT INTO Country_data(COUNTRY_NAME,COUNTRY_CODE) VALUES (%(cn)s,%(cc)s) ")
		#for i in range(4,57):
		data={'cn':row[0],'cc':row[1]}
		cursor.execute(add_q,data)
		cnx.commit()

cursor.close()
cnx.close()
		
		
