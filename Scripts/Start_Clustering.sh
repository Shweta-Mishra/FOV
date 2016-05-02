mysql -u root -p --database FOV -e"select COUNTRY_CODE,INDICATOR_CODE,YEAR_VALUE from Data where YEAR=$0;" > output.txt
python Clustering.py
