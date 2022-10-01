import mysql.connector 
from mysql.connector import Error

try:
    conexion = mysql.connector.connect (user='root', 
                                        password = '*******',  # utilizar la contraseña de mysql
                                        host = 'localhost', 
                                        database = 'disqueria',
                                        port = '3306' )
    if conexion.is_connected():     # pregunta si esta conectado
        print("Conexion Exitosa")
except Error as ex:
    print("Algo fallo en la conexion: ",ex) # por si algo fallo
finally: 
    if conexion.is_connected():
        conexion.close()  #cierra la conexion con la base de datos
        print("La conexion a finalizado")
