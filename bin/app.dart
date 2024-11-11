import 'package:mysql1/mysql1.dart';
import 'dart:io';
import'dart:math';
import 'Pasajeros.dart';
import 'Vuelo.dart';
import 'Billete.dart';

class app {

  menuInicial() async {
    //Al iniciarse la app se nos abrira un switch en el cual podemos 
    //elegir si registrarnos o loguearnos, a partir de el inicio de sesion,
    //podemos comprar un vuelo.
    int? opcion;
    do {
      stdout.writeln('''Elige una opción
      1 - Registrarte
      2 - Log in                        
      
      ''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while (_menuinicialrespuestanovalida(opcion));
    switch (opcion) {
      case 1:
        await registrarpasajero();
        break;
      case 2:
        await menuLogueado(Vuelo());
         await comprarvuelo();
      default :
        print('elige una de las dos opciones de antes');
        return menuLogueado(Vuelo);
      }
        
    }
  }
  //menu de inicio de sesion
  menuLogueado(vuelo) async {
    int? opcion;
    do {
      stdout.writeln('''Hola, elige una opción
      1 - comprar vuelo 
      2 - salir
      ''');
      opcion = parsearrespuesta();
    } while (_menulogueadorespuestanovalida(opcion));
    switch (opcion) {
      case 1:
        comprarvuelo();
        break;
      case 2:
        print('adios!');
        break;
    }
  }
  //registro de un pasajero
  registrarpasajero() async {
    
    Pasajero vuelo = Pasajero();
    stdout.write(
        '''Hola, bienvenido estas apunto de resgistrarte en este centro comercial, porfavor
      rellene estos datos:''');
    stdout.write('1- nombre:');
    vuelo.nombre = stdin.readLineSync();
    stdout.write('2-apellido:');
    vuelo.apellido = stdin.readLineSync();
    stdout.write('3-password:');
    vuelo.password = stdin.readLineSync();
    stdout.write('4-direccion:');
    vuelo.direccion = stdin.readLineSync();
    stdout.write('5-direccioncorreo:');
    vuelo.direccioncorreo = stdin.readLineSync();
    stdout.write('6-dni:');
    vuelo.dni = stdin.readLineSync();
    stdout.write('7-telefono:');
    vuelo.telefono = stdin.readLineSync();

    await vuelo.insertarpasajero();
  }
  //Aqui compramos un vuelo
  comprarvuelo() async {
    do{
    Vuelo vuelo = Vuelo();
    // pedir origen
  stdout.write('1- Origen: ');
  vuelo.origen = stdin.readLineSync();

  // pedir destino
  stdout.write('2- Destino: ');
  vuelo.destino = stdin.readLineSync();

  // pedir fecha
DateTime? fechaIngresada;
  while (fechaIngresada == null) {
    stdout.write('3- Fecha (por ejemplo, 2024-11-08): ');
    String? fechaStr = stdin.readLineSync();
    if (fechaStr != null) {
      try {
        fechaIngresada = DateTime.parse(fechaStr); // Intenta convertir el string en DateTime
      } catch (e) {
        print('Error: Fecha inválida. Por favor, usa el formato yyyy-MM-dd.');
      }
       }
  vuelo.fecha = fechaIngresada;

  // pedimos hora de salida
  DateTime? horaSalidaIngresada;
  vuelo.horasalida = horaSalidaIngresada;
  while (horaSalidaIngresada == null) {
    stdout.write('4- Hora de salida (por ejemplo, 15:30): ');
    String? horaStr = stdin.readLineSync();
    if (horaStr != null) {
      try {
        
        DateTime parsedHora = DateTime.parse('2024-01-01 $horaStr:00'); 
        horaSalidaIngresada = DateTime(
          parsedHora.year,
          parsedHora.month,
          parsedHora.day,
          parsedHora.hour,
          parsedHora.minute,
        );
      } catch (e) {
        print('Error: Hora inválida. Por favor, usa el formato HH:mm.');
      }
    
  
  vuelo.horasalida = horaSalidaIngresada;

  // Muestra los datos ingresados 
  print('\nDatos del vuelo ingresados:');
  print('Origen: ${vuelo.origen}');
  print('Destino: ${vuelo.destino}');
  print('Fecha: ${vuelo.fecha?.toLocal()}');
  print('Hora de salida: ${vuelo.horasalida?.toLocal()}');
  int?horallegada;

  print("La hora de llegada del vuelo es: ${horallegada.hora}:${horallegada.minutos.toString()}");


// genera una hora aleatoria
DateTime generarhoraaleatoria() {
  Random random = Random();
  int hora = random.nextInt(24);
  int minutos = random.nextInt(60); 
  DateTime ahora = DateTime.now();
  return DateTime(ahora.year, ahora.month, ahora.day, hora, minutos);
}

  
//genera un asiento ramdom despues de haber ingresado todos los datos
generarasiento()async{
  List<List<String>> asientos = [];
  Random random = Random();
  int filaAleatoria = random.nextInt(20); // genera un número 
  int columnaAleatoria = random.nextInt(6); // genera un número 

  // devuelve el asiento aleatorio
  return asientos[filaAleatoria][columnaAleatoria];
}

}
  }
    
  
  //registra un billete a partir de los datos anteriormente dados(vuelo)
  registrarbillete(comprarvuelo()){
    String? respuesta;
    do{
      stdout.write('inserta tu nombre:');
      respuesta= stdin.readLineSync()?? 'e';
      String nombre = (respuesta);

    }while(respuesta ==null);
     do{
      stdout.write('inserta tu apellido:');
      respuesta= stdin.readLineSync()?? 'e';
      String nombre = (respuesta);

    }while(respuesta ==null);
    stdout.writeln('Vale ahora registraremos su billete y le diremos a la hora que llega el vuelo');
    stdout.writeln('Generando billete...');
     Future.delayed(Duration(seconds: 3), () {
    print('Billete generado!');

  });
  return({$vuelo,$pasajero});
  }
   Billete comprarBillete({
    required Vuelo? vuelo,
    required String? pasajero,
    required double? precio,
  }) {
    // procesa la compra del billete
    print("Compra de billete realizada para el vuelo de ${vuelo.origen} a ${vuelo.destino}.");
    print("Pasajero: $pasajero, Precio:$precio");
      return Billete(vuelo: vuelo, pasajero: pasajero, precio: precio);

  }
    }
    
 
    }
  }

  
//Parsea opciones
  bool _menuinicialrespuestanovalida(var opcion) =>
      opcion == null || opcion != 1 && opcion != 2 && opcion != 3;
  bool _menulogueadorespuestanovalida(var opcion) =>
      opcion == null ||
      opcion != 1 && opcion != 2 && opcion != 3 && opcion != 4;
  int? parsearrespuesta() => int.tryParse(stdin.readLineSync() ?? 'e');

  
    