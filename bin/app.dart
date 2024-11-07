import 'package:mysql1/mysql1.dart';
import 'dart:io';
import 'Pasajeros.dart';
import 'Vuelo.dart';

class app {
  menuInicial() async {
    int? opcion;
    do {
      stdout.writeln('''Elige una opción
      1 - Registrarte
      2 - Log in                            //poner comprar vuelo dentro del login pero primero arreglar lo de los pasajeros
      3 - Comprar vuelo
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
      case 3:
        await comprarvuelo();
    }
  }

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

  comprarvuelo() async {
    Vuelo vuelo = Vuelo();
    stdout.write(
        '''Hola, bienvenido estas apunto de resgistrarte en este centro comercial, porfavor
      rellene estos datos:''');
    stdout.write('1- origen:');
    vuelo.origen = stdin.readLineSync();
    stdout.write('2-destino:');
    vuelo.destino = stdin.readLineSync();
    stdout.write('3-fecha:');
    vuelo.fecha;
    stdout.write('4-horasalida:');
    vuelo.horasalida;
  }

//Parsean opciones
  bool _menuinicialrespuestanovalida(var opcion) =>
      opcion == null || opcion != 1 && opcion != 2 && opcion != 3;
  bool _menulogueadorespuestanovalida(var opcion) =>
      opcion == null ||
      opcion != 1 && opcion != 2 && opcion != 3 && opcion != 4;
  int? parsearrespuesta() => int.tryParse(stdin.readLineSync() ?? 'e');
}
