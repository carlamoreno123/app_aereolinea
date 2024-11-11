import 'Vuelo.dart';
import 'app.dart';

  class Billete extends Vuelo {
  //propiedades
  int?idbillete;
  String? vuelo;
  String? pasajero;
  double?precio;
  DateTime?horallegada;
  
  //Constructor
  Billete();
  Billete.fromMap(map) {
    this.idbillete = map['idbillete'];
    this.vuelo = map['vuelo'];
    this.pasajero = map['pasajero'];
    this.precio = map['precio'];
    this.horallegada = map['horallegada'];
   
  }

  //metodos
  static Billete comprarBillete({
    required Vuelo vuelo,
    required String pasajero,
    required double precio,
  }) {
    // Lógica para procesar la compra del billete
    print("Compra de billete realizada para el vuelo de ${vuelo.origen} a ${vuelo.destino}.");
    print("Pasajero: $pasajero, Precio: \$$precio");

    // Crear un objeto de Billete con la información del vuelo
    return Billete(
      vuelo,pasajero,precio
    );
  }
}
  
