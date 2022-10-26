import controlador

while True:
    print("\n+-------------------------------------------+")
    print("|         DISQUERÍA MUSICAL PLANETA         |")
    print("+-------------------------------------------+\n")
    print("")
    print("MENÚ PRINCIPAL\n")
    print("1 - INSERTAR ÁLBUM")
    print("2 - INSERTAR INTÉRPRETE")
    print("3 - INSERTAR DISCOGRÁFICA")
    print("4 - INSERTAR TEMA")
    print("5 - INSERTAR FORMATO")
    print("6 - LISTADO DE ÁLBUMES POR ARTISTAS")
    print("7 - LISTADO DE ÁLBUMES POR GÉNERO MUSICAL")
    print("8 - SALIR")
    print("\n")
    opcion = int(input("Ingrese su opción: "))

    if opcion == 1:
        controlador.InsertarAlbum()
    elif opcion == 2:
        controlador.InsertarInterprete()
    elif opcion == 3:
        controlador.InsertarDiscografica()
    elif opcion == 4:
        controlador.InsertarTema()
    elif opcion == 5:
        controlador.InsertarFormato()    
    elif opcion == 6:
        controlador.ListarAlbumesPorArtistas()
    elif opcion == 7:
        controlador.ListarAlbumesPorGenero()
    elif opcion == 8:
        break    
    else:
        print("¡Opción incorrecta!")