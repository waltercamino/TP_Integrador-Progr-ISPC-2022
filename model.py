import mysql.connector


# CONEXION A BASE DE DATOS #

class Conectar():

    def __init__(self) -> None:
        try:
            self.conexion = mysql.connector.connect(
                host = 'localhost',
                port = 3306,
                user = "root",
                password = "",
                db = "disqueria"
            )
        except mysql.connector.Error as d_Error:
            print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)


#------------------TRAER UN SOLO ITEM------------------------------------------------------------------------------------------------

# TRAER UN SOLO ALBUM #

    def TraerAlbum(self,cod_album):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM album WHERE album.cod_album = "+str(cod_album)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

# TRAER UN SOLO ALBUM PERO POR ID #

    def TraerAlbumByID(self,id):
            if self.conexion.is_connected():
                try:
                    cursor = self.conexion.cursor()
                    senteciaSQL = "SELECT * FROM album WHERE id_album = "+str(id)
                    cursor.execute(senteciaSQL)
                    resultados = cursor.fetchall()
                    self.conexion.close()
                    return resultados[0]


                except mysql.connector.Error as descripcionError:
                    print("¡No se conectó!",descripcionError)
# TRAER UN SOLO INTERPRETE #

    def TraerInterprete(self,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM interprete WHERE id_interprete = "+str(id)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

# TRAER UN SOLO GENERO #

    def TraerGenero(self,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM genero WHERE id_genero = "+str(id)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

# TRAER UN SOLO TEMA #

    def TraerTema(self,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM tema WHERE id_tema = "+str(id)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

# TRAER UNA SOLA DISCOGRAFICA #

    def TraerDiscografica(self,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM discografica WHERE id_discografica = "+str(id)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

# TRAER UN SOLO FORMATO #

    def TraerFormato(self,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM formato WHERE id_formato = "+str(id)
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados[0]


            except mysql.connector.Error as descripcionError:
                print("¡No se conectó!",descripcionError)

#------------------LISTAR------------------------------------------------------------------------------------------------


    def ListarAlbumesCompleto(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT * FROM album"
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)

# LISTAR ALBUMES 

    def ListarAlbumes(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT cod_album, album.nombre, interprete.nombre, genero.nombre, discografica.nombre, precio, cantidad, formato.tipo, caratula FROM album, interprete, discografica,formato,genero WHERE album.id_interprete = interprete.id_interprete AND album.id_discografica = discografica.id_discografica AND album.id_formato = formato.id_formato AND album.id_genero = genero.id_genero ORDER By interprete.nombre asc"
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)


# LISTAR GENERO #

    def ListarGenero(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SELECT * from genero"
                cursor.execute(sentenciaSQL)
                resultados = cursor.fetchall()
                #self.conexion.close()
                return resultados
            
            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 


# LISTAR POR GENERO #

    def ListarPorGenero(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT cod_album, album.nombre, interprete.nombre, genero.nombre, discografica.nombre, precio, cantidad, formato.tipo, caratula FROM album, interprete, discografica,formato,genero WHERE album.id_interprete = interprete.id_interprete AND album.id_discografica = discografica.id_discografica AND album.id_formato = formato.id_formato AND album.id_genero = genero.id_genero ORDER By genero.nombre asc"
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)

# LISTAR POR NOMBRE DE ALBUM #

    def ListarPorNombre(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                senteciaSQL = "SELECT cod_album, album.nombre, interprete.nombre, genero.nombre, discografica.nombre, precio, cantidad, formato.tipo, caratula FROM album, interprete, discografica,formato,genero WHERE album.id_interprete = interprete.id_interprete AND album.id_discografica = discografica.id_discografica AND album.id_formato = formato.id_formato AND album.id_genero = genero.id_genero ORDER By album.nombre asc"
                cursor.execute(senteciaSQL)
                resultados = cursor.fetchall()
                self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)


# LISTAR INTÉRPRETE #

    def ListarInterprete(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SELECT * from interprete"
                cursor.execute(sentenciaSQL)
                resultados = cursor.fetchall()
                # self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 


# LISTAR TEMA #

    def ListarTema(self):
            if self.conexion.is_connected():
                try:
                    cursor = self.conexion.cursor()
                    sentenciaSQL = "SELECT * from tema"
                    cursor.execute(sentenciaSQL)
                    resultados = cursor.fetchall()
                    self.conexion.close()
                    return resultados

                except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 


# LISTAR POR DISCOGRÁFICA #

    def ListarDiscografica(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SELECT * from discografica"
                cursor.execute(sentenciaSQL)
                resultados = cursor.fetchall()
                #self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)


# LISTAR POR FORMATO #

    def ListarFormato(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "SELECT * from formato"
                cursor.execute(sentenciaSQL)
                resultados = cursor.fetchall()
                #self.conexion.close()
                return resultados

            except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)


# -----------------------------------------INSERTAR------------------------------------------------------------------------

# INSERTAR INTÉRPRETE #
   
    def InsertarInterprete(self, interprete):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "INSERT into interprete values(null,%s,%s,%s)"

                data = (interprete.getNombre(),interprete.getNacionalidad(),interprete.getFoto())

                cursor.execute(sentenciaSQL,data)

                self.conexion.commit()
                self.conexion.close()
                print("Intérprete insertado correctamente")
                
            except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 

# INSERTAR TEMA #
   
    def InsertarTema(self, tema):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "INSERT into tema values(null,%s,%s,%s,%s,%s,%s)"

                data = (tema.getTitulo(),tema.getDuracion(),tema.getAutor(),tema.getCompositor(),tema.getId_album(),tema.getId_interprete())

                cursor.execute(sentenciaSQL,data)

                self.conexion.commit()
                self.conexion.close()
                print("Intérprete insertado correctamente")
                
            except mysql.connector.Error as d_Error:
                    print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 

# -----------------------------------------------------------------------------------------------------------------

# INSERTAR GENERO
   
    def InsertarGenero(self,genero):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "INSERT into genero values(null,%s)"

                data = (genero.getNombre(),)

                cursor.execute(sentenciaSQL,data)

                self.conexion.commit()
                self.conexion.close()
                print("Género insertado correctamente")

            except mysql.connector.Error as d_Error:
                        print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error) 

# -----------------------------------------------------------------------------------------------------------------

# INSERTAR ALBUM

    def InsertarAlbum(self,album):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "insert into album values (null,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"
                data = (
                album.getCod_album(),
                album.getNombre(),
                album.getId_interprete(),
                album.getId_genero(),
                album.getCant_temas(),
                album.getId_discografica(),
                album.getId_formato(),
                album.getFec_lanzamiento(),
                album.getPrecio(),
                album.getCantidad(),
                album.getCaratula())
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("Álbum insertado correctamente")        

            except mysql.connector.Error as d_Error:
                                    print("¡Ops, algo salió mal!", d_Error)

#-------------------------------------------------------------------------------------------------------------------                    

# INSERTAR FORMATO

    def InsertarFormato(self,formato):
            if self.conexion.is_connected():
                try:
                    cursor = self.conexion.cursor()
                    sentenciaSQL = "insert into formato values (null,%s);"
                    data = (
                    formato.getTipo(),
                    )
                    cursor.execute(sentenciaSQL,data)
                    self.conexion.commit()
                    self.conexion.close()
                    print("Formato insertado correctamente")        
                except mysql.connector.Error as d_Error:
                                    print("¡Ops, algo salió mal!", d_Error)


# ------------------------------------------------------------------------------------------------------------------                  

   # INSERTAR DISCOGRÁFICA

    def InsertarDiscografica(self,discografica):
            if self.conexion.is_connected():
                try:
                    cursor = self.conexion.cursor()
                    sentenciaSQL = "insert into discografica values (null,%s);"

                    data = (
                    discografica.getNombre(),
                    )

                    cursor.execute(sentenciaSQL,data)

                    self.conexion.commit()
                    self.conexion.close()
                    print("Discográfica insertada correctamente")        

                except mysql.connector.Error as d_Error:
                                    print("¡Ops, algo salió mal!", d_Error)

#-----------------------------------------ELIMINAR----------------------------------------------------------------------------------------------------------------

# ELIMINAR INTÉRPRETE

    def EliminarInterprete(self, id_interprete):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from interprete WHERE id_interprete = %s "
                data =(id_interprete,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("Intéprete eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)


#-------------------------------------------------------------------------------------------------------------------                    

# ELIMINAR GENERO

    def EliminarGenero(self, id_genero):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from genero WHERE id_genero = %s "
                data =(id_genero,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("El genero fue eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)

#-------------------------------------------------------------------------------------------------------------------

# ELIMINAR ALBUM

    def EliminarAlbum(self, cod_album):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from album WHERE cod_album = %s "
                data =(cod_album,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("Intéprete eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)


#-------------------------------------------------------------------------------------------------------------------                    

# ELIMINAR FORMATO

    def EliminarFormato(self, id_formmato):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from formato WHERE id_formato = %s "
                data =(id_formmato,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("El formato fue eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)



#-------------------------------------------------------------------------------------------------------------------


# ELIMINAR DISCOGRAFICA

    def EliminarDiscografica(self, id_discografica):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from discografica WHERE id_discografica = %s "
                data =(id_discografica,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("Discografica fue eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)


#-------------------------------------------------------------------------------------------------------------------                    

# ELIMINAR TEMA

    def EliminarTema(self, id_tema):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "DELETE from tema WHERE id_tema = %s "
                data =(id_tema,)
                cursor.execute(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()
                print("tema fue eliminado correctamente")
            except mysql.connector.Error as d_Error:
                print("No se conectó", d_Error)


#-------------------------EDITAR-------------------------------------------------------------------------

# EDITAR ALBUM

    def EditarAlbum(self,album,id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE album SET cod_album = %s, nombre= %s, id_interprete = %s, id_genero = %s, cant_temas = %s, id_discografica = %s, id_formato = %s, fech_lanzamiento = %s, precio = %s, cantidad = %s, caratula = %s WHERE id_album ="+str(id)

                data = (
                album.getCod_album(),
                album.getNombre(),
                album.getId_interprete(),
                album.getId_genero(),
                album.getCant_temas(),
                album.getId_discografica(),
                album.getId_formato(),
                album.getFec_lanzamiento(),
                album.getPrecio(),
                album.getCantidad(),
                album.getCaratula())

                cursor.execute(sentenciaSQL,data)

                self.conexion.commit()
                self.conexion.close()
                print("Álbum editado correctamente")        

            except mysql.connector.Error as d_Error:
                                print("¡Ops, algo salió mal! No se conectó a la base de datos", d_Error)

#-------------------------------------------------------------------------------------------------------------------                    

#EDITAR INTERPRETE

    def EditarInterprete(self,interprete, id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE interprete SET nombre = %s, nacionalidad = %s, foto = %s WHERE id_interprete ="+str(id) 

                data = (interprete.getNombre(),
                        interprete.getNacionalidad(),
                        interprete.getFoto())

                cursor.execute(sentenciaSQL,data)
                
                self.conexion.commit()
                self.conexion.close()
                
                print("Interprete editado correctamente")        

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal!", d_Error)

#-------------------------------------------------------------------------------------------------------------------                    

#EDITAR DISCOGRAFICA

    def EditarDiscografica (self,discografica, id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE discografica SET nombre = %s WHERE id_discografica ="+str(id) 

                data = (discografica.getNombre(), )

                cursor.execute(sentenciaSQL,data)
                
                self.conexion.commit()
                self.conexion.close()
                
                print("Discografica editado correctamente")        

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal!", d_Error)

#-------------------------------------------------------------------------------------------------------------------                    

#EDITAR FORMATO

    def EditarFormato(self,formato, id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE formato SET tipo = %s WHERE id_formato ="+str(id) 

                data = (formato.getTipo(), )

                cursor.execute(sentenciaSQL,data)
                
                self.conexion.commit()
                self.conexion.close()
                
                print("Fromato editado correctamente")        

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal!", d_Error)

#-------------------------------------------------------------------------------------------------------------------                    

#EDITAR GENERO

    def EditarGenero(self,genero, id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE genero SET nombre = %s WHERE id_genero ="+str(id) 

                data = (genero.getNombre(), )

                cursor.execute(sentenciaSQL,data)
                
                self.conexion.commit()
                self.conexion.close()
                
                print("Genero editado correctamente")        

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal!", d_Error)



#-------------------------------------------------------------------------------------------------------------------                    


#EDITAR TEMA

    def EditarTema(self,tema, id):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = "UPDATE tema SET titulo = %s, duracion = %s, autor = %s, compositor = %s, id_album  = %s, id_interprete  = %s WHERE id_tema ="+str(id) 

                data = (tema.getTitulo(),tema.getDuracion(),tema.getAutor(),tema.getCompositor(),tema.getId_album(),tema.getId_interprete())

                cursor.execute(sentenciaSQL,data)
                
                self.conexion.commit()
                self.conexion.close()
                
                print("Tema editado correctamente")        

            except mysql.connector.Error as d_Error:
                print("¡Ops, algo salió mal!", d_Error)

#---------------------------------------------------------------------------------------------------------------------------------------------------------
 
# CLASES

class Interprete():     

    def __init__(self,id_interprete, nombre, nacionalidad, foto) -> None:
        self.id_interprete = id_interprete
        self.nombre = nombre
        self.nacionalidad = nacionalidad
        self.foto = foto   


    def getId_Interprete(self):
        return self.id_interprete
    def getNombre(self):
        return self.nombre
    def getNacionalidad(self):
        return self.nacionalidad    
    def getFoto(self):
        return self.foto 


    def setId_Interprete(self,idInterprete):
        self.id_interprete = idInterprete
    def setNombre(self,nombre):
        self.nombre = nombre
    def setNacionalidad(self,nacionalidad):
        self.nacionalidad = nacionalidad 
    def setFoto(self,foto):
        self.foto = foto

    def __str__(self) -> str:
        return str(self.id_interprete)+' '+self.nombre+' '+self.nacionalidad+' '+self.foto
    
#--------------------------------------------------------------------------------------------------------

class Genero():
    def __init__(self,id_genero,nombre) -> None:
        self.id_genero = id_genero
        self.nombre = nombre

    def __str__(self) -> str:
        return str(self.id_genero)+' '+self.nombre

    def getId_genero(self):
        return self.getId_genero
    def getNombre(self):
        return self.nombre

    def setId_genero(self,id_genero):
        self.id_genero = id_genero
    def setNombre(self,nombre):
        self.nombre = nombre

#---------------------------------------------------------------------------------------------------------


class Discografica():
    def __init__(self,id_discografica,nombre) -> None:
        self.id_discografica = id_discografica
        self.nombre = nombre

    def __str__(self) -> str:
        return str(self.id_discografica)+' '+self.nombre

    def getId_discografica(self):
        return self.id_discografica
    def getNombre(self):
        return self.nombre
    
    def setId_discografica(self,id_discografica):
        self.id_discografica = id_discografica
    def setNombre(self,nombre):
        self.nombre = nombre

#---------------------------------------------------------------------------------------------------------------

class Formato():
    def __init__(self,id_formato,tipo) -> None:
        self.id_formato = id_formato
        self.tipo = tipo

    def __str__(self) -> str:
        return str(self.id_formato)+' '+self.tipo

    def getId_formato(self):
        return self.id_formato
    def getTipo(self):
        return self.tipo

    def setId_formato(self,id_formato):
        self.id_formato = id_formato
    def setTipo(self,tipo):
        self.tipo = tipo

#-----------------------------------------------------------------------------------------------------------

class Tema():
    def __init__(self,id_tema,titulo,duracion,autor,compositor,id_album,id_interprete) -> None:
        self.id_tema = id_tema
        self.titulo = titulo
        self.duracion = duracion
        self.autor = autor
        self.compositor = compositor
        self.id_album = id_album
        self.id_interprete = id_interprete
        

    def getId_tema(self):
        return self.id_tema
    def getTitulo(self):
        return self.titulo
    def getDuracion(self):
        return self.duracion
    def getAutor(self):
        return self.autor
    def getCompositor(self):
        return self.compositor
    def getId_album(self):
        return self.id_album
    def getId_interprete(self):
        return self.id_interprete

    def setId_tema(self,id_tema):
        self.id_tema = id_tema
    def setTitulo(self,titulo):
        self.titulo = titulo
    def setDuracion(self,duracion):
        self.duracion = duracion
    def setAutor(self,autor):
        self.autor = autor
    def setCompositor(self,compositor):
        self.compositor = compositor
    def setId_album(self,Id_album):
        self.id_album_album = Id_album
    def setId_interprete(self,id_interprete):
        self.id_interprete = id_interprete

    def __str__(self) -> str:
        return str(self.id_tema)+' '+self.titulo+' '+str(self.duracion)+' '+self.autor+' '+self.compositor+' '+str(self.id_album)+' '+str(self.id_interprete)

#----------------------------------------------------------------------------------------------------------------------------------------------------------------------

class Album():
    def __init__(self,id_album,Cod_album,nombre,id_interprete,id_genero,cant_temas,id_discografica,id_formato,fech_lanzamiento,precio,cantidad,caratula) -> None:
        self.id_album = id_album
        self.Cod_album = Cod_album
        self.nombre = nombre
        self.id_interprete = id_interprete
        self.id_genero = id_genero
        self.cant_temas = cant_temas
        self.id_discografica = id_discografica
        self.id_formato = id_formato
        self.fech_lanzamiento = fech_lanzamiento
        self.precio = precio
        self.cantidad = cantidad
        self.caratula = caratula

    def getId_album(self):
        return self.id_album
    def getCod_album(self):
        return self.Cod_album
    def getNombre(self):
        return self.nombre
    def getId_interprete(self):
        return self.id_interprete
    def getId_genero(self):
        return self.id_genero
    def getCant_temas(self):
        return self.cant_temas
    def getId_discografica(self):
        return self.id_discografica
    def getId_formato(self):
        return self.id_formato
    def getFec_lanzamiento(self):
        return self.fech_lanzamiento
    def getPrecio(self):
        return self.precio
    def getCantidad(self):
        return self.cantidad
    def getCaratula(self):
        return self.caratula

    def setId_album(self,id_album):
        self.id_album = id_album
    def setCod_album(self,Cod_album):
        self.Cod_album = Cod_album
    def setNombre(self,nombre):
        self.nombre = nombre
    def setId_interprete(self,id_interprete):
        self.id_interprete = id_interprete
    def setId_genero(self,id_genero):
        self.id_genero = id_genero
    def setCant_temas(self,cant_temas):
        self.cant_temas = cant_temas
    def setId_discografica(self,id_discografica):
        self.id_discografica = id_discografica
    def setId_formato(self,id_formato):
        self.id_formato = id_formato
    def setFec_lanzamiento(self,fech_lanzamiento):
        self.fech_lanzamiento = fech_lanzamiento
    def setPrecio(self,precio):
        self.precio = precio
    def setCantidad(self,cantidad):
        self.cantidad = cantidad
    def setCaratula(self,caratula):
        self.caratula = caratula

def __str__(self) -> str:
        return str(self.id_album) +' '+ str(self.Cod_album) +' '+ self.nombre +' '+ str(self.id_interprete) +' '+ str(self.id_genero) +' '+ str(self.cant_temas) +' '+ str(self.id_discografica) +' '+ str(self.id_formato) +' '+ self.fech_lanzamiento +' '+ str(self.precio) +' '+ str(self.cantidad) +' '+ self.caratula

#-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#con = Conectar()
#print(con.ListarAlbumes())
#con.EditarDiscografica ("discos del norte",id=2)
#con.ListarFormato()
#con.EliminarDiscografica(8)
# con.InsertarInterprete('Luis Alberto Spinetta', 'Argentina', '')
#con.TraerInterprete(4)

# for interprete in con.ListarInterprete():
#  print(interprete)


#for album in con.ListarAlbum():
    #print(album)


#idint = int(input("\nIngrese el id del Album: "))
#nombreint = input("\nIngrese el nombre del album: ")
#nacinalidad = input("\nNacionalidad: ")
#foto = input("\nFoto: ")
#nuevoint = Interprete(0, nombreint, nacinalidad, foto)
#con.EditarInterprete(nuevoint, idint)

#for album in con.ListarInterprete():
#  print(album)

# for genero in con.ListarPorGenero():
#     print(genero)


# for tema in con.ListarTema():
#  print(tema)



# for discografica in con.ListarDiscografica():
#     print(discografica)


# for formato in con.ListarFormato():
#     print(formato)
