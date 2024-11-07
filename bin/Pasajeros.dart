import 'dart:io';
import 'app.dart';
import 'database.dart';

class Pasajero {
  //propiedades
  int? idpasajero;
  String? nombre;
  String? apellido;
  String? password;
  String? direccion;
  String? direccioncorreo;
  String? dni;
  String? telefono;

  //Constructor
  Pasajero();
  Pasajero.fromMap(map) {
    this.idpasajero = map['idpasajero'];
    this.nombre = map['nombre'];
    this.password = map['password'];
    this.direccion = map['direccion'];
    this.direccioncorreo = map['direccioncorreo'];
    this.dni = map['dni'];
    this.telefono = map['telefono'];
  }

  //Metodos

  loginUsuario() async {
    var conn = await Database().conexion();
    try {
      var resultado = await conn
          .query('SELECT * FROM pasajeros WHERE nombre = ?', [this.nombre]);
      Pasajero usuario = Pasajero.fromMap(resultado.first);
      if (this.password == usuario.password) {
        return usuario;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    } finally {
      await conn.close();
    }
  }

  insertarpasajero() async {
    var conn = await Database().conexion();
    try {
      await conn.query(
          'INSERT INTO pasajeros(nombre,apellido,password,direccion,direccioncorreo,dni,telefono) VALUES (?,?,?,?,?,?,?)',
          [
            nombre,
            apellido,
            password,
            direccion,
            direccioncorreo,
            dni,
            telefono,
          ]);
      print('Usuario insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}