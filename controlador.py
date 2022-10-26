import model

# LISTAR ALBUMES POR ARTISTAS

def ListarAlbumesPorArtistas():
    con = model.Conectar()
    listado = con.ListarAlbumes()
    print("\n| COD. ÁLBUM   |          NOMBRE              |       INTERPRETE              |   GENERO   |     DISCOGRAFICA   |   PRECIO   |   CANTIDAD   |  FORMATO   |")
    for album in listado:
        print(' ',album[0],"\t",album[1],"\t\t",album[2]+' '+album[3],"\t\t  ",album[4])
    input("Presione ENTER para continuar")

# LISTAR ALBUMES POR GENERO

def ListarAlbumesPorGenero():
    con = model.Conectar()
    listado = con.ListarPorGenero()
    print("\n| COD. ÁLBUM   |          NOMBRE              |       INTERPRETE              |   GENERO   |     DISCOGRAFICA   |   PRECIO   |   CANTIDAD   |  FORMATO   |")
    for album in listado:
        print(' ',album[0],"\t",album[1],"\t\t",album[2]+' '+album[3],"\t\t  ",album[4])
    input("Presione ENTER para continuar")

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# INSERTAR ALBUM

def InsertarAlbum():
    cod_album = int(input("\nIngrese el código del nuevo Álbum: "))
    nombre = input("Ingrese el nombre del álbum: ")

    con = model.Conectar()

    print("\nIntérpretes Disponibles:")

    for i in con.ListarInterprete():
        print(i)
    id_interprete = int(input("\nIngrese el ID del Intérprete: "))
    
    print("\nGénero")
    for g in con.ListarGenero():
        print(g)
    id_genero = int(input("\nIngrese el ID del Género: "))

    cant_temas = int(input("\nIngrese la cantidad de temas: "))

    print("\nDiscográfica")
    for d in con.ListarDiscografica():
        print(d)
    id_discografica = int(input("\nIngrese el ID de la discografica: "))

    print("\nFormato")
    for f in con.ListarFormato():
        print(f)
        
    id_formato = int(input("\nIngrese el ID del formato: "))
    fech_lanzamiento = input("\nIngrese la Fecha de Lanzamiento (aaaa-mm-dd): ")
    precio = float(input("\nIngrese el precio: "))
    cantidad = int(input("\nIngrese cantidad disponible de este álbum: "))
    caratula = input("\nIngrese la dirección web de la Carátula: ")

    nuevoAlbum = model.Album(0,cod_album,nombre,id_interprete,id_genero,cant_temas,id_discografica,id_formato,fech_lanzamiento,precio,cantidad,caratula)
    con.InsertarAlbum(nuevoAlbum)
    input("Presione ENTER para continuar")



# INSERTA INTÉPRETE 

def InsertarInterprete():

    nombre = input("Ingrese el nombre del nuevo intéprete: ")

    con = model.Conectar()
    
    nacionalidad = input("\nIngrese la nacionalidad del nuevo intérprete: ")

    foto = input("\nIngrese la dirección web de la Carátula: ")

    nuevoInterprete = model.Interprete(0,nombre,nacionalidad,foto)
    con.InsertarInterprete(nuevoInterprete)
    input("Presione ENTER para continuar")




# INSERTAR DISCOGRÁFICA


def InsertarDiscografica():

    nombre = input("Ingrese el nombre de la nueva discográfica: ")

    con = model.Conectar()

    nuevaDiscografica = model.Discografica(0,nombre,)
    con.InsertarDiscografica(nuevaDiscografica)
    input("Presione ENTER para continuar")



# INSERTAR TEMA


def InsertarTema():

    titulo = input("Ingrese el nombre del tema: ")
    duracion = int(input("\nIngrese la duración del tema: "))
    autor = input("\nIngrese el autor del tema: ")
    compositor = input("\nIngrese el compositor del tema: ")

    con = model.Conectar()

    print("\nAlbumes Disponibles:")
    for a in con.ListarAlbumes():
        print(a)
    id_album = int(input("\nIngrese el ID del Album: "))
    
    con = model.Conectar()

    print("\nIntérpretes Disponibles:")
    for i in con.ListarInterprete():
        print(i)
    id_interprete = int(input("\nIngrese el ID del Intérprete: "))

    nuevoTema = model.Tema(0, titulo, duracion, autor, compositor, id_album, id_interprete)
    con.InsertarTema(nuevoTema)
    input("Presione ENTER para continuar")



# INSERTAR FORMATO


def InsertarFormato():

    tipo = input("Ingrese el nombre del nuevo formato: ")

    con = model.Conectar()

    nuevoFormato = model.Formato(0,tipo)
    con.InsertarFormato(nuevoFormato)
    input("Presione ENTER para continuar")
