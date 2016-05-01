import numpy as np
from sklearn.cluster import KMeans
import mysql.connector

class NumpyMySQLConverter(mysql.connector.conversion.MySQLConverter):
    """ A mysql.connector Converter that handles Numpy types """

    def _float32_to_mysql(self, value):
        return float(value)

    def _float64_to_mysql(self, value):
        return float(value)

    def _int32_to_mysql(self, value):
        return int(value)

    def _int64_to_mysql(self, value):
        return int(value)


cnx = mysql.connector.connect(user='root',password='mishra', database='FOV')
cursor = cnx.cursor()
cnx.set_converter_class(NumpyMySQLConverter)

f=open('output.txt','r')
print f.readline().split("\t")
d={}
for line in f:
	line=line.replace("\n","")
	stmt=line.split("\t")
	if stmt[0] not in d:
		d[stmt[0]]=[]
	d[stmt[0]].append(stmt[2])

li=[]
for k in d:
	li.append(d[k])
print len(li)
X=np.array(li)
kmeans=KMeans(n_clusters=4)
kmeans.fit(X)
labels=kmeans.labels_
#print len(labels)

for i,j in zip(li,labels):
	for k in d:
		if(i==d[k]):
			add_q=("INSERT INTO Cluster_data (Country_Code,Cluster_no) VALUES (%(cc)s, %(cn)s) ")
			data={'cc':k,'cn':j}
			cursor.execute(add_q,data)
			cnx.commit()
			break

cursor.close()
cnx.close()
