import mysql.connector
import random

mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="mydatabase"
)

mycursor = mydb.cursor()
for i in range(0,105):

    x=random.randint(0, 2)
    y=random.randint(0, 6)
    z=random.randint(231, 540)
    sql = "INSERT INTO sensor_values (heart_rate,oximeter,ecg_val) VALUES (%s, %s, %s)"
    val = (z, y, x)
    mycursor.execute(sql, val)

mydb.commit()

print(mycursor.rowcount, "record inserted.")

import serial 
import MySQLdb
import time

dbConn = MySQLdb.connect("localhost","root","","dbserial") or die ("could not connect to database")
#open a cursor to the database
cursor = dbConn.cursor()

device = 'COM18' #this will have to be changed to the serial port you are using
try:
  print "Trying...",device 
  arduino = serial.Serial(device, 9600) 
except: 
  print "Failed to connect on",device    

while True:
    try:
      time.sleep(2)
      data = arduino.readline()  #read the data from the arduino
      print data
      pieces = data.split(" ")  #split the data by the tab
      #Here we are going to insert the data into the Database
      try:
        cursor.execute("INSERT INTO dht11serial (humidity,temperature) VALUES (%s,%s)", (pieces[0],pieces[1]))
        dbConn.commit() #commit the insert
        cursor.close()  #close the cursor
      except MySQLdb.IntegrityError:
        print "failed to insert data"
#      finally:
#        cursor.close()  #close just incase it failed
    except:
      print "Failed to get data from Arduino!"

            
            


  