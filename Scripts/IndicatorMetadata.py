import csv
import mysql.connector

cnx = mysql.connector.connect(user='root',password='mishra', database='FOV')
cursor = cnx.cursor()
with open('Bal_Cash.csv', 'rb') as f:
	reader = csv.reader(f, delimiter=',')
	for row in reader:
		add_q=("INSERT INTO INDICATOR_TABLE(INDICATOR_NAME,INDICATOR_CODE) VALUES (%(cn)s,%(cc)s) ")
		#for i in range(4,57):
		data={'cn':row[2],'cc':row[3]}
		cursor.execute(add_q,data)
		cnx.commit()

cursor.close()
cnx.close()
		
		
