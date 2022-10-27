import model


def listarAlbumes():
    con = model.Conectar()

    #se llama a la funcion listar y se almacenan en una variable
    listado = con.ListarAlbumes()

    #por cada elemento en el listado se imprime en la consola, 
    #con la interfaz grafica este paso no es necesario ya que se pasan los datos directamente al archivo HTML
    for item in listado:
        print(item)

def InsertarAlbum():
    #El codigo de album se inserta manualmente para evitar que se repita
    codigo = int(input("Ingrese el codigo del nuevo album: "))

    #Se crea un objeto de la clase Conectar
    con = model.Conectar()

    #Se crea un objeto de la clase Album
    album = model.Album(0,codigo,"Album modelo",1,1,5,1,1,"2022-10-26",500,10,"https://github.com/AaronRWCortez/Portfolio-Imagenes-YoProgramo/blob/main/Acerca-De/Default-Perfil.jpg?raw=true")
    
    #Se llama al metodo Insertar album enviando el nuevo album como parametro
    con.InsertarAlbum(album)

def TraerAlbum():
    cod_Album = int(input("Ingrese el codigo del album deseado: "))
    con = model.Conectar()
    album = con.TraerAlbum(cod_Album)
    print(album)


def EliminarAlbum():
    cod_Album = int(input("Ingrese el codigo del album a eliminar: "))
    con = model.Conectar()
    con.EliminarAlbum(cod_Album)

def EditarAlbum():
    #Se usa ID porque es un valor que no cambia
    ID = int(input("Ingrese el ID del album a editar: "))

    #El codigo de album se inserta manualmente para evitar que se repita
    codigo = int(input("Ingrese el nuevo codigo para el album: "))

    con = model.Conectar()

    album = model.Album(0,codigo,"Album modelo Editado",1,1,5,1,1,"2022-10-26",500,10,"https://github.com/AaronRWCortez/Portfolio-Imagenes-YoProgramo/blob/main/Acerca-De/Default-Perfil.jpg?raw=true")
    #Creamos un objeto de la cales album y lo pasamos como parametro junto con el ID para que se haga un update
    con.EditarAlbum(album,ID)



#------ ejecutar ------#
#listarAlbumes()

#EliminarAlbum()
#InsertarAlbum()
#EditarAlbum()
#TraerAlbum()
