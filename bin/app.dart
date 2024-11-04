import 'package:mysql1/mysql1.dart';
import 'dart:io';
import 'Pasajeros.dart';

class app {
  menuInicial() async {
    int? opcion;
    do {
      stdout.writeln('''Elige una opción
      1 - Registrarte
      2 - Log in''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while (_menuinicialrespuestanovalida(opcion));
    switch (opcion) {
      case 1:
        await registrarpasajero();
        break;
    }
  }

  registrarpasajero() async {
    Pasajero pasajero = Pasajero();
    stdout.write(
        '''Hola, bienvenido estas apunto de resgistrarte en este centro de aereolineas, porfavor
      rellene estos datos:''');
    stdout.write('1- nombre:');
    pasajero.nombre = stdin.readLineSync();
    stdout.write('2-apelido:');
    pasajero.apellido = stdin.readLineSync();
    stdout.write('3-contraseña:');
    pasajero.password = stdin.readLineSync();
    stdout.write('4-direccion:');
    pasajero.direccion = stdin.readLineSync();
    stdout.write('5-direccioncorreo:');
    pasajero.direccioncorreo = stdin.readLineSync();
    stdout.write('6-dni:');
    pasajero.direccioncorreo = stdin.readLineSync();
    stdout.write('7-telefono:');
    pasajero.direccioncorreo = stdin.readLineSync();

    await pasajero.insertarUsuario();
  }
}

//Parsear Respuestas
bool _menuinicialrespuestanovalida(var opcion) =>
    opcion == null || opcion != 1 && opcion != 2 && opcion != 3;
bool _menulogueadorespuestanovalida(var opcion) =>
    opcion == null || opcion != 1 && opcion != 2 && opcion != 3 && opcion != 4;
int? parsearrespuesta() => int.tryParse(stdin.readLineSync() ?? 'e');
