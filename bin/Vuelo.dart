import 'dart:io';
import 'app.dart';

class Vuelo {
  //propiedades
  int? idvuelo;
  int? idasiento;
  int? numerovuelo;
  String? origen;
  String? destino;
  DateTime? fecha;
  DateTime? horasalida;
  DateTime? horallegada;
  String? modeloavion;

  
  //Constructor
  Vuelo();
  Vuelo.fromMap(map) {
    this.idvuelo = map['idvuelo'];
    this.idasiento = map['idasiento'];
    this.numerovuelo = map['numerovuelo'];
    this.origen = map['origen'];
    this.destino = map['destino'];
    this.fecha = map['fecha'];
    this.horasalida = map['horasalida'];
    this.horallegada = map['horallegada'];
    this.modeloavion = map['modeloavion'];
  }
  



}
