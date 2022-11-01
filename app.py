from flask import Flask, flash
from flask import render_template,redirect,request, flash, url_for
import model


app= Flask(__name__)
app.config['SECRET_KEY'] = '7110c8ae51a4b5af97be6534caef90e4bb9bdcb3380af008f90b23a5d1616bf319bc298105da20fe'

#------------------INICIO----------------------------------------------------------------------

@app.route('/')
def Index():
    page = "Albums"

    return render_template('index.html', page = page)

#------------------CONTACTO----------------------------------------------------------------------

@app.route('/Contacto')
def Contacto():
    page = "Albums"

    return render_template('/contacto.html', page = page)  

#------------------Opciones----------------------------------------------------------------------

@app.route('/Opciones')
def Opciones():
    page = "Albums"

    return render_template('/opciones.html', pages = page)

#------------------ALBUMS----------------------------------------------------------------------

@app.route('/Album/ListarPorArtista')
def list():
    con = model.Conectar()
    listado = con.ListarAlbumes()
    page = "Albums"
    return render_template('Albums/list.html',listado=listado,page=page)

@app.route('/Album/ListarPorGenero')
def ListAlbumGenero():
    con = model.Conectar()
    page = "Albums"
    listado = con.ListarPorGenero()
    
    return render_template('Albums/list.html',listado=listado,page=page)

@app.route('/Album/ListarPorNombre')
def ListAlbumNombre():
    con = model.Conectar()
    page = "Albums"
    listado = con.ListarPorNombre()
    
    return render_template('Albums/list.html',listado=listado,page=page)    
   
@app.route('/ListarPorInterprete')
def ListByInterprete():
    con = model.Conectar()
    page = "Albums"
    listado = con.ListarAlbumes()
    
    return render_template('Albums/list.html',listado=listado,page=page)  

@app.route('/Album/destroy/<int:cod_album>')
def destroyAlbum(cod_album):
    con = model.Conectar()
    a = model.Conectar()
    data = a.TraerAlbum(cod_album)
    id = data[0]
    con.EliminarAlbum(id)
    return redirect('/Album/ListarPorArtista')

@app.route('/Album/Create')
def createAlbum():
    page = "Albums"
    i = model.Conectar()
    g = model.Conectar()
    d = model.Conectar()
    f = model.Conectar()
    interpretes = i.ListarInterprete()
    generos = g.ListarGenero()
    discograficas = d.ListarDiscografica()
    formatos = f.ListarFormato()
    return render_template('Albums/create.html', interpretes=interpretes, generos=generos, discograficas=discograficas, formatos=formatos, page=page)

@app.route('/Album/save-new', methods=["GET", "POST"])
def saveNewAlbum():
    cod_album = request.form['codAlbum']
    nombre = request.form['nombre']

    con = model.Conectar()

    id_discografica = request.form['discografica']
    id_genero = request.form['genero']
    id_interprete = request.form['interprete']
    cant_temas = request.form['cantTemas']
    id_formato = request.form['formato']
    fech_lanzamiento = request.form['fecha']
    precio = request.form['precio']
    cantidad = request.form['cantidad']
    caratula = request.form['caratula']

    nuevoAlbum = model.Album(0,cod_album,nombre,id_interprete,id_genero,cant_temas,id_discografica,id_formato,fech_lanzamiento,precio,cantidad,caratula)
    con.InsertarAlbum(nuevoAlbum)
    return redirect('/Album/ListarPorArtista')

@app.route('/Album/edit/<int:cod_album>')
def editAlbum(cod_album):
    con = model.Conectar()
    page = "Albums"
    i = model.Conectar()
    g = model.Conectar()
    d = model.Conectar()
    f = model.Conectar()

    album = con.TraerAlbum(cod_album)
    interpretes = i.ListarInterprete()
    generos = g.ListarGenero()
    discograficas = d.ListarDiscografica()
    formatos = f.ListarFormato()
    return render_template('Albums/edit.html',album=album, interpretes=interpretes, generos=generos, discograficas=discograficas, formatos=formatos,page=page)

@app.route('/Album/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditAlbum(id):
    cod_album = request.form['codAlbum']
    nombre = request.form['nombre']

    con = model.Conectar()


    id_discografica = request.form['discografica']
    id_genero = request.form['genero']
    id_interprete = request.form['interprete']
    cant_temas = request.form['cantTemas']
    id_formato = request.form['formato']
    fech_lanzamiento = request.form['fecha']
    precio = request.form['precio']
    cantidad = request.form['cantidad']
    caratula = request.form['caratula']

    editAlbum = model.Album(0,cod_album,nombre,id_interprete,id_genero,cant_temas,id_discografica,id_formato,fech_lanzamiento,precio,cantidad,caratula)
    con.EditarAlbum(editAlbum,id)
    return redirect('/Album/ListarPorArtista')

#------------------INTERPRETES-----------------------------------------------------------------

@app.route('/Interprete/Listar')
def ListInterprete():
    con = model.Conectar()
    page = "Interpretes"
    listado = con.ListarInterprete()
    
    return render_template('Interpretes/list.html',listado=listado,page=page)    

@app.route('/Interprete/destroy/<int:id>')
def destroyInterprete(id):
    con = model.Conectar()
    con.EliminarInterprete(id)
    return redirect('/Interprete/Listar')

@app.route('/Interprete/Create')
def createInterprete():
    page = "Interpretes"
    return render_template('Interpretes/create.html', page=page)

@app.route('/Interprete/save-new', methods=["GET", "POST"])
def saveNewInterprete():


    con = model.Conectar()

    nombre = request.form['nombre']
    nacionalidad = request.form['nacionalidad']
    foto = request.form['foto']


    nuevoInterprete = model.Interprete(0,nombre,nacionalidad,foto)
    con.InsertarInterprete(nuevoInterprete)
    return redirect('/Interprete/Listar')


@app.route('/Interprete/edit/<int:id>')
def editInterprete(id):
    page = "Interpretes"

    con = model.Conectar()
    interprete = con.TraerInterprete(id)
    
    return render_template('Interpretes/edit.html',page=page, interprete = interprete)

@app.route('/Interprete/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditInterprete(id):

    con = model.Conectar()

    nombre = request.form['nombre']
    nacionalidad = request.form['nacionalidad']
    foto = request.form['foto']


    EditInterprete = model.Interprete(0,nombre,nacionalidad,foto)


    con.EditarInterprete(EditInterprete,id)
    return redirect('/Interprete/Listar')

#------------------GENEROS-----------------------------------------------------------------

@app.route('/Genero/Listar')
def ListGenero():
    con = model.Conectar()
    page = "Generos"
    listado = con.ListarGenero()
    
    return render_template('Generos/list.html',listado=listado,page=page)    

@app.route('/Genero/destroy/<int:id>')
def destroyGenero(id):
    con = model.Conectar()
    con.EliminarGenero(id)
    return redirect('/Genero/Listar')

@app.route('/Genero/Create')
def createGenero():
    page = "Generos"
    return render_template('Generos/create.html', page=page)

@app.route('/Genero/save-new', methods=["GET", "POST"])
def saveNewGenero():


    con = model.Conectar()

    nombre = request.form['nombre']



    nuevoGenero = model.Genero(0,nombre)
    con.InsertarGenero(nuevoGenero)
    return redirect('/Genero/Listar')


@app.route('/Genero/edit/<int:id>')
def editGenero(id):
    page = "Generos"

    con = model.Conectar()
    Genero = con.TraerGenero(id)
    
    return render_template('Generos/edit.html',page=page, Genero = Genero)

@app.route('/Genero/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditGenero(id):

    con = model.Conectar()

    nombre = request.form['nombre']


    EditGenero = model.Genero(0,nombre)


    con.EditarGenero(EditGenero,id)
    return redirect('/Genero/Listar')

#------------------DISCOGRAFICA-----------------------------------------------------------------

@app.route('/Discografica/Listar')
def ListDiscografica():
    con = model.Conectar()
    page = "Discograficas"
    listado = con.ListarDiscografica()
    
    return render_template('Discograficas/list.html',listado=listado,page=page)    

@app.route('/Discografica/destroy/<int:id>')
def destroyDiscografica(id):
    con = model.Conectar()
    con.EliminarDiscografica(id)
    return redirect('/Discografica/Listar')

@app.route('/Discografica/Create')
def createDiscografica():
    page = "Discograficas"
    return render_template('Discograficas/create.html', page=page)

@app.route('/Discografica/save-new', methods=["GET", "POST"])
def saveNewDiscografica():


    con = model.Conectar()

    nombre = request.form['nombre']



    nuevoDiscografica = model.Discografica(0,nombre)
    con.InsertarDiscografica(nuevoDiscografica)
    return redirect('/Discografica/Listar')


@app.route('/Discografica/edit/<int:id>')
def editDiscografica(id):
    page = "Discograficas"

    con = model.Conectar()
    Discografica = con.TraerDiscografica(id)
    
    return render_template('Discograficas/edit.html',page=page, Discografica = Discografica)

@app.route('/Discografica/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditDiscografica(id):

    con = model.Conectar()

    nombre = request.form['nombre']


    EditDiscografica = model.Discografica(0,nombre)


    con.EditarDiscografica(EditDiscografica,id)
    return redirect('/Discografica/Listar')

#------------------FORMATO-----------------------------------------------------------------

@app.route('/Formato/Listar')
def ListFormato():
    con = model.Conectar()
    page = "Formatos"
    listado = con.ListarFormato()
    
    return render_template('Formatos/list.html',listado=listado,page=page)    

@app.route('/Formato/destroy/<int:id>')
def destroyFormato(id):
    con = model.Conectar()
    con.EliminarFormato(id)
    return redirect('/Formato/Listar')

@app.route('/Formato/Create')
def createFormato():
    page = "Formatos"
    return render_template('Formatos/create.html', page=page)

@app.route('/Formato/save-new', methods=["GET", "POST"])
def saveNewFormato():


    con = model.Conectar()

    nombre = request.form['nombre']



    nuevoFormato = model.Formato(0,nombre)
    con.InsertarFormato(nuevoFormato)
    return redirect('/Formato/Listar')


@app.route('/Formato/edit/<int:id>')
def editFormato(id):
    page = "Formatos"

    con = model.Conectar()
    Formato = con.TraerFormato(id)
    
    return render_template('Formatos/edit.html',page=page, Formato = Formato)

@app.route('/Formato/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditFormato(id):

    con = model.Conectar()

    nombre = request.form['nombre']

    EditFormato = model.Formato(0,nombre)


    con.EditarFormato(EditFormato,id)
    return redirect('/Formato/Listar')

#------------------TEMA------------------------------------------------------------------------

@app.route('/Tema/Listar')
def ListTemaNombre():
    con = model.Conectar()
    page = "Temas"
    list = con.ListarTema()
    listado = []
    for item in list:
        a_con = model.Conectar()
        album = a_con.TraerAlbumByID(item[5])
        i_con = model.Conectar()
        interprete = i_con.TraerInterprete(item[6])

        new = [item[0],item[1],item[2],item[3],item[4],album[2],interprete[1]]
        listado.append(new)

    
    return render_template('Temas/list.html',listado=listado,page=page)    

@app.route('/Tema/destroy/<int:id>')
def destroyTema(id):
    con = model.Conectar()
    con.EliminarTema(id)
    return redirect('/Tema/Listar')

@app.route('/Tema/Create')
def createTema():
    page = "Temas"
    i = model.Conectar()
    a = model.Conectar()

    interpretes = i.ListarInterprete()
    albums = a.ListarAlbumesCompleto()


    return render_template('Temas/create.html', interpretes=interpretes,albums = albums, page=page)

@app.route('/Tema/save-new', methods=["GET", "POST"])
def saveNewTema():

    con = model.Conectar()

    titulo = request.form['titulo']
    duracion = request.form['duracion']
    autor = request.form['autor']
    compositor = request.form['compositor']
    album = request.form['album']
    interprete = request.form['interprete']


    nuevoTema = model.Tema(0,titulo,duracion,autor,compositor,album,interprete)
    con.InsertarTema(nuevoTema)
    return redirect('/Tema/Listar')

@app.route('/Tema/edit/<int:id>')
def editTema(id):
    page = "Temas"

    i = model.Conectar()
    a = model.Conectar()
    t = model.Conectar()

    interpretes = i.ListarInterprete()
    albums = a.ListarAlbumesCompleto()
    tema = t.TraerTema(id)
   

    return render_template('Temas/edit.html', interpretes=interpretes,albums = albums, tema = tema, page=page)

@app.route('/Tema/save-edit/<int:id>', methods=["GET", "POST"])
def saveEditTema(id):
    con = model.Conectar()

    titulo = request.form['titulo']
    duracion = request.form['duracion']
    autor = request.form['autor']
    compositor = request.form['compositor']
    album = request.form['album']
    interprete = request.form['interprete']


    editTema = model.Tema(0,titulo,duracion,autor,compositor,album,interprete)
    con.EditarTema(editTema,id)
    return redirect('/Tema/Listar')


#------------------BUSCAR----------------------------------------------------------------------

@app.route('/search/<string:page>', methods=["GET", "POST"])
def buscar(page):
    newPage = page

    var = request.form['buscar']

    con = model.Conectar()
    if(page == 'Albums'):
        listado = con.ListarAlbumes()
    elif(page == 'Interpretes'):
        listado = con.ListarInterprete()
    elif(page == 'Generos'):
        listado = con.ListarGenero()
    elif(page == 'Temas'):
        listado = con.ListarTema()
    elif(page == 'Discograficas'):
        listado = con.ListarDiscografica()
    elif(page == 'Formatos'):
        listado = con.ListarFormato()

    items = []
    
    for item in listado:
        if(var.lower().replace(" ", "").replace('á','a').replace('é','e').replace('í','i').replace('ó','o').replace('ú','u') in item[1].lower().replace(" ", "").replace('á','a').replace('é','e').replace('í','i').replace('ó','o').replace('ú','u')):
            items.append(item)

    vacio = len(items) == 0
    
    return render_template(page+'/list.html',listado=items,var = var,page=newPage,vacio=vacio)

if __name__ == '__main__':
    app.run(debug=True)
