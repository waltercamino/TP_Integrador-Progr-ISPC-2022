from urllib import request
from flask import Flask
from flask import render_template,redirect,request
import model


app= Flask(__name__)

@app.route('/')
def list():
    con = model.Conectar()
    listado = con.ListarAlbumes()
    
    return render_template('Albums/list.html',listado=listado)

@app.route('/ListarPorGenero')
def ListGenero():
    con = model.Conectar()
    listado = con.ListarPorGenero()
    
    return render_template('Albums/list.html',listado=listado)

@app.route('/ListarPorNombre')
def ListNombre():
    con = model.Conectar()
    listado = con.ListarPorNombre()
    
    return render_template('Albums/list.html',listado=listado)    

@app.route('/destroy/<int:cod_album>')
def destroy(cod_album):
    con = model.Conectar()
    con.EliminarAlbum(cod_album)
    return redirect('/')




@app.route('/create')
def create():
    i = model.Conectar()
    g = model.Conectar()
    d = model.Conectar()
    f = model.Conectar()
    interpretes = i.ListarInterprete()
    generos = g.ListarGenero()
    discograficas = d.ListarDiscografica()
    formatos = f.ListarFormato()
    return render_template('Albums/create.html', interpretes=interpretes, generos=generos, discograficas=discograficas, formatos=formatos)

@app.route('/save-new', methods=["GET", "POST"])
def saveNew():
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
    return redirect('/')

@app.route('/edit/<int:cod_album>')
def edit(cod_album):
    con = model.Conectar()
    i = model.Conectar()
    g = model.Conectar()
    d = model.Conectar()
    f = model.Conectar()

    album = con.TraerAlbum(cod_album)
    interpretes = i.ListarInterprete()
    generos = g.ListarGenero()
    discograficas = d.ListarDiscografica()
    formatos = f.ListarFormato()
    return render_template('Albums/edit.html',album=album, interpretes=interpretes, generos=generos, discograficas=discograficas, formatos=formatos)

@app.route('/save-edit/<int:id>', methods=["GET", "POST"])
def saveEdit(id):
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
    return redirect('/')

@app.route('/search', methods=["GET", "POST"])
def buscarAlbum():
    var = request.form['buscar']

    con = model.Conectar()
    listado = con.ListarAlbumes()
    items = []

    for item in listado:
        if(var.lower().replace(" ", "") in item[1].lower().replace(" ", "")):
            items.append(item)

    return render_template('Albums/list.html',listado=items,var = var)

if __name__ == '__main__':
    app.run(debug=True)